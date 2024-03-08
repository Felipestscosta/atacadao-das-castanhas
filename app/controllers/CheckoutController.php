<?php
require_once(__DIR__ .'/../library/PagSeguroLibrary.php');
class CheckoutController extends ControllerBase{

     public $ref = null;     
    
    function initialize(){
        $this->cart = new ShoppingCart("myShop");
        $this->ref =  md5((new DateTime())->getTimestamp().rand(1,10000000000));  
        $empresa = Configuracoes::findFirst();  
        $this->view->setVar("banners",Banners::find([['local'=> 'P'], 'sort'=> array('ordem' => 1)]));    
    }
    
    public function indexAction()
    {             
        parent::verificacarrinho();
        $this->assets        
            ->addCss('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css',false)        
            ->addCss('validate/css/style.css',true)
            ->addCss('{{this.url.getBaseUri()}}css/checkout.css',true)
            ->addCss('css/custom.css',true);
        $this->assets
            ->addJs('https://code.jquery.com/jquery-3.2.1.js',false)
            ->addJs('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js',false)
            ->addJs('js/scripts_carrinho.js')
            //->addJs('js/eModal.min.js',true)
            ->addJs('https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js',false)
            ->addJs('js/scripts_checkout_pagseguro.js',true)

            ->addJs('validate/js/validator.js',true)
            ->addJs('js/scripts_checkout_pagseguro.js',true)
            ->addJs('https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js',true);

        $this->view->setTemplateAfter('_bodycheck');

        $this->view->setVar("todascategorias",Categorias::find(['limit'=> 7,'sort'=> array('categoria_nome' => 1)])); 
        $this->view->setVar("categorias",Categorias::find(['limit'=> 8,'sort'=> array('categoria_nome' => 1)]));
        $this->view->setVar("cliente", Clientes::findFirst([['email'=> $this->session->get("email")]]));
        $this->view->setVar("conteudo_carrinho", $this->cart->getContent()); 
        $this->view->setVar("total_carrinho", str_replace(',','.',number_format($this->cart->getTotal(), 2, '.', '')));  
        $totalfreteprodutos = $this->cart->getTotal() + $_SESSION['frete'];     
        $this->view->setVar("gerarparcelas", str_replace(',','.',number_format($totalfreteprodutos, 2, '.', '')));   
        $this->view->setVar('ativo', Configuracoes::findFirst()->preferencias_de_pagamentos); 
        $user = Clientes::findFirst([['email'=> $this->session->get("email")]]);        
        //$id = rand(9999,99);
        //TUTORIAL EM 
        //https://github.com/pagseguro/php/blob/master/source/examples/checkout/createPaymentRequest.php
        //https://pagseguro.uol.com.br/v3/guia-de-integracao/tutorial-da-biblioteca-pagseguro-em-php.html#!rmcl
        $paymentRequest = new PagSeguroPaymentRequest();
        $paymentRequest->setCurrency("BRL"); 
        foreach ($this->cart->getContent() as $product){
            $paymentRequest->addItem(
                $product["id"],
                $product["name"],
                $product["qty"],
                $product["price"]
            );
        }
        if(isset($user) && (!empty($user))){
            if(!empty($user->telefone)){
                $ddd = substr($user->telefone, 0,2);
                $telefone = substr($user->telefone, 2);
            }
            else{
                $ddd = substr($user->celular, 0,2);
                $telefone = substr($user->celular, 2);
            }      
        
            if(isset($user->cnpj)){
                $numdoc = $user->cnpj;
            }
            
            $paymentRequest->setReference("REF".$this->ref); 
            $paymentRequest->setSender(  
            $user->nome, 
            $ddd,
            $telefone,
            $user->documento, 
            $numdoc  
            ); 

            $paymentRequest->setShippingAddress(
                $user->endereco,
                $user->numero,
                $user->bairro,
                str_replace("-","",$user->cep),
                $user->cidade,
                $user->estado,
                'BRA',
                isset($user->referencia) ? $user->referencia : ''
            );            
        }
        // URL para onde o comprador será redirecionado (GET) após o fluxo de pagamento  
        $paymentRequest->setRedirectUrl("{{ this.url.getBaseUri() }}");  
        
        // URL para onde serão enviadas notificações (POST) indicando alterações no status da transação  
        $paymentRequest->addParameter('notificationURL', '{{ this.url.getBaseUri() }}checkout/notificacao_pag_seguro');          
                
        //$paymentRequest->acceptPaymentMethodGroup('CREDIT_CARD', 'BOLETO');      
        //$paymentRequest->excludePaymentMethodGroup('BOLETO', 'BOLETO'); 
        $empresa = Configuracoes::findFirst()->preferencias_de_pagamentos;
        $sandBox = $empresa['sandbox']; // Valida Produção         
       
        if ($sandBox == 1) {
           $autentica = PagSeguroConfig::getAccountCredentials(); // getApplicationCredentials()
        } else {
            $autentica = new PagSeguroAccountCredentials("{$empresa['email_sandbox']}", "{$empresa['token_sandbox']}");
        }             
        
        try {    
        //$credentials = PagSeguroConfig::getAccountCredentials(); // getApplicationCredentials()      
        $sessionId = PagSeguroSessionService::getSession($autentica);        
        $this->view->pagsession = $sessionId;            
        } catch (PagSeguroServiceException $e) {  
            die(print_r($e->getMessage()));  
        }        
        $this->view->id = $this->ref;       
    }
    
    public function simulacaofreteAction() {
      $frete = Produtos::simulafrete($_POST);
    }
    
    public function novoenderecoAction() {
        // Nenhuma Informação
    }
    

    public function sucessoAction(){
        $this->view->setTemplateAfter('_bodycheck');
        parent::verificalogin();
        $this->assets
             ->addCss('css/tabbed.css',true) 
             ->addCss('css/blue.css',true)
             ->addCss('css/tabbed.css',true)
             ->addCss('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css', false);
        $this->assets 
             ->addJs('js/jquery.mask.min.js',true)
             ->addJs('js/scripts_minhaconta.js',true)
            ->addJs('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js', false);     
        //$this->view->setVar("minhascompras",Compras::find(array('conditions' => array('cliente' => "{$this->session->get('id')}"))));
        $this->view->setVar("minhascompras",Compras::find([ ['cliente' => $this->session->get('id') ],'sort'=> array('_id' => -1) ] ) );
    }


    public function inserenovoendAction() {
        $endereco = Clientes::novoendereco($_POST);
        $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode($endereco));
        return $this->response->send();
    }
    
    public function dadosenderecoAction() {
        Clientes::enderecos();
    }
    
    public function fretecheckoutAction() { 
        if(isset($_SESSION['frete_simulacao'])){            
           //$frete = Produtos::fretecheckout(array('cep' => $_SESSION['frete_simulacao']));
            $cidades = Restricoes::findFirst([["status" => 1]]);           
            if((isset($cidades->cidades)) && (!empty($cidades->cidades))){
                Produtos::verificaRestricoes($_SESSION['frete_simulacao'],$cidades->cidades);
            }
            else{
                Produtos::verificaGratis($_SESSION['frete_simulacao']);
            }  
           //$frete = Produtos::webServiceCorreios($_SESSION['frete_simulacao']);
       }
    }

    public function cieloAction(){                
        $data = Pagamentos::cielo_compra($_POST);
        $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode($data));
        return $this->response->send();            
    }
    
    // Parcelas quando utilizar cielo, no pagseguro já vem da API
    public function parcelastotalgeralAction(){ 
                if(isset($_SESSION['frete'])){
                    $frete_mais_compras  = ($this->cart->getTotal()) + ($_SESSION['frete']);
                }
                if(isset($_SESSION['cupom'])){
                    $valor = ($frete_mais_compras) - $_SESSION['cupom'];
                }else{
                    $frete = isset($_SESSION['frete']) ? $_SESSION['frete'] : 0;
                    $valor = $_POST['total'] ;
                }

                $empresa = Configuracoes::findFirst()->preferencias_de_pagamentos;
                $maximo_parcelas = $empresa['maximo_parcelas'];
                $parcela_minima = number_format($empresa['parcela_minima'],2,'.',',');
                $parcelas_sem_juros =  $empresa['sem_juros'];
                $juros = (float)$empresa['juros'];
                $moeda_da_loja = 'R$ ';
                $tipo_de_calculo = 0;                         
                
                $preco_numero = str_replace(',', '.',  str_replace($moeda_da_loja, "", strip_tags($valor)));                

                if ($preco_numero >= $parcela_minima * 2) {   
                // Exibicao das parcelas
                for ($p = 1; $p <= $maximo_parcelas; $p++) {
                  // Se a parcela nao tiver juros
                  if ($p <= $parcelas_sem_juros) {
                    $valor_parcela = $preco_numero / $p;
                  }
                  // Se a parcela tiver juros
                  if ($p > $parcelas_sem_juros) {
                        if ($tipo_de_calculo == 0) {
                             $valor_parcela = ($preco_numero * pow(1+($juros/100), $p))/$p;
                        }
                        if ($tipo_de_calculo == 1) {                         
                              $valor_parcela = ($preco_numero * ($juros/100))/(1-(1/(pow(1+($juros/100), $p))));           
                        }
                  }

                  // Escreve a parcela se ela for maior do que a parcela minima
                  if ($valor_parcela >= $parcela_minima) {
                        $valor_parcela = number_format($valor_parcela, 2, ',', '.');
                        if ($p <= $parcelas_sem_juros) {
                            $parcelas[] = array('parcela' => $p, 'valor' => $valor_parcela, 'tipo' => 'sem juros');                         
                        } else {
                             $parcelas[] = array('parcela' => $p, 'valor' => $valor_parcela, 'tipo' => 'com juros');                          
                        }
                  }
                 
                }                      

                    $dados = "<select id='selectbasic' name='parcelas' class='noborder' required>";
                    $dados .= "<option value='{$parcelas[0]['parcela']}'>{$parcelas[0]['parcela']} x - R$ {$parcelas[0]['valor']} {$parcelas[0]['tipo']}</option>";
                    for($i = 1; $i < count($parcelas); $i++){
                        $dados .="<option value='{$parcelas[$i]['parcela']}'>{$parcelas[$i]['parcela']} x  R$ {$parcelas[$i]['valor'] } {$parcelas[$i]['tipo'] }</option>";
                    }
                    $dados .="</select>";               
                    echo $dados;
                } 
                else{
                    $dados = "<select id='selectbasic' name='parcelas' class='form-control noborder' required>";
                    $dados .="<option value='1'>1 X {$valor}</option>";
                    $dados .="</select>";
                    echo $dados;
                }

                // echo "<br/>";
                // if ($parcelas_sem_juros < $maximo_parcelas) {
                //   $juros = number_format($juros, 2, ',', '.');
                //   echo '<span style="font-size: smaller;">Juros de ' . $juros . '% ao m&ecirc;s</span>';
                // }
                // if ($parcela_minima > 0) {
                //   $parcela_minima = number_format($parcela_minima, 2, ',', '.');
                //   echo '<br /><span style="font-size: smaller;">Parcela m&iacute;nima de ' . $moeda_da_loja . $parcela_minima . '</span>';
                // }

    } 

    public function pagamentoPixAction(){
        $this->view->disable(); 
    
        $this->view->titulopagina = "Checkout";  
        $ativo = Configuracoes::findFirst();    
        $cliente = Clientes::findById($this->session->get("id"));        
        $endereco = array(
                    'endereco'          => $_POST['endereco'],
                    'cep'               => $_POST['cep'],
                    'complemento'       => (isset($_POST['complemento'])) ? $_POST['complemento'] : '',
                    'numero'            => $_POST['numero'],
                    'cidade'            => $_POST['cidade'],
                    'estado'            => $_POST['estado'],
                    'bairro'            => $_POST['bairro']                
            );
              
        $cliente->cnpj = str_replace(".", "", $cliente->cnpj);
        $cliente->cnpj = str_replace("-", "", $cliente->cnpj);
        if(!empty($cliente->telefone)){
            preg_match('/^.*(?<ddd>[1-9][0-9]).*(?<prefixo>\d{4}).*(?<sufixo>\d{4})$/' , $cliente->telefone , $partes);  
             $ddd = $cliente->telefone;
        }
       else{
            preg_match('/^.*(?<ddd>[1-9][0-9]).*(?<prefixo>\d{4}).*(?<sufixo>\d{4})$/' , $cliente->celular , $partes);  
             $ddd = $cliente->celular;
        }
        
        $valor = $this->cart->getTotal();
        $valor = str_replace(",", ".", $valor);
        $valor = number_format($valor, 2, '.', '');       

        if(isset($cliente->complemento)){
            $complemento = $cliente->complemento;
        }
        else{
            $complemento = 'Não possui';
        } 

        if((isset($_SESSION['cupom'])) && (!empty($_SESSION['cupom']))){
            $cupom = '-'.number_format($_SESSION['cupom'],2,'.','');
        }
        else{
            $cupom = '0.00';
        }  
        if((isset($_POST['pix_cpf_cnpj'])) && (!empty($_POST['pix_cpf_cnpj']))){
            $cadpix = $_POST['pix_cpf_cnpj'];
        }
        if((isset($_POST['pix_email'])) && (!empty($_POST['pix_email']))){
            $cadpix = $_POST['pix_email'];
        }
        if((isset($_POST['pix_telefone'])) && (!empty($_POST['pix_telefone']))){
            $cadpix = $_POST['pix_telefone'];
        }

        if((isset($_SESSION['id'])) && (!empty($_SESSION['id']))){
            $compra = new Compras();
            $compra->entrega     = $endereco; 
            $compra->mensagem    = array('0' => 'Pix - Aguardando conferência');
            $compra->tipopagamento    = 'Pix';           
            $compra->frete       = isset($_SESSION['frete']) ? $_SESSION['frete'] : '';
            $compra->tipo_frete  = isset($_SESSION['tipo_frete']) ? $_SESSION['tipo_frete'] : '';
            $compra->pix         = isset($_POST['pix']) ? $_POST['pix'] : '';
            $compra->pix_identificacao  = $cadpix;
            $compra->valor_total = (float)$_POST['total_compras'];
            $compra->itens       = $_SESSION['myShop'];
            $compra->cliente     = $_SESSION['id'];    
            $compra->status = 'Aguardando conferência';         
            $compra->save();         


            if((isset($_SESSION['cupom_numero'])) && (!empty($_SESSION['cupom_numero']))){
                $cliente->cupons[] = $_SESSION['cupom_numero'];
                $cliente->save();

                $contabilizacupom = Cupons::findFirst(
                    [
                        'conditions' => [
                            'cupom' => $_SESSION['cupom_numero']
                        ]
                    ]
                ); 

                $contabilizacupom->quantidade = ($contabilizacupom->quantidade -1);
                $contabilizacupom->utilizado = ($contabilizacupom->utilizado +1);
                $contabilizacupom->save();  
            }    

            Pagamentos::reduzestoque($compra);    
            Pagamentos::notificaEmailCompra($compra,$_SESSION);           
            $this->response->setHeader("Content-Type", "application/json");
            $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode(['status'=>true])); 
            return $this->response->send();  
        } 
        else{
            $this->response->setHeader("Content-Type", "application/json");
            $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode(['status'=>false])); 
            return $this->response->send();  
        }            
    }
    
    public function pagamentoEntregaAction(){
        $this->view->disable();      
    
        $this->view->titulopagina = "Checkout";  
        $ativo = Configuracoes::findFirst();    
        $cliente = Clientes::findById($this->session->get("id"));        
        $endereco = array(
                    'endereco'          => $_POST['endereco'],
                    'cep'               => $_POST['cep'],
                    'complemento'       => (isset($_POST['complemento'])) ? $_POST['complemento'] : '',
                    'numero'            => $_POST['numero'],
                    'cidade'            => $_POST['cidade'],
                    'estado'            => $_POST['estado'],
                    'bairro'            => $_POST['bairro']                
            );
              
        $cliente->cnpj = str_replace(".", "", $cliente->cnpj);
        $cliente->cnpj = str_replace("-", "", $cliente->cnpj);
        if(!empty($cliente->telefone)){
            preg_match('/^.*(?<ddd>[1-9][0-9]).*(?<prefixo>\d{4}).*(?<sufixo>\d{4})$/' , $cliente->telefone , $partes);  
             $ddd = $cliente->telefone;
        }
       else{
            preg_match('/^.*(?<ddd>[1-9][0-9]).*(?<prefixo>\d{4}).*(?<sufixo>\d{4})$/' , $cliente->celular , $partes);  
             $ddd = $cliente->celular;
        }
        
        $valor = $this->cart->getTotal();
        $valor = str_replace(",", ".", $valor);
        $valor = number_format($valor, 2, '.', '');       

        if(isset($cliente->complemento)){
            $complemento = $cliente->complemento;
        }
        else{
            $complemento = 'Não possui';
        } 

        if((isset($_SESSION['cupom'])) && (!empty($_SESSION['cupom']))){
            $cupom = '-'.number_format($_SESSION['cupom'],2,'.','');
        }
        else{
            $cupom = '0.00';
        }   
        if((isset($_SESSION['id'])) && (!empty($_SESSION['id']))){
            $compra = new Compras();
            $compra->entrega     = $endereco; 
            $compra->mensagem    = array('0' => 'Aguardando pagamento');
            $compra->tipopagamento    = 'Pagamento na entrega'; 
            $compra->frete       = isset($_SESSION['frete']) ? $_SESSION['frete'] : '';
            $compra->tipo_frete  = isset($_SESSION['tipo_frete']) ? $_SESSION['tipo_frete'] : '';
            $compra->tid         = $this->ref;
            $compra->valor_total = (float)$_POST['totalcompras'];
            $compra->itens       = $_SESSION['myShop'];
            $compra->cliente     = $_SESSION['id'];    
            $compra->status = 'Aguardando pagamento';         
            $compra->save();         


            if((isset($_SESSION['cupom_numero'])) && (!empty($_SESSION['cupom_numero']))){
                $cliente->cupons[] = $_SESSION['cupom_numero'];
                $cliente->save();

                $contabilizacupom = Cupons::findFirst(
                    [
                        'conditions' => [
                            'cupom' => $_SESSION['cupom_numero']
                        ]
                    ]
                ); 

                $contabilizacupom->quantidade = ($contabilizacupom->quantidade -1);
                $contabilizacupom->utilizado = ($contabilizacupom->utilizado +1);
                $contabilizacupom->save();  
            }    

            Pagamentos::reduzestoque($compra);    
            Pagamentos::notificaEmailCompra($compra,$_SESSION);           
            $this->response->setHeader("Content-Type", "application/json");
            $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode(['status'=>true])); 
            return $this->response->send();  
        } 
        else{
            $this->response->setHeader("Content-Type", "application/json");
            $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode(['status'=>false])); 
            return $this->response->send();  
        }            
    }

    public function pagamentoBoletoAction(){
        $this->view->disable();    
        $this->view->titulopagina = "Checkout";  
        $empresa = Configuracoes::findFirst()->preferencias_de_pagamentos;
        $sandBox = $empresa['sandbox']; // Valida Produção         
        
        if ($sandBox == 1) {         
            $emailPagseguro = $empresa['email'];
            $tokenPagseguro = $empresa['token'];
            $urlNotificacao =  $this->url->getBaseUri() ."checkout/notificacao_pag_seguro";
            $scriptPagseguro = "https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js";
            $urlPagseguro = "https://ws.pagseguro.uol.com.br/v2/";
        } else {
            $emailPagseguro = $empresa['email_sandbox'];
            $tokenPagseguro = $empresa['token_sandbox'];
            $urlNotificacao = $this->url->getBaseUri() ."checkout/notificacao_pag_seguro";
            $scriptPagseguro = "https://stc.sandbox.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js";
            $urlPagseguro = "https://ws.sandbox.pagseguro.uol.com.br/v2/";
        } 

        $cliente = Clientes::findById($this->session->get("id")); 
       
        $endereco = array(
                    'endereco'          => $_POST['endereco'],
                    'cep'               => $_POST['cep'],
                    'complemento'       => (isset($_POST['complemento'])) ? $_POST['complemento'] : '',
                    'numero'            => $_POST['numero'],
                    'cidade'            => $_POST['cidade'],
                    'estado'            => $_POST['estado'],
                    'bairro'            => $_POST['bairro']                
            );
        

        if($_SESSION['tipo_frete'] == 'PAC'){$cost = 1;}
        else if($_SESSION['tipo_frete'] == 'SEDEX'){$cost = 2;}
        else{$cost = 3;}
        
    
        if((isset($_POST['cardCPF']))&&(!empty($_POST['cardCPF']))){
            $_POST['cardCPF'] = str_replace(".", "", $_POST['cardCPF']);
            $_POST['cardCPF'] = str_replace("-", "", $_POST['cardCPF']);
        }       

        $cliente->cnpj = str_replace(".", "", $cliente->cnpj);
        $cliente->cnpj = str_replace("-", "", $cliente->cnpj);
        if(!empty($cliente->telefone)){
            preg_match('/^.*(?<ddd>[1-9][0-9]).*(?<prefixo>\d{4}).*(?<sufixo>\d{4})$/' , $cliente->telefone , $partes);  
             $ddd = $cliente->telefone;
        }
       else{
            preg_match('/^.*(?<ddd>[1-9][0-9]).*(?<prefixo>\d{4}).*(?<sufixo>\d{4})$/' , $cliente->celular , $partes);  
             $ddd = $cliente->celular;
        }
        
        $valor = $this->cart->getTotal();
        $valor = str_replace(",", ".", $valor);
        $valor = number_format($valor, 2, '.', '');
        
        $teste = new Geraxml;

        if(isset($cliente->complemento)){
            $complemento = $cliente->complemento;
        }
        else{
            $complemento = 'Não possui';
        } 

        if((isset($_SESSION['cupom'])) && (!empty($_SESSION['cupom']))){
            $cupom = '-'.number_format($_SESSION['cupom'],2,'.','');
        }
        else{
            $cupom = '0.00';
        }  

        $xml = $teste->gerarXmlBoleto($this->cart->getContent(),  $this->ref, $cliente->nome.' '.$cliente->sobrenome, $cliente->cnpj, $partes['ddd'], $partes['prefixo'].$partes['sufixo'], $cliente->email, $_POST['senderHash'], $cliente->endereco, $cliente->numero, $complemento, $cliente->bairro, str_replace('-','',$cliente->cep), $cliente->cidade, $cliente->estado, $_SESSION['frete'], $cost, $cupom, $urlNotificacao, $emailPagseguro);
    
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $urlPagseguro . "transactions/?email=" . $emailPagseguro . "&token=" . $tokenPagseguro);
        curl_setopt($ch, CURLOPT_POST, true );
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/xml; charset=ISO-8859-1'));
        $data = curl_exec($ch);        
        $dataXML = simplexml_load_string($data);       
        $arr = json_decode(json_encode($dataXML), 1);  
        $erro = Pagseguro::find(); 
        
        if (empty($dataXML->paymentLink)) {   
            header('Content-Type: application/json; charset=UTF-8');          
        // $errosOcorridos = array('erro' => '1');
            if(isset($arr['error'][0])){  
                    for($i=0;$i<count($arr['error']);$i++){
                        foreach($erro as $key => $value){
                                if($value->codigo == $arr['error'][$i]['code']){   
                                    $response['error'][] = array(
                                        'code' => $value->codigo,
                                        'mensagem' => $value->mensagem,                                   
                                        'status' => true
                                    );                                     
                                }                                    
                        } 
                    }                              
            }
            else{
                
                foreach($erro as $key => $value){
                                if($value->codigo == $arr['error']['code']){   
                                    $response['error'][] = array(
                                        'code' => $value->codigo,
                                        'mensagem' => $value->mensagem,                                   
                                        'status' => true
                                    );                                     
                                }                                      
                        }
            } 
            return $this->response->setJsonContent($response);       
           // echo json_encode($response);
        } else {
            header('Content-Type: application/json; charset=UTF-8');           
            $arr = json_decode(json_encode($dataXML), 1);   

             if($arr['status'] == 1){
                $transactionStatus = 'Aguardando pagamento';
            } elseif($arr['status'] == 2){
                $transactionStatus = 'Em análise';
            } elseif($arr['status'] == 3){ // :)
                $transactionStatus = 'Paga';
            } elseif($arr['status'] == 4){ // :D
                $transactionStatus = 'Disponível';
            } elseif($arr['status'] == 5){
                $transactionStatus = 'Concluido';
            } elseif($arr['status'] == 6){
                $transactionStatus = 'Devolvida';
            } elseif($arr['status'] == 7){
                $transactionStatus = 'Cancelada';
            }                     

            $compra = new Compras();
            $compra->entrega     = $endereco; 
            $compra->mensagem    = array('0' => $transactionStatus);
            $compra->tipopagamento    = 'Pagseguro'; 
            $compra->frete       = $_SESSION['frete'];
            $compra->tipo_frete  = $_SESSION['tipo_frete'];
            $compra->tid         = $this->ref;
            $compra->valor_total = (float)$_POST['totalcompras'];
            $compra->itens       = $_SESSION['myShop'];
            $compra->cliente     = $_SESSION['id'];  
            $compra->codigo_transacao = $arr['code'];    
            $compra->status = $transactionStatus;  
            $compra->urlboleta = $arr['paymentLink'];
            $compra->observacao_pedido = $_POST['observacao_pedido'];            
            $compra->save();         

            if((isset($_SESSION['cupom_numero'])) && (!empty($_SESSION['cupom_numero']))){
                $cliente->cupons[] = $_SESSION['cupom_numero'];
                $cliente->save();

                $contabilizacupom = Cupons::findFirst(
                    [
                        'conditions' => [
                            'cupom' => $_SESSION['cupom_numero']
                        ]
                    ]
                ); 

                $contabilizacupom->quantidade = ($contabilizacupom->quantidade -1);
                $contabilizacupom->utilizado = ($contabilizacupom->utilizado +1);               
                $contabilizacupom->save();  
            }    
            Pagamentos::reduzestoque($compra);   
            Pagamentos::notificaEmailCompra($compra,$_SESSION);
            return $this->response->setJsonContent($dataXML);
        }          
        curl_close($ch);  
    }

    //PAGSEGURO PAGAMENTO CARTAO
    public function pagamentoCartaoAction(){
        $this->view->disable();
        $this->view->titulopagina = "Checkout";          

        $empresa = Configuracoes::findFirst()->preferencias_de_pagamentos;
        
        $sandBox = $empresa['sandbox']; // Valida Produção  
        if ($sandBox == 1) {         
            $emailPagseguro = $empresa['email'];
            $tokenPagseguro = $empresa['token'];
            $urlNotificacao = $this->url->getBaseUri()."checkout/notificacao_pag_seguro";
            $scriptPagseguro = "https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js";
            $urlPagseguro = "https://ws.pagseguro.uol.com.br/v2/";
        } else {
            $emailPagseguro = $empresa['email_sandbox'];
            $tokenPagseguro = $empresa['token_sandbox'];
            $urlNotificacao = $this->url->getBaseUri()."checkout/notificacao_pag_seguro";
            $scriptPagseguro = "https://stc.sandbox.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js";
            $urlPagseguro = "https://ws.sandbox.pagseguro.uol.com.br/v2/";
        }   

        $cliente = Clientes::findById($this->session->get("id")); 
        $endereco = array(
                    'endereco'          => $_POST['endereco'],
                    'cep'               => $_POST['cep'],
                    'complemento'       => (isset($_POST['complemento'])) ? $_POST['complemento'] : '',
                    'numero'            => $_POST['numero'],
                    'cidade'            => $_POST['cidade'],
                    'estado'            => $_POST['estado'],
                    'bairro'            => $_POST['bairro']                
            );
        

        if($_SESSION['tipo_frete'] == 'PAC'){$cost = 1;}
        else if($_SESSION['tipo_frete'] == 'SEDEX'){$cost = 2;}
        else{$cost = 3;}
  
    
        if((isset($_POST['cardCPF']))&&(!empty($_POST['cardCPF']))){
            $_POST['cardCPF'] = str_replace(".", "", $_POST['cardCPF']);
            $_POST['cardCPF'] = str_replace("-", "", $_POST['cardCPF']);
        }
        
        $cliente->cnpj = str_replace(".", "", $cliente->cnpj);
        $cliente->cnpj = str_replace("-", "", $cliente->cnpj);

        $valor = $this->cart->getTotal();
        $valor = str_replace(",", ".", $valor);
        $valor = number_format($valor, 2, '.', '');

        if (!(isset($_POST['valorParcelas'])) || empty($_POST['valorParcelas'])) {
            $_POST['valorParcelas'] = $valor;
        }
        if (!(isset($_POST['numParcelas'])) || empty($_POST['numParcelas'])) {
            $_POST['numParcelas'] = 1;
        }
        $_POST['valorParcelas'] = (number_format($_POST['valorParcelas'], 2));
        $valorparcelas = str_replace(",", ".", $_POST['valorParcelas']);
        $numparcelas = intval($_POST['numParcelas']) > 1 ? intval($_POST['numParcelas']) : 2;

        if(isset($cliente->complemento)){
            $complemento = $cliente->complemento;
        }
        else{
            $complemento = 'Não possui';
        } 

        if((isset($_SESSION['cupom'])) && (!empty($_SESSION['cupom']))){
            $cupom = '-'.number_format($_SESSION['cupom'],2,'.','');
        }
        else{
            $cupom = '0.00';
        }   

        $ddd = "";
        if (preg_match('/\((\d{2})\)/', $_POST['cardFoneNum'], $matches)) {
            $ddd = $matches[1];
        }

        $empresa_dados = Configuracoes::findFirst();
        $celular_formatado = substr(preg_replace('/[^0-9]/', '', $_POST['cardFoneNum']), 3);
        
        $email_pagseguro = $emailPagseguro;
        $token_aplicacao_pagseguro = $empresa['token'];
        $aunteticacao_basica_64 = base64_encode($email_pagseguro.":".$token_aplicacao_pagseguro);
        $hash_cliente = $_POST['senderHash'];
        $referencia = $this->ref;
        $url_notificacao = $urlNotificacao;

        $descricao_produto = "Alimentos, castanhas, temperos, chás, farinhas e etc...";
        $valor_compra = $_POST['totalcompras'];
        $quantidade_produto = "1";

        $nome_cliente = $cliente->nome.' '.$cliente->sobrenome;
        $data_nascimento_cliente = $_POST['cardNasc'];
        $cpf_cliente = $_POST['cardCPF'];
        $ddd_celular_cliente = $ddd;
        $numero_celular_cliente = $celular_formatado;
        $email_cliente = $cliente->email;
        $cartao_credito_encriptado = $_POST['cardToken'];

        $quantidade_parcela = $numparcelas;
        $quantidade_sem_juros_parcela = 12;
        $valor_parcela = number_format($_POST['valorTotalParcela'] / $quantidade_parcela, 2, ".","");
        $valor_soma_total_parcela = number_format($_POST['valorTotalParcela'], 2, ".","");

        $cep_vendedor = $empresa_dados->cep;
        $numero_endereco_vendedor = "55";
        $endereco_vendedor = $empresa_dados->endereco;
        $cidade_vendedor = $empresa_dados->cidade;
        $estado_vendedor = $empresa_dados->estado;
        $bairro_vendedor = $empresa_dados->bairro;

        // $totalcompras = $_POST['totalcompras'];
        // echo "Valor da parcela: ".$valor_parcela."(".gettype($valor_parcela).")"."<br>";
        // echo "Quantidade de parcelas: ".$quantidade_parcela."(".gettype($quantidade_parcela).")"."<br>";
        // echo "----------------------";
        // echo "Valor somado parcela: ".$valor_soma_total_parcela."(".gettype($valor_soma_total_parcela).")"."<br>";
        // exit;
        
        // API NOVA PAGSEGURO
        $curl = curl_init();
        curl_setopt_array($curl, [
        CURLOPT_URL => "https://ws.pagseguro.uol.com.br/v2/transactions",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS => "email=$email_pagseguro
        &token=$token_aplicacao_pagseguro
        &paymentMode=default
        &paymentMethod=creditCard
        &receiverEmail=$email_pagseguro
        &currency=BRL
        &itemId1=1
        &itemDescription1=$descricao_produto
        &itemAmount1=$valor_soma_total_parcela
        &itemQuantity1=$quantidade_produto
        &notificationURL=$url_notificacao
        &reference=$referencia
        &senderName=$nome_cliente
        &senderCPF=$cpf_cliente
        &senderAreaCode=$ddd_celular_cliente
        &senderPhone=$numero_celular_cliente
        &senderEmail=$email_cliente
        &senderHash=$hash_cliente
        &shippingAddressRequired=false
        &creditCardToken=$cartao_credito_encriptado
        &installmentQuantity=$quantidade_parcela
        &installmentValue=$valor_parcela
        &noInterestInstallmentQuantity=$quantidade_parcela
        &billingAddressPostalCode=$cep_vendedor
        &billingAddressCountry=BRA
        &billingAddressNumber=$numero_endereco_vendedor
        &billingAddressStreet=$endereco_vendedor
        &billingAddressCity=$cidade_vendedor
        &billingAddressState=$estado_vendedor
        &billingAddressDistrict=$bairro_vendedor
        &creditCardHolderName=$nome_cliente
        &creditCardHolderBirthDate=$data_nascimento_cliente
        &creditCardHolderAreaCode=$ddd_celular_cliente
        &creditCardHolderPhone=$numero_celular_cliente
        &creditCardHolderCPF=$cpf_cliente",
        CURLOPT_HTTPHEADER => [
            "Authorization: $aunteticacao_basica_64",
            "Content-Type: application/x-www-form-urlencoded",
            "charset: UTF-8"
        ],
        ]);

        
        $response = curl_exec($curl);
        $err = curl_error($curl);

        
        echo "<pre>";print_r($response);
        echo "-----------------------";
        echo "<pre>";print_r($err);
        exit;
        

        curl_close($curl);

        $arr = "";
        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            $dataXML = simplexml_load_string($response);
            $arr = json_decode(json_encode($dataXML), 1);     
        }
        // FIM API NOVA PAGSEGURO

        // API ANTIGA PAGSEGURO
        // $ch = curl_init();
        // curl_setopt($ch, CURLOPT_URL, $urlPagseguro . "transactions/?email=" . $emailPagseguro . "&token=" . $tokenPagseguro);
        // curl_setopt($ch, CURLOPT_POST, true );
        // curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        // curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
        // curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/xml; charset=ISO-8859-1'));
        // $data = curl_exec($ch);  
        // $dataXML = simplexml_load_string($data);  
        // $arr = json_decode(json_encode($dataXML), 1);     
        // $erro = Pagseguro::find();
       
        header('Content-Type: application/json; charset=UTF-8');  
        $response = array();   
        if(isset($arr['code'])){
            if($arr['status'] == 1){
                $transactionStatus = 'Aguardando pagamento';
            } else if($arr['status'] == 2){
                $transactionStatus = 'Em análise';
            } else if($arr['status'] == 3){ // :)
                $transactionStatus = 'Paga';
            } else if($arr['status'] == 4){ // :D
                $transactionStatus = 'Disponível';
            } else if($arr['status'] == 5){
                $transactionStatus = 'Concluido';
            } else if($arr['status'] == 6){
                $transactionStatus = 'Devolvida';
            } else if($arr['status'] == 7){
                $transactionStatus = 'Cancelada';
            }   

            $compra = new Compras();
            $compra->entrega     = $endereco; 
            $compra->mensagem    = array('0' => $transactionStatus);
            $compra->tipopagamento    = 'Pagseguro'; 
            $compra->frete       = isset($_SESSION['frete']) ? $_SESSION['frete'] : '';
            $compra->tipo_frete  = isset($_SESSION['tipo_frete']) ? $_SESSION['tipo_frete'] : '';
            $compra->tid         = $this->ref;
            $compra->valor_total = (float)$_POST['totalcompras'];
            $compra->itens       = $_SESSION['myShop'];
            $compra->cliente     = $_SESSION['id'];          
            $compra->codigo_transacao = $arr['code'];    
            $compra->status = $transactionStatus;   
            $compra->observacao_pedido = $_POST['observacao_pedido'];       
            $compra->save();

            if((isset($_SESSION['cupom_numero'])) && (!empty($_SESSION['cupom_numero']))){
                $cliente->cupons[] = $_SESSION['cupom_numero'];
                $cliente->save();

                $contabilizacupom = Cupons::findFirst(
                    [
                        'conditions' => [
                            'cupom' => $_SESSION['cupom_numero']
                        ]
                    ]
                ); 

                $contabilizacupom->quantidade = ($contabilizacupom->quantidade -1);
                $contabilizacupom->utilizado = ($contabilizacupom->utilizado +1);
                $contabilizacupom->save();  
            }             

            Pagamentos::reduzestoque($compra);
            Pagamentos::notificaEmailCompra($compra,$_SESSION);            
            return $this->response->setJsonContent($dataXML);   
        }else{           
            if(isset($arr['error'][0])){              
                for($i=0;$i<count($arr['error']);$i++){
                    foreach($erro as $key => $value){
                            if($value->codigo == $arr['error'][$i]['code']){   
                                $response['error'][] = array(
                                    'code' => $value->codigo,
                                    'mensagem' => $value->mensagem,                                   
                                    'status' => true
                                );                                     
                            }                                    
                    } 
                }         
            }else{                      
                foreach($erro as $key => $value){                                 
                        if($value->codigo == $arr['error']['code']){   
                            $response['error'][] = array(
                                'code' => $value->codigo,
                                'mensagem' => $value->mensagem,                                   
                                'status' => true
                            );                                     
                        }                                      
                }  
                                       
            } 
            return $this->response->setJsonContent($response);  
            //echo json_encode($response);       
        }               
        // curl_close($ch);
    }


    public function confirmacaoAction($id){  
        $this->view->titulopagina = "Confirmação"; 
        $Mail = new \Email();
        $Mail->emailCompra($id, $_SESSION); 		
	}

    public function finalizacaoAction(){
         $this->view->titulopagina = "Finalização"; 
    }

     public function senhaAction() {        
        $nova_senha = $this->security->hash($_POST['senha']); // Hash de senha
        
        $cliente = Clientes::findbyId($_POST['id']);
        $cliente->senha = $nova_senha;
        $cliente->save();
    }

    public function localizacaoAction() {
        $id = $_POST['id'];
        unset($_POST['id']);
        $cliente = Clientes::findbyId($id);
        foreach($_POST as $key => $value){
           $cliente->$key = $value;
        }
        $cliente->save();
    }

    public function notificacao_pag_seguroAction(){	   
        //unset($this->cart);	
        $this->view->disable();
        $this->view->titulopagina = "Pagamento"; 
		if(isset($_POST['notificationType']) && $_POST['notificationType'] == 'transaction'){         
		    Pagamentos::retorno($_POST);		   
		}
	}   

    ////////////////checa cpf //////////////////////
    public function checacpfAction(){            
        $this->response->setHeader("Content-Type", "application/json");
        $this->view->disable();
        $retorno = Clientes::findFirst(array(array('cnpj' => $this->request->getPost('cnpj')))); 
     
        if(($retorno->cnpj != '') && (count($retorno->cnpj) > 0)){
            $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode(['status'=>true])); 
            return $this->response->send();
        }  
        else{
             $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode(['status'=>false])); 
            return $this->response->send();
        }  
    }     
    
}
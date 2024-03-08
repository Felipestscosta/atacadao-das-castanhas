<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    
    function initialize(){
         
    }

    //Recursos Pré Carregados em Todas as Views
    public function beforeExecuteRoute() 
    {
        //http://www.localhost
        $linksite = explode("/",$this->url->getBaseUri());
        
       // Define o formato de saída da data
       define('FR_DATA', 'd/m/Y');
    
       //Set Timezone Brasil
       setlocale(LC_ALL, 'pt_BR', 'pt_BR.utf-8', 'pt_BR.utf-8', 'portuguese');
       date_default_timezone_set('America/Sao_Paulo');
       
    //    define('THUMB',$linksite[0].'//'.$linksite[2].'/icontrole/public/');
             
       $this->cart = new ShoppingCart("myShop");
       $this->view->setVar("carrinho_quantidade", $this->cart->getTotalItems());
    //    $this->view->setVar("link_imagens", $linksite[0].'//'.$linksite[2].'/icontrole/');
       $this->view->setVar("link_imagens", '/icontrole/');
       $id = $this->session->get('id');
       $cliente = Clientes::findbyId($id);
       $this->view->setVar("dados_cliente", Clientes::findbyId($this->session->get("id")));
       $this->view->setVar("produto_url", (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]");
       $this->view->empresa = Configuracoes::findFirst();
       $empresa = Configuracoes::findFirst();
	   define('AUTNOME', $empresa->autenticacao['nome']);
	   define('AUTEMAIL', $empresa->autenticacao['email']);
	   define('AUTSENHA', $empresa->autenticacao['senha']);
	   define('AUTHOST', $empresa->autenticacao['host']);  	
	   define('AUTLOGO', $empresa->profile_logo);
	   define('AUTVENDA', $empresa->email);
       
    }
    
    public function verificalogin(){
         //Verifica Sessão de Usuario
        if(!$this->session->has('nome')){          
            $this->response->redirect('paginas/login');
        }
    }

    public static function limpacarrinho(){
        //Limpa Carrinho
        unset($_SESSION['myShop']);
    }

     public function showArray($array)
    {
        echo '<pre>';print_r($array);exit;
    }

    public function verificacarrinho(){
         //Verifica Sessão de Usuario
        if(empty($this->cart->getTotalItems())){
            $this->response->redirect('paginas/carrinho');
        }
    }

     public function verificaDescontos(){
        $descontoativos = Cupons::find(array("conditions" => array(
            "status" => 'Ativo',
            '$and' => [[
                'tipocupom' => 'progressivo'
            ]]
        )));
        $desconto = '';
        if((isset($descontoativos)) && (!empty($descontoativos))){
            if(!empty($descontoativos[0]->progvalor[0])){                
                if(($this->cart->getTotal() > $descontoativos[0]->progvalor[0]) && ($descontoativos[0]->progvalor[1] == 0.00)){                                                                     
                    $calculo = $this->app->desconto($descontoativos[0]->progporcentagem[0],$this->cart->getTotal());  
                    $tot = $this->app->transform($calculo); 
                    $desconto =  ($this->cart->getTotal()) - $tot;
                }          
                else if(($this->cart->getTotal() > $descontoativos[0]->progvalor[0]) && ($this->cart->getTotal() < $descontoativos[0]->progvalor[1])){                                                                     
                        $calculo = $this->app->desconto($descontoativos[0]->progporcentagem[0],$this->cart->getTotal());  
                        $tot = $this->app->transform($calculo); 
                        $desconto =  ($this->cart->getTotal()) - $tot;
                } 
                else if(($this->cart->getTotal() > $descontoativos[0]->progvalor[1]) && ($descontoativos[0]->progvalor[2] == 0.00)){                                                                     
                    $calculo = $this->app->desconto($descontoativos[0]->progporcentagem[0],$this->cart->getTotal());  
                    $tot = $this->app->transform($calculo); 
                    $desconto =  ($this->cart->getTotal()) - $tot;
                }   
                else if(($this->cart->getTotal() > $descontoativos[0]->progvalor[1]) && ($this->cart->getTotal() < $descontoativos[0]->progvalor[2])){   
                        $calculo = $this->app->desconto($descontoativos[0]->progporcentagem[1],$this->cart->getTotal());  
                        $tot = $this->app->transform($calculo); 
                        $desconto =  ($this->cart->getTotal()) - $tot; 
                }
                else if($this->cart->getTotal() > $descontoativos[0]->progvalor[2]){   
                        $calculo = $this->app->desconto($descontoativos[0]->progporcentagem[2],$this->cart->getTotal());  
                        $tot = $this->app->transform($calculo); 
                        $desconto =  ($this->cart->getTotal()) - $tot; 
                }
                else{
                    $tot = $this->cart->getTotal(); 
                }   
            }              
        } 
        else{
            $tot = $this->cart->getTotal(); 
        } 
        return (array('tot'=>$tot,'desconto'=>number_format($desconto,2,',','.')));
    }
}

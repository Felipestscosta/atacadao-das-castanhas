
<link rel="shortcut icon" type="image/x-icon" href="{{ link_imagens ~ empresa.profile_favicon }}"> 
<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1" />
{{ assets.outputCss() }}
<input type="hidden" value='<?= (isset($_SESSION['frete_simulacao'])) ? $_SESSION['frete_simulacao'] : '' ?>' name="frete_simulacao">
<div style='width:100%;border-bottom:2px solid #4CAF50;padding:10px;background-color: #000;'>
    <div class='container'>
        <div class='row'>
            <div class='col-md-12 text-center'>

                <a href="{{this.url.getBaseUri()}}">
                    <img style='margin:0 auto;' src='{{ link_imagens ~ empresa.profile_logo }}'>
                </a>
            </div>
            <!-- <div class="col-md-4 text-center">
                <img style="width:170px;" src='{{ this.url.getBaseUri() }}img/comprasegura.png'>
                <img style="width:170px;" src='{{ this.url.getBaseUri() }}images/pagseguro2.png'>       
            </div>            -->
        </div>       
    </div>
</div>
<div class='carrega_finaliza'></div>
<div class='container container_pagamento' style='margin-top:20px;'>
    <div class='row'>
        <div class='col-md-4'>
            <div class="sombra-box" style="height:auto;">
                <h4 class="titcheckout">1 - DADOS PESSOAIS</h4>
                <!--- Verifica JS usuario Logado>-->
                <b>CONFIRME O ENDEREÇO DE ENTREGA</b>
                <br><br>
                <input type='hidden' value="<?= $this->session->has('id')?>" name='logado'>
                <div class="divMsgCep"></div>
                <div class='logado'>
                    <!--Append Endereço-->
                </div>

                  <!--Esqueci senha-->
                  <div class="lost-password senha" style="display: none;">
                    <p>Esqueceu seua senha? Por favor insira seu e-mail. Você receberá uma senha em seu e-mail.</p>
                    <form method="post" id="envia-recupera-senha" novalidate="novalidate">
                        <div class="row learts-mb-n30">
                            <div class="col-12 learts-mb-30">
                                <label for="userName">Digite seu e-mail abaixo:</label>
                                <input id="userName" name="email" type="text" >
                            </div>
                            <div class="col-6 text-center learts-mt-30">
                                <a href="javascript:;" class="btn btn-dark btn-outline-hover-dark cancelar" style="padding: 15px 30px;">cancelar</a>
                            </div>
                            <div class="col-6 text-center learts-mt-30">
                                <button class="btn btn-light btn-outline-dark" style="padding: 15px 30px;">recuperar</button>
                            </div>
                        </div>
                        <div class="msgLogin"></div>
                    </form>
                </div>
                <!-- Fim esqueci senha-->

                <!--FIM endereços Append-->
                <div class="loga">
                    <form class='login' action='#' style="<?= ($this->session->has('id')) ? 'display:none;' : '' ?>">
                        <div class="logininvalido"></div>
                        <div class="alert alert-info" style="<?= ($this->session->has('id')) ? 'display:none;' : '' ?>">
                            <strong>Info!</strong> Faça o login para continuar.
                        </div>
                        <p class="text">
                            <label for="email" width='120px'>E-mail</label>
                            <input type="email" id='email' class='form-control' width='219px' name="email" required>
                        </p>
                        <p class="text select">
                            <label for="id_order">Senha:</label>
                            <input type="password" name="senha" class='form-control' width='219px' required>
                        </p>
                        <p class="coupon-toggle">Esqueceu sua senha? <a href="javascript:;" class="esqueci">Clique aqui</a></p>

                        <div class="form-group">
                            <button type='submit' style="width:100%;" class="btn btn-info btn-outline-hover-info">LOGIN</button>
                        </div>
                        <div class="form-group">
                            <a href='{{ this.url.getBaseUri() }}paginas/minhaconta'>
                                <button type='button' style="width:100%;" class="btn btn-success btn-outline-hover-success">NOVA CONTA</button>
                            </a>
                        </div>
                    </form>
                </div>
                <div class='carrega_login'></div>
                <br clear="all">

                <div class="dvnovoend" style="display: none;padding-top: 10px;">
                    <h4 class="titcheckout">NOVO ENDEREÇO</h4>
                    <form class="form-horizontal new_endereco">
                        <fieldset>
                            <div class="form-group">
                                 <div class="divMsgCep"></div>
                              <label class="col-md-12 control-label" for="cep_ajax">CEP*</label>  
                              <div class="col-md-12">             
                                <input name="cep" id='novoend' type="text" placeholder="XXXXX-XXX" class="cep form-control input-md" maxlenght="8" required>
                                <div class='loader'></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="col-md-12 control-label" for="textendereco">Endereço*</label>  
                              <div class="col-md-12">
                              <input id="textendereco" name="endereco" type="text" placeholder="XXXX-XXX" class="form-control input-md" required>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="col-md-12 control-label" for="textnumero">Número </label>  
                              <div class="col-md-12">
                              <input id="textnumero" name="numero" type="text" placeholder="N°" class="form-control input-md" required> 
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="col-md-12 control-label" for="textcidade">Cidade* </label>  
                              <div class="col-md-12">
                              <input id="textcidade" name="cidade" type="text" placeholder="Cidade" class="form-control input-md" required> 
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="col-md-12 control-label" for="textestado">Estado* </label>  
                              <div class="col-md-12">
                              <input id="textestado" name="estado" type="text" placeholder="UF" class="form-control input-md" required> 
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="col-md-12 control-label" for="textbairro">Bairro* </label>  
                              <div class="col-md-12">
                              <input id="textbairro" name="bairro" type="text" placeholder="Novo Bairro" class="form-control input-md" required> 
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="col-md-12 control-label" for="textcomplemento">Complemento</label>  
                              <div class="col-md-12">
                              <input id="textcomplemento" name="complemento" type="text" placeholder="Complemento" class="form-control input-md">
                              </div>
                            </div>
                            <!-- Button -->
                            <div class="form-group">
                              <label class="col-md-12 control-label" for="singlebutton"></label>
                              <div class="col-md-12">
                                <button id="singlebutton" class="btn btn-success btn-outline-hover-success" style="width:100%;">INSERIR ENDEREÇO</button>
                              </div>
                            </div>
                            <div class='carregando'></div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>

        <style>
            .disabledbutton {
                pointer-events: none;
                opacity: 0.4;
            }
        </style>

        <div class='col-md-4 disabledbutton sombra-box' id="ocultaentrega">
            <div class="col-md-12">
                <h4 class="titcheckout">2 - FORMA DE ENTREGA</h4>
                <div class='fretes'></div> 
            </div>

            <div class="col-md-12">
                <h4 class="titcheckout">3 - ITENS DO CARRINHO</h4>
                  <div class="form-group append_carrinho" style='display:none;'>
                    <?php if(empty($conteudo_carrinho)): ?>

                        <?php else:?>
                            <div style='height:350px;overflow-y:scroll;margin-top:20px;'>
                                {% for key,query in conteudo_carrinho %}
                                <div class="form-group">
                                    <div class='col-md-4' style="float:left;">
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(query['name'])}}/{{query['id_mongo']}}"><img src="<?= $this->app->getImageThumb($query['imagem'],array('w'=>60,'h' => 60,'zc'=> 2))?>" alt="{{query['name']}}"></a>
                                    </div>
                                    <div class='col-md-8' style="float:left;">
                                        <p style='color:#757575;font-size:12px;margin:0;'><b>{{ query['name']}}</b></p>
                                        <p style='color:#757575;padding:0;margin:0;font-size:10px;'>QTD: {{query['qty']}}</p>
                                        <p style='color:#757575;padding:0;margin:0;font-size:10px;'>VALOR UNITARIO: R$ {{query['price']}}</p>
                                        <p style='color:#757575;padding:0;margin:0;font-size:10px;'>SUBTOTAL: R$
                                            <?= number_format($query['total'],2,',','.') ?>
                                        </p>
                                    </div>
                                </div>
                                <br clear='all'>
                                <br clear='all'> {% endfor %}
                            </div>
                            <?php endif;?>
                </div>               
          
            </div>
        </div>

        <div class='col-md-4 disabledbutton' id="ocultapgto">  
            <div class="sombra-box" style="height: auto;">  
                    <h4 class="titcheckout">4 - CONCLUIR PEDIDO</h4>
                    <div class="form-group">
                        <div class='somatoria_geral'></div>
                    </div>
                    <div class="form-group append_carrinho" style='display:none;'>
                        <div class="form-group">
                            <b>Possui cupom de desconto? Insira aqui!</b>
                            <form class='cupom' style="margin-top: 10px;">
                                <input type="hidden" name="valorcarrinho" value='<?= $total_carrinho ?>'>
                                <input type="text" style="float:left;" value='<?= (isset($_SESSION['cupom_numero'])) ? $_SESSION['cupom_numero'] : ' ' ?>' class='col-md-8 form-control noborder' placeholder='Ex.: XXXXX' name="cupom_desconto" <?=( isset($_SESSION[ 'cupom_numero'])) ? 'readonly': '' ?>>
                                <button style='margin-left:3px;<?= (isset($_SESSION['cupom_numero '])) ? 'display:none; ' : '' ?>' type='submit' class="verificar_cupom btn btn-success btn-outline-hover-success">OK</button> <img class='validado' style=<?= (isset($_SESSION[' cupom_numero '])) ? ' ' : 'display:none ' ?>;' src='img/success.png'>
                            </form>
                        </div>                      

                        <span id="totalValue" style="display:none;"><?php echo $gerarparcelas; ?></span>
                        <h6 style='border-bottom:1px solid #ccc;padding: 9px;'>SUBTOTAL: <span style='float:right;' class='subtotal'></span></h6>
                        <h6 style='border-bottom:1px solid #ccc;padding: 9px;'>FRETE: <span style='float:right;' class='frete_simulacao'></span></h6>
                        <h6 id='cupom' style="<?= (isset($_SESSION['cupom_numero'])) ? 'display:block' : 'display:none' ?>;border-bottom:1px solid #ccc;padding: 9px;">CUPOM: <span style='float:right;' id="append_cupom" class=''></span></h6>
                        <h6 id='desconto_pix' style='display:none;border-bottom:1px solid #ccc;padding: 9px;'>DESCONTO PIX: <span style='float:right;' class='desconto_pix'></span></h6>
                        <h6 id='total_price_container' style='border-bottom:1px solid #ccc;padding: 9px;'>TOTAL: <span style='float:right;' class='total_geral'></span></h6>
                        <h6 style='border-bottom:1px solid #ccc;display:none;padding: 9px;' class='price_desconto'>TOTAL GERAL: <span style='float:right;' class='carrinhosomatoria'></span></h6>
                                       
                    </div>  

                    <h4 style="font-family: 'Open Sans', sans-serif; color: #000; font-weight:bold; border-bottom: 1px dotted; padding: 15px;font-size:1.1em;">5 - FORMA DE PAGAMENTO</h4>
                    <div class="order-payment">
                        <div class="payment-method">
                            <div class="accordion" id="paymentMethod">
                               <div class="card">
                                    <!-- <div class="card-header">
                                        <button data-toggle="collapse" data-target="#checkPayments" class="atualizacielo"><img src="{{ this.url.getBaseUri() }}images/logo_cielo.png"></button>
                                    </div>
                                     <div id="checkPayments" class="collapse" data-parent="#paymentMethod">
                                        <div class="card-body">
                                            {{ partial('layouts/cielo') }}
                                        </div>
                                    </div>  -->
                                </div>
                               
                                 <div class="card">
                                    <div class="card-header">
                                        <button data-toggle="collapse" data-target="#payPalPayments" class="pixdesc"><img src="{{this.url.getBaseUri()}}images/logo_pix.png"></button>
                                    </div>
                                    <div id="payPalPayments" class="collapse" data-parent="#paymentMethod">
                                        <div class="card-body">
                                            <form class='pagpix' id='pagpix' name='pagpix'>
                                            <input type="hidden" name="tipopagamento" value="Pix"> 
                                            <input name='cep' type='hidden'>
                                            <input name='endereco' type='hidden'>
                                            <input name='numero' type='hidden'>
                                            <input name='cidade' type='hidden'>
                                            <input name='estado' type='hidden'>
                                            <input name='bairro' type='hidden'>
                                            <input name='complemento' type='hidden'>                
                                            <p>1- Abra o aplicativo do banco.</p>
                                            <p>2- Digite a chave ou leia o QR-Code para identificar nossa chave.</p>
                                            {% if empresa.preferencias_de_pagamentos['pix_key_email'] is not empty %}
                                            <p><b style="font-size: 1.0em;">PIX:</b> <b style="font-size: 1.0em;">{{ empresa.preferencias_de_pagamentos['pix_key_email'] }}</b></p>
                                            {% endif %}
                                            {% if empresa.preferencias_de_pagamentos['pix_key_telefone'] is not empty %}
                                            <p><b style="font-size: 0.9em;">Telefone:</b> {{ empresa.preferencias_de_pagamentos['pix_key_telefone'] }}</p>
                                            {% endif %}
                                            {% if empresa.preferencias_de_pagamentos['pix_key_cpfcnpj'] is not empty %}
                                            <p><b style="font-size: 0.9em;">CPF/CNPJ:</b> {{ empresa.preferencias_de_pagamentos['pix_key_cpfcnpj'] }}</p>
                                            {% endif %}
                                            <img src="{{ this.url.getBaseUri() ~ 'images/qrcode.png' }}" width="180"/>
                                            <p>3 - Insira o valor <span class="valuepix"></span> do seu pedido no aplicativo do banco.</p>
                                            <p>4 - Finalize seu pedido no aplicativo do banco.</p>
                                            <p>5 - Identifique sua chave logo abaixo (cpf, telefone ou e-mail)</p>
                                            
                                            <h4 class="text-center" style="color:#f8796c;font-size: 1.3em;">IDENTIFIQUE SEU PIX</h4>

                                            <div class="pagamento_pix" style="margin-top:10px;"> 
                                                    <div class="row">                                                 
                                                        <div class="form-group col-md-3">                                     
                                                            <label style="margin-left: 12px; font-size: 12px;">CPF</label>
                                                            <input id="CpfRadio" type="radio" class="buyCpf edit" name="pix" value="cpf">                                                              
                                                        </div>

                                                        <div class="form-group col-md-4">
                                                            <label style="margin-left: 12px; font-size: 12px;">E-MAIL</label>
                                                            <input id="EmaildRadio" type="radio" name="pix" class="buyEmail edit" value="email">                                                   
                                                        </div>                                 
                                        
                                                        <div class="form-group col-md-4">                                     
                                                            <label style="margin-left: 12px; font-size: 12px;">TELEFONE</label>
                                                            <input id="TelefoneRadio" type="radio" class="buyTelefone edit" name="pix" value="telefone">                                                
                                                        </div>
                                                    </div>

                                                    <div id="pix_cpf" style="display: none;">
                                                        <input type="text" class="cpfcnpj" name="pix_cpf_cnpj" placeholder="Insira aqui seu cpf"/>
                                                    </div>
            
                                                    <div id="pix_email" style="display: none;">
                                                        <input type="text" class="email" name="pix_email" placeholder="Insira aqui seu email"/>
                                                    </div>
            
                                                    <div id="pix_telefone" style="display: none;">
                                                        <input type="text" class="celular" name="pix_telefone" placeholder="Insira aqui seu telefone"/>
                                                    </div>  
                                                </div>                                            
                                                <p style="margin-top:15px;">6 - Após esse etapa você podera finalizar sua compra clicando em FINALIZAR COMPRA</p>    
                                            
                                                <div class="row" style="margin-top: 20px;">    
                                                    <div class="col-md-12 mb-2">                                            
                                                        <input type='hidden' name='total_compras'>  
                                                        <input type="button" class="btn btn-success btn-outline-hover-success pagapix" value="FINALIZAR COMPRA" style=" border: 2px solid #409444; border-bottom-color: #409444;background-color: #409444; color:#fff;"/>
                                                    
                                                        <div class="loaderpix col-md-12" style="display:none; text-align:center; margin-top: 20px; font-family:'Philosopher', sans-serif;">
                                                            <div class="alert alert-success" role="alert">
                                                                <img src="{{ this.url.getBaseUri() ~ 'images/cart.gif' }}"/> Processando aguarde...
                                                            </div>                                       
                                                        </div> 
                                                    </div>
                                                </div>                                                   
                                            </form>                                           
                                        </div>                                  
                                    </div>
                                </div> 
                            </div>
                        </div>                       
                    </div>                     
                </div>          
        </div>
    </div>
</div>

<hr/>
<div class="container">
    <div class='col-md-12 text-center'>              
        <!-- <img style="width:170px;" src='{{ this.url.getBaseUri() }}images/logo_cielo.png'>
        <img style="width:170px;" src='{{ this.url.getBaseUri() }}images/logo_pagseguro.png'>   -->
        <img style="width:170px;" src='{{ this.url.getBaseUri() }}images/logo_pix.png'>                      
    </div>
</div>
<script>var hostsite = "{{ this.url.getBaseUri() }}";</script>

{{ assets.outputJs() }}
<script>
    $('.cartao').mask('XXXX.XXXX.XXXX.XXXX');  
    function verificanumero(e) {
        var expressao;
        expressao = /[0-9]/;
        if (expressao.test(String.fromCharCode(e.keyCode))) {
            return true;
        } else {
            return false;
        }
    }
</script>
{{ partial('layouts/scriptscheckout_pagseguro')}}

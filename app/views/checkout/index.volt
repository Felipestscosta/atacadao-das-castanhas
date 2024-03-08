<input type="hidden" value='<?= (isset($_SESSION['frete_simulacao'])) ? $_SESSION['frete_simulacao'] : '' ?>' name="frete_simulacao">

<div class='carrega_finaliza'></div>
<div class='container container_pagamento' style='margin-top:20px;'>
    <div class='row'>
        <div class='col-md-4'>
            <div class="sombra-box">
                <h4 class="titcheckout">DADOS DE ENTREGA</h4>
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
                    <p>Esqueceu sua senha? <br>Por favor insira seu e-mail, que você receberá uma nova senha.</p>
                    <form method="post" id="envia-recupera-senha" novalidate="novalidate">
                        <div class="row learts-mb-n30">
                            <div class="col-12 learts-mb-30">
                                <!-- <label for="userName">Digite seu e-mail abaixo:</label> -->
                                <input id="userName" required name="email" type="text" placeholder="E-mail" >
                            </div>
                            <div class="col-6 text-center learts-mt-30">
                                <a href="javascript:;" class="btn btn-animation proceed-btn fw-bold cancelar" style="padding: 15px 30px;">Cancelar</a>
                            </div>
                            <div class="col-6 text-center learts-mt-30">
                                <button class="btn btn-animation proceed-btn fw-bold" style="padding: 15px 30px;">Recuperar</button>
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
                            <strong>Faça o login para continuar.</strong> 
                        </div>
                        <p class="text">
                            <!-- <label for="email" width='120px'>E-mail</label> -->
                            <input type="email" id='email' class='form-control' placeholder="E-mail" width='219px' name="email" required>
                        </p>
                        <p class="text select">
                            <!-- <label for="id_order">Senha:</label> -->
                            <input type="password" name="senha" placeholder="Senha" class='form-control' width='219px' required>
                        </p>
                        <p class="coupon-toggle">Esqueceu sua senha? <a href="javascript:;" class="esqueci">Clique aqui</a></p>

                        <div class="form-group">
                            <button type='submit' style="width:100%;" class="btn btn-animation proceed-btn fw-bold">LOGIN</button>
                        </div>
                        <div class="form-group">
                            <a href='{{ this.url.getBaseUri() }}paginas/novaconta'>
                                <button type='button' style="width:100%;" class="btn theme-bg-color text-white btn-md w-100 mt-4 fw-bold">NOVA CONTA</button>
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
                                <button id="singlebutton" class="btn btn-animation w-100 btn-outline-hover-success" style="width:100%;">INSERIR ENDEREÇO</button>
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
                <h4 class="titcheckout">OPÇÕES DE ENTREGA</h4>
                <br>
                <div class='fretes'></div> 
            </div>

            <div class="col-md-12">
                <h4 class="titcheckout">RESUMO DO PEDIDO</h4>
                  <div class="form-group append_carrinho" style='display:none;'>
                    <?php if(empty($conteudo_carrinho)): ?>

                        <?php else:?>
                            <div style='height:350px;overflow-y:scroll;margin-top:20px;'>
                                {% for key,query in conteudo_carrinho %}
                                <div class="form-group">
                                    <!-- <div class='col-md-4' style="float:left;">
                                        <a href="javascript:void(0);"><img src="<?= $this->app->getImageThumb($query['imagem'],array('w'=>60,'h' => 60,'zc'=> 2))?>" alt="{{query['name']}}"></a>
                                    </div> -->
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
                    <h4 class="titcheckout">CONCLUIR PEDIDO</h4>
                    <div class="form-group">
                        <div class='somatoria_geral'></div>
                    </div>
                    <div class="form-group append_carrinho" style='display:none;'>
                        <div class="form-group">
                            <br>
                            <b>Cupom de Desconto</b>
                            <form class='cupom custom-form-check form-check mb-0' style="margin-top: 10px;">
                                <input type="hidden" name="valorcarrinho" class="form-control" value='<?= $total_carrinho ?>'>
                                <input type="text" style="float:left;" value="<?= (isset($_SESSION['cupom_numero'])) ? $_SESSION['cupom_numero'] : ' ' ?>" class='col-md-8 form-control noborder' placeholder='cupom' name="cupom_desconto" <?= (isset($_SESSION[ 'cupom_numero'])) ? 'readonly': '' ?>>
                                <button style='margin-left:3px;<?= (isset($_SESSION['cupom_numero '])) ? 'display:none; ' : '' ?>' type='submit' class="verificar_cupom btn btn-animation">OK</button> <img class='validado' style=<?= (isset($_SESSION[' cupom_numero '])) ? ' ' : 'display:none ' ?>;' src='img/success.png'>
                            </form>
                        </div>                      

                        <span id="totalValue" style="display:none;"><?php echo $gerarparcelas; ?></span>
                        <h6 style='border-bottom:1px solid #ccc;padding: 9px;'>SUBTOTAL: <span style='float:right;' class='subtotal'></span></h6>
                        <h6 style='border-bottom:1px solid #ccc;padding: 9px;'>FRETE: <span style='float:right;' class='frete_simulacao'></span></h6>
                        <h6 id='cupom' style="<?= (isset($_SESSION['cupom_numero'])) ? 'display:block' : 'display:none' ?>;border-bottom:1px solid #ccc;padding: 9px;">CUPOM: <span style='float:right;' id="append_cupom" class=''></span></h6>
                        <h6 id='desconto_pix' style='display:none;border-bottom:1px solid #ccc;padding: 9px;'><b>DESCONTO PIX:</b> <span style='float:right;' class='desconto_pix'></span></h6>
                        <h6 id='total_price_container' style='border-bottom:1px solid #ccc;padding: 9px;'>TOTAL: <span style='float:right;' class='total_geral'></span></h6>
                        <h6 style='border-bottom:1px solid #ccc;display:none;padding: 9px;' class='price_desconto'>TOTAL GERAL: <span style='float:right;font-weight: bold; font-size: 16px;' class='carrinhosomatoria'></span></h6>
                                       
                    </div>  

                    <h4 class="titcheckout">FORMA DE PAGAMENTO</h4>
                    <div class="accordion-item">
                        <div class="payment-method accordion-header" id="flush-headingTwo">
                            
                            <!-- CIELO -->
                               <!-- <div class="card">
                                    <div class="card-header">
                                        <button data-toggle="collapse" data-target="#checkPayments" class="atualizacielo"><img src="{{ this.url.getBaseUri() }}images/logo_cielo.png"></button>
                                    </div>
                                     <div id="checkPayments" class="collapse" data-parent="#paymentMethod">
                                        <div class="card-body">
                                            {{ partial('layouts/cielo') }}
                                        </div>
                                    </div> 
                                </div> -->
                            <!-- FIM CIELO -->

                            <!-- PAGSEGURO -->
                            <!--<div class="accordion-header" id="flush-headingOne" style="border-bottom: 1px solid #ccc;cursor: pointer;">
                                <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#card-payment-box">
                                    <div class="custom-form-check form-check mb-0">
                                        <label class="form-check-label" for="credit" style="display: flex;align-items: center;gap: 1rem;">
                                            <input class="form-check-input mt-0 pixdesc" type="radio" name="flexRadioDefault" id="credit" style="opacity: 0;">
                                            <img src="{{this.url.getBaseUri()}}images/pagseguro.webp" style="max-height: 35px;cursor: pointer;">
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div id="card-payment-box" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="card">
                                    <div id="checkPayments" class="collapse show" data-parent="#paymentMethod">
                                        <div class="card-body">
                                            {{ partial('layouts/pagseguro') }}
                                        </div>
                                    </div> 
                                </div>
                            </div>-->
                            <!-- FIM PAGSEGURO -->

                            <!-- PIX -->  
                            <div class="accordion-header" id="flush-headingOne" style="border-bottom: 1px solid #ccc;cursor: pointer;">
                                <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne">
                                    <div class="custom-form-check form-check mb-0">
                                        <label class="form-check-label" for="pix" style="display: flex;align-items: center;gap: 1rem;">
                                            <input class="form-check-input mt-0 pixdesc" type="radio" name="flexRadioDefault" id="pix" style="opacity: 0;">
                                            <img src="{{this.url.getBaseUri()}}images/logo_pix.webp" style="max-height: 35px;cursor: pointer;">
                                        </label>
                                    </div>
                                </div>
                            </div>
                            
                            <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body" style="background: #dadeda;" data-parent="#paymentMethod">
                                    <div class="row g-2">
                                        <form class='pagpix' id='pagpix' name='pagpix'>
                                        <input type="hidden" name="tipopagamento" value="Pix"> 
                                        <input name='cep' type='hidden'>
                                        <input name='endereco' type='hidden'>
                                        <input name='numero' type='hidden'>
                                        <input name='cidade' type='hidden'>
                                        <input name='estado' type='hidden'>
                                        <input name='bairro' type='hidden'>
                                        <input name='complemento' type='hidden'>                
                                        <p>1 - Abra o aplicativo do banco.</p>
                                        <p>2 - COPIE a chave (CNPJ) Abaixo e cole no campo CPF/CNPJ do seu banco.</p>
                                        {% if empresa.preferencias_de_pagamentos['pix_key_email'] is not empty %}
                                        <p><b style="font-size: 1.0em;">PIX:</b> <b style="font-size: 1.0em;">{{ empresa.preferencias_de_pagamentos['pix_key_email'] }}</b></p>
                                        {% endif %}
                                        {% if empresa.preferencias_de_pagamentos['pix_key_telefone'] is not empty %}
                                        <p><b style="font-size: 0.9em;">Telefone:</b> {{ empresa.preferencias_de_pagamentos['pix_key_telefone'] }}</p>
                                        {% endif %}
                                        {% if empresa.preferencias_de_pagamentos['pix_key_cpfcnpj'] is not empty %}
                                        <p>
                                            <input type="text" name="texto" id="texto" value="{{ empresa.preferencias_de_pagamentos['pix_key_cpfcnpj'] }}" readonly />
                                            <input type="text" onclick="copiarTexto()" placeholder="COPIAR" class="btn" style="background-color: #efefef !important;width: 27%;float: right;"></input>
                                            <!-- <input type="text" value="{{ empresa.preferencias_de_pagamentos['pix_key_cpfcnpj'] }}" id="texto">CPF/CNPJ:</input> 
                                        <button onclick="copiarTexto()">{{ empresa.preferencias_de_pagamentos['pix_key_cpfcnpj'] }}</button>  -->
                                        </p>
                                        {% endif %}
                                        
                                        <p>3 - Clique no botão <b>FINALIZAR</b> logo abaixo.</p>
                                        <p style="text-align: center;"><b>OU</b></p>
                                        <p>aponte a camera do celular para este <b>qrcode</b> </p>
                                        <img src="{{ this.url.getBaseUri() ~ 'images/qrcode.png' }}" width="180"/>
                                        <p>4 - Insira o valor <span class="valuepix"></span> do seu pedido no aplicativo do banco.</p>
                                        <p>5 - Finalize seu pedido no aplicativo do banco.</p>
                                        <p>6 - Identifique sua chave logo abaixo (cpf, telefone ou e-mail)</p>
                                        
                                        <!-- <h4 class="text-center" style="color:#f8796c;font-size: 1.3em;">IDENTIFIQUE SEU PIX</h4>

                                        <div class="pagamento_pix" style="margin-top:10px;"> 
                                                <div class="row">                                                 
                                                    <div class="form-group col-md-3">                                     
                                                        <label style="margin-left: 12px; font-size: 12px;">CPF</label>
                                                        <input id="CpfRadio" type="radio" class="buyCartao form-check-input buyCpf edit" name="pix" value="cpf">                                                              
                                                    </div>

                                                    <div class="form-group col-md-4">
                                                        <label style="margin-left: 12px; font-size: 12px;">E-MAIL</label>
                                                        <input id="EmaildRadio" type="radio" name="pix" class="buyCartao form-check-input buyEmail edit" value="email">
                                                    </div>                                 
                                    
                                                    <div class="form-group col-md-4">                                     
                                                        <label style="margin-left: 12px; font-size: 12px;">TELEFONE</label>
                                                        <input id="TelefoneRadio" type="radio" class="buyCartao form-check-input buyTelefone edit" name="pix" value="telefone">                                                
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
                                            </div>   -->

                                            <p style="margin-top:15px;">7 - Após esse etapa você podera finalizar sua compra clicando em FINALIZAR COMPRA</p>    
                                        
                                            <div class="row" style="margin-top: 20px;">    
                                                <div class="col-md-12 mb-2">                                            
                                                    <input type='hidden' name='total_compras'>  
                                                    <input type="button" class="btn btn-animation w-100 pagapix" style="color: #fff;" value="FINALIZAR COMPRA"/>
                                                
                                                    <div class="loaderpix col-md-12" style="display:none; text-align:center; margin-top: 20px;">
                                                        <div class="alert alert-success" role="alert">
                                                            <img src="{{ this.url.getBaseUri() ~ 'images/cart.gif' }}"/> Aguarde...
                                                        </div>                                       
                                                    </div> 
                                                </div>
                                            </div>                                                   
                                        </form>                                           
                                    </div> 
                                </div>
                            </div> 
                            <!-- FIM PIX --> 
                            
                                              
                    </div>                     
                </div>          
        </div>
    </div>
</div>

<hr/>
<div class="container">
    <div class='col-md-12 text-center'>              
        <!-- <img style="width:170px;" src='{{ this.url.getBaseUri() }}images/logo_cielo.png'>-->
        <!-- <img style="width:170px;" src='{{ this.url.getBaseUri() }}images/pagseguro.webp'> -->
        <!-- <img style="width:170px;" src='{{ this.url.getBaseUri() }}images/logo_pix.webp'> -->
    </div>
</div>

</div>
</div>
</div>
</section>
<!-- Product Section End -->   

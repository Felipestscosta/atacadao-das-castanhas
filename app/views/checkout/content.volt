<div class='carrega_finaliza'></div>
<div class='container container_pagamento' style='margin-top:20px;'>
    <div class='row'>
        <div class='col-md-4'>
            <div style='border:1px solid #ccc;padding:10px;'>
                <h4 style="font-family: 'Open Sans', sans-serif;background: #4EAADF; color: #fff; padding: 15px;font-size:1.1em;">1 - DADOS PESSOAIS</h4>
                <!--- Verifica JS usuario Logado>-->
                <input type='hidden' value="<?= $this->session->has('id')?>" name='logado'>
                <div class="divMsgCep"></div>
                <div class='logado'>
                    <!--Append Endereço-->
                </div>

                <!--FIM endereços Append-->
                <form class='login' action='#' style="<?= ($this->session->has('id')) ? 'display:none;' : '' ?>">
                    <div class="logininvalido"></div>
                    <div class="alert alert-info" style="<?= ($this->session->has('id')) ? 'display:none;' : '' ?>">
                        <strong>Info!</strong> Faça o login para continuar.
                    </div>
                    <p class="text">
                        <label for="email" width='120px'>E-mail</label>
                        <input type="email" id='email' class='form-control' placeholder='Seu Email de Login' width='219px' name="email" required>
                    </p>
                    <p class="text select">
                        <label for="id_order">Senha:</label>
                        <input type="password" name="senha" placeholder='Senha'  class='form-control' width='219px' required>
                    </p>
                    <div class="form-group">
                        <button type='submit' style="width:100%;font-family: 'Open Sans', sans-serif;border-radius:0px;" class="btn btn-primary">LOGIN</button>
                    </div>
                    <div class="form-group">
                        <a href='minhaconta'><button type='button' style="width:100%;font-family: 'Open Sans', sans-serif;border-radius:0px;" class="btn btn-success">NOVA CONTA</button></a>
                    </div>
                </form>
                <div class='carrega_login'></div>
                <br clear="all">

            </div>
        </div>

        <style>
            .disabledbutton{
                pointer-events: none;
                opacity: 0.4;
            }
        </style>

        <div class='col-md-4' style='border:1px solid #ccc;padding:10px;'>

            <!-- <div class="col-md-12 disabledbutton"  id="ocultafrete">
                <h4 style="font-family: 'Open Sans', sans-serif;background: #E40002; color: #fff; padding: 15px;font-size:1.1em;">2 - FORMA DE ENTREGA</h4>
                <p class="text col-md-8">Escolha o tipo de entrega.</p>
                <div class='col-md-12 fretes'></div>
                <br clear="all"/>
            </div> -->


            <div class="col-md-12 disabledbutton" id="ocultapgto">
                <h4 style="font-family: 'Open Sans', sans-serif;background: #4EAADF; color: #fff; padding: 15px;font-size:1.1em;">2 - DADOS PARA PAGAMENTO</h4>
                <a class="btn active buyCielo" style="width:100%;text-transform:none;font-size:1.1em;font-family: 'Open Sans', sans-serif;border-radius:0px;">PAGAR COM CARTÃO</a>
               <!-- <a class="btn active pagardeposito" style="width:100%;text-transform:none;font-size:1.1em;margin-bottom:10px;font-family: 'Open Sans', sans-serif;border-radius:0px;">PAGAR VIA DEPÓSITO</a>-->




                <form class='pagamentos' id='pagamentos' name='frmpgto'>
                    <!--Append Endereços Automaticos-->
                    <input name='cep' type='hidden'>
                    <input name='endereco'    type='hidden'>
                    <input name='numero'      type='hidden'>
                    <input name='cidade'      type='hidden'>
                    <input name='estado'      type='hidden'>
                    <input name='bairro'      type='hidden'>
                    <input name='complemento' type='hidden'>
                    <div class="pagamento_deposito" style="display:none">
                        <input type="hidden" name="tipopagamento" value="Deposito"/>
                        <p><b>CNPJ</b>09.354.422/0001-30</p>
                        <p><b>Conta:</b> 12.978-x</p>
                        <p><b>Agência:</b> 3282-4</p>
                        <p>Banco do Brasil</p>
                        <p>Enviar comprovante pra: <b>contato@casafelizutilidades.com.br</b></p>
                        <p style="color:red;">Atenção clique no botão FINALIZAR PEDIDO para concluir sua compra!</p>
                    </div>
                    <div class="pagamento_cielo">
                        <input type="hidden" name="tipopagamento" value="Cielo"/>
                        <p class="text select col-md-12">
                            <label for="id_order">Bandeira</label>
                            <select id="selectbasic" name="bandeira" class="form-control">
                                <option value="visa">Visa</option>
                                <option value="mastercard">Mastercard</option>
                                <option value="diners">Diners</option>
                                <option value="discover">Discover</option>
                                <option value="elo">Diners</option>
                                <option value="amex">American Express</option>
                                <option value="jcb">JCB</option>
                                <option value="aura">Aura</option>
                            </select>
                        </p>
                        <p class="text col-md-8">
                            <label for="email" width='120px'>Número do Cartão</label>
                            <input type="email" class='form-control' maxlength='16' placeholder='XXX.XXX.XXX.XX' width='219px'; name="numero_cartao" required>
                        </p>
                        <p class="text select col-md-4">
                            <label for="id_order">Cod.: Seg</label>
                            <input type="number" name="codigo_seguranca" min="1" max="9999" maxlength = "3" placeholder='XXX' class='form-control' width='219px';>
                        </p>
                        <p class="text col-md-12">
                            <img src='img/bandeiras.jpg' style='width:193px;'>
                        </p>
                        <p class="text col-md-12">
                            <label width='120px'>Nome no Cartão</label>
                            <input type="text" class='form-control' placeholder='xxxxx xxxxx xxx ' width='219px' name="nome_cartao" required>
                        </p>
                        <p class="text select col-md-6">
                            <label for="id_order">Mês</label>
                            <select id="selectbasic" name="mes" class="form-control">
                                <?php
                        for($i= 1;$i <= 12;$i++):
                      ?>
                                <option value="<?php if(strlen($i) < 2) {echo "0".$i;}else{echo $i;}?>"><?php if(strlen($i) < 2) {echo "0".$i;}else{echo $i;}?></option>
                                <?php endfor;?>
                            </select>
                        </p>
                        <p class="text select col-md-6">
                            <label for="id_order">Ano</label>
                            <select id="selectbasic" name="ano" class="form-control">
                                <?php
                        $ano = date('Y-m-d',strtotime(date("Y-m-d", mktime()) . " + 8 years"));
                        for($i= date('Y');$i <=  $ano ;$i++):
                      ?>
                                <option value="<?= $i?>"><?= $i?></option>
                                <?php endfor;?>
                            </select>
                        </p>
                        <p class="text select col-md-12">
                            <label for="id_order">Numero de Parcelas</label>
                        <div class='parcelas_append'></div>
                        </p>
                        <p class="text select">
                            <label style='font-size:10px;' class="col-md-6 control-label" for="radios">*Salvar dados para compras futuras?</label>
                        <div class="col-md-6">
                            <label class="radio-inline" >
                                <input type="radio" name="salvar_dados_cartao" id="radios-0" value="Sim" checked="checked">
                                Sim
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="salvar_dados_cartao" id="radios-3" value="Não">
                                Não
                            </label>
                        </div>
                        </p>
                        <br clear='all'>
                    </div>
            </div>
            <input type='hidden' name='total_compras'>
            </form>

        </div>



        <div class='col-md-4 disabledbutton'>
            <div style='border:1px solid #ccc;padding:10px;'>
                <h4 style="font-family: 'Open Sans', sans-serif;background: #4EAADF; color: #fff; padding: 15px;font-size:1.1em;">3 - CONCLUIR PEDIDO</h4>
                <!--<div class="form-group">
                    <p style='margin:0;'>Vales-presente, troca ou cupons de desconto</p>
                    <form class='cupom'>
                        <input type="text" value='<?= (isset($_SESSION['cupom_numero'])) ? $_SESSION['cupom_numero'] : '' ?>' class='form-control' style='width:65%;float:left;' placeholder='Ex.: XXXXX' name="cupom_desconto" <?= (isset($_SESSION['cupom_numero'])) ? 'readonly': '' ?>>
                        <button style='width:22%;float: left;margin-left: 2px;<?= (isset($_SESSION['cupom_numero'])) ? 'display:none;' : '' ?>' type='submit' class="verificar_cupom btn btn-primary ">Verificar</button>               <img class='validado' style='width:10%;float:right;margin:0 0 0 4px;<?= (isset($_SESSION['cupom_numero'])) ? '' : 'display:none' ?>;' src='img/success.png'>
                    </form>
                </div><br clear='all'>-->
                <div class="form-group">
                    <div class='somatoria_geral'></div>
                </div>
                <div class="form-group append_carrinho" style='display:none;'>
                    <!--<h5 style='border-bottom:1px solid #ccc;'>SUBTOTAL: <span style='float:right;' class='subtotal'></span></h5>
                    <h5 style='border-bottom:1px solid #ccc;'>FRETE: <span style='float:right;' class='frete_simulacao'></span></h5>
                    <h5 id='cupom' style='display:none;border-bottom:1px solid #ccc;'>CUPOM DE DESCONTO: <span style='float:right;' id="append_cupom" class=''></span></h5>
                    <h5 id='desconto_mais_frete' style='display:none;border-bottom:1px solid #ccc;'>VALOR SEM DESCONTO: <span style='float:right;' class='desconto_mais_frete_e_soma'></span></h5>-->
                    <h4 id='total_price_container' style='border-bottom:1px solid #ccc;'>TOTAL: <span style='float:right;' class='total_geral'></span></h4>
                    <!--<h4 style='border-bottom:1px solid #ccc;display:none;' class='price_desconto'>TOTAL C/DESCONTO: <span style='float:right;' class='carrinhosomatoria'></span></h4>-->
                    <button type='button' id="singlebutton" style='background:#B2C337;padding:10px;width:100%;border-radius:0px;' class="finalizar_compras btn btn-primary">FINALIZAR PEDIDO</button>
                    <!--<input type="submit" value="Enviar" class="wpcf7-form-control wpcf7-submit btn_theme_color btn_rounded" />-->
                    <p style='font-size:9px;margin-top:9px;'>*descontos são aplicados somente sobre o valor dos produtos, não considera frete e outros serviços.</p>
                </div>
                <div class="form-group append_carrinho" style='display:none;'>
                    <?php
                        if(empty($conteudo_carrinho)):
                    ?>

                    <?php else:?>
                    <h3>Iten(s) do Pedido ({{carrinho_quantidade}})</h3>
                    <div style='height:220px;overflow-y:scroll;'>
                        {% for key,query in conteudo_carrinho %}
                            <div class="form-group">
                                <div class='col-md-3'>
                                    <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(query['name'])}}/{{query['id_mongo']}}"><img src="<?= $this->app->getImageThumb($query['imagem'],array('w'=>60,'h' => 60,'zc'=> 2))?>" alt="{{query['name']}}"></a>
                                </div>
                                <div class='col-md-9'>
                                    <p style='color:#757575;font-size:12px;margin:0;'><b>{{ query['name']}}</b></p>
                                    <p style='color:#757575;padding:0;margin:0;font-size:10px;'>QTD: {{query['qty']}}</p>
                                    <p style='color:#757575;padding:0;margin:0;font-size:10px;'>VALOR UNITARIO: R$ {{query['price']}}</p>
                                    <p style='color:#757575;padding:0;margin:0;font-size:10px;'>SUBTOTAL: R$ <?= number_format($query['total'],2,',','.') ?></p>
                                </div>
                            </div><br clear='all'><br clear='all'>
                        {% endfor %}
                    </div>
                    <?php endif;?>
                </div>
            </div>
        </div>
    </div>
</div>
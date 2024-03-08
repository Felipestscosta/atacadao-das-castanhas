<div class="groupData col-md-12" id="paymentMethods">
    <div id="creditCardData" class="paymentMethodGroup" dataMethod="creditCard">
        <div id="cardData">
            <div id="dadosOtherPagador" class="dadosOtherPagador">
                        <input name='cep' type='hidden'>
                        <input name='endereco' type='hidden'>
                        <input name='numero' type='hidden'>
                        <input name='cidade' type='hidden'>
                        <input name='estado' type='hidden'>
                        <input name='bairro' type='hidden'>
                        <input name='complemento' type='hidden'>  
                        <input type='hidden' name='total_compras'>  
                         <input type="hidden" name="tipopagamento" id="tipopagamento" value="credito"/>                                
                 
                        <input type="hidden" name="deviceFingerprintID" value="<?php echo $id;?>" />  
                        <div style="height:68px; margin-left: -15px;"> 
                            <div class="col-md-4" style="padding-left:0px;">
                                <a class="buyCredito"><p class="textcredito">CARTÃO CRÉDITO</p></a>  
                            </div>
                            <div class="col-md-4">
                                <a class="buyDebito"><p class="textdebito">CARTÃO DÉBITO</p></a>  
                            </div>
                           <div class="col-md-4">                               
                                <a class="buyBoleto"><p class="textboleto">BOLETO BANCÁRIO</p></a>   
                            </div>
                        </div>                                                                    
                      
                        <div id="cartao">                           
                            <div class="field" style="padding-left: 0px;">
                                <label class="titform">Número do Cartão<font color="red">*</font></label>
                                <input type="text" name="cardNumber" id="cardNumber" class="form-control cartao noborder" placeholder="0000 0000 0000 0000" onkeypress='return verificanumero(event)'  required="required" tabindex="1" />
                                <img class="cartao-bandeira-img" width="40" style="margin-left: 157px; margin-top: -27px; position: absolute;"/>
                                <input type="hidden" name="creditCardBrand" id="creditCardBrand" class="cartao-bandeira"/>    
                            </div>

                            <div class="field" style="padding-left: 0px;">
                                <label class="titform">Nome<font color="red">*</font></label>
                                <input type="text" style="text-transform:uppercase;" name="nome" id="nome" class="form-control noborder" placeholder="Como está escrito no cartão" required="required" tabindex="1" />
                            </div>                                                                    

                            <div class="field col-md-6" style="padding-left: 0px;">
                                <label class="titform">Validade<font color="red">*</font></label>
                                <input type="text" name="expiryDate" id="expiryDate" class="form-control validade noborder" placeholder="MM/AA" required="required" tabindex="1" />
                            </div>                                   
                            
                            <div class="field col-md-6" style="padding-right: 0px;">
                                <label class="titform">Código de segurança<font color="red">*</font></label>
                                <input type="text" name="cvv" id="cvv" class="form-control noborder" placeholder="CVV" required="required" tabindex="1" />
                            </div>

                            <div class="field liberaparcelas" style="padding-left: 0px;">
                                <label class="titform">Parcelas<font color="red">*</font></label>                                 
                                <select name='parcelas' id="parcelas" class='form-control noborder parcelas_append'>  
                                    <?php $this->app->parcelamentos($_SESSION['testecarrinho']);?>                         
                                </select>                                   
                            </div>
                            
                            <center>
                                <input type="button" id="creditCreditPaymentButton" class="pagetnet btn_common yellow border_radius pull-right" onclick="pagarCartaoGetnet();" value="FINALIZAR PAGAMENTO" />
                                <!--<div class="carregando col-md-12" style="display:none; text-align:right;">
                                    <img src="{{ this.url.getBaseUri() ~ 'images/cart.gif' }}" /> Aguarde...
                                </div>                                      -->
                            </center>
                        </div>              
                        
                        <div id="boleto" style="display:none;">                           
                            <center>
                                <input type="button" id="creditBoletoPaymentButton" class="pagetnet btn_common yellow border_radius pull-right" onclick="pagarBoletoGetnet();" value="FINALIZAR PAGAMENTO" />
                                <!--<div class="carregando col-md-12" style="display:none; text-align:right;">
                                    <img src="{{ this.url.getBaseUri() ~ 'images/cart.gif' }}" /> Aguarde...
                                </div> -->
                            </center>
                        </div>                   
            </div>
            <input type="hidden" name="creditCardToken" id="creditCardToken" />
            <input type="hidden" name="creditCardBrand" id="creditCardBrand" />            
        </div>
    </div>

    <center>
        <div id="boletoData" name="boletoData" class="paymentMethodGroup" dataMethod="boleto" style="display:none;">
            <input name='cep' type='hidden'>
            <input name='endereco' type='hidden'>
            <input name='numero' type='hidden'>
            <input name='cidade' type='hidden'>
            <input name='estado' type='hidden'>
            <input name='bairro' type='hidden'>
            <input name='complemento' type='hidden'>
            <div class="loaderboleto col-md-12" style="display:none; text-align:right;">
                <img src="{{ this.url.getBaseUri() ~ 'images/cart.gif' }}" /> Aguarde...
            </div>
            <input type="button" id="boletoButton" value="Gerar Boleto" style="background:#9DA92B; color: #fff; padding:10px;width:100%;border-radius:0px;" class="btn btn-default btn-block boleta" />
        </div>       
    </center>
</div>
<div class="row g-2">    

    <div class="form-group" style="margin-right: 20px;">
        <label style="font-weight:bold">CARTÃO:</label>
        <input id="creditCardRadio" type="radio" class="buyCartao form-check-input" name="changePaymentMethod" checked="checked" value="creditCard">
        <label for="creditCardRadio"></label>
    </div>

    <div id="creditCardData" class="paymentMethodGroup" dataMethod="creditCard">
        <div id="cardData"> 
        <div id="dadosOtherPagador" class="dadosOtherPagador">
                <input name='cep' type='hidden'>
                <input name='endereco'   type='hidden'>
                <input name='numero'      type='hidden'>
                <input name='cidade'      type='hidden'>
                <input name='estado'      type='hidden'>
                <input name='bairro'      type='hidden'>
                <input name='complemento' type='hidden'>
                <div id="holderData">
                    <div class="field">
                        <label for="creditCardHolderName">Nome <span> (como gravado no cartão)</span> <font color="red">*</font></label>
                        <input type="text" name="creditCardHolderName" style="text-transform: uppercase;" id="creditCardHolderName" class="form-control" required="required" tabindex="1"/>
                        <div id="valida-nome" class="rederror"></div> 
                    </div>
                    
                    <div class="field" style="margin-top: 5px" id="CPFP">
                        <label for="creditCardHolderCPF">CPF do portador <font color="red">*</font></label>
                        <input type="text" name="creditCardHolderCPF" id="creditCardHolderCPF" class="cpfcnpj form-control" maxlength="14" tabindex="2"/>
                        <div id="valida-cpf" class="rederror"></div> 
                    </div>

                    <div class="field" style="margin-top: 5px">
                        <label for="creditCardHolderBirthDate">Data de nascimento do portador <font color="red">*</font></label>
                        <input type="text" name="creditCardHolderBirthDate" id="creditCardHolderBirthDate" maxlength="10" placeholder="XX/XX/XXXX" class="form-control data" tabindex="3"/>
                        <div id="valida-nascimento" class="rederror"></div>
                    </div>
                    
                    <div class="field" style="margin-top: 5px" id="TelP">
                        <label for="creditCardHolderAreaCode">Telefone do portador <font color="red">*</font></label>
                            <input type="text" name="creditCardHolderPhone" id="creditCardHolderPhone" class="form-control celular col-md-12" placeholder="(XX) X XXXX-XXXX" maxlength="9" tabindex="4"/>
                            <div id="valida-telefone" class="rederror"></div>
                        </div>
                    </div>                      
                </div>
            </div>
                                                  
            <div class="field my-2" id="cardBrand">
                <label for="cardNumber"><b>Número do cartão *</b></label>  
                <input type="text" name="cardNumber" id="cardNumber" class="form-control cartao form-control" onblur="brandCard();" tabindex="5"/>
                <img class="bandeiraCartao"  id="bandeiraCartao" style="float: right; margin: -33px 10px;"/>
                <div id="valida-cartao" class="rederror"></div>
            </div>
            
            <div class="row my-3">
                <div class="field col-4 pe-4" id="expiraCartao">
                    <select name="cardExpirationMonth" id="cardExpirationMonth" class="form-control" tabindex="6">
                        <option>Mês</option>
                        <option value="01">01</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                        <option value="04">04</option>
                        <option value="05">05</option>
                        <option value="06">06</option>
                        <option value="07">07</option>
                        <option value="08">08</option>
                        <option value="09">09</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>  
                </div>

                <div class="field col-8" id="expiraCartaoano">
                    <select name="cardExpirationYear" id="cardExpirationYear" class="form-control" tabindex="7">
                        <option>Ano</option>
                        <?php for($i = date("Y");$i <= date("Y") + 20;$i++){?>
                            <option value="{{ i }}">{{ i }}</option>
                        <?php }?>
                    </select>                                     
                    <div id="valida-vencimento" class="rederror"></div>
                </div>     
            </div>                      

            <div class="field" id="cvvCartao">
                <label for="cardCvv" class="mt-2">Código de Segurança <font color="red">*</font></label>
                <input type="text" name="cardCvv" id="cardCvv" maxlength="5" class="cardDatainput form-control" tabindex="8"/>
                <div id="valida-cvv" class="rederror"></div>
            </div>

            <div class="field" id="installmentsWrapper" style="margin-top: 15px;">
                <label for="installmentQuantity">Parcelas (Valor mínimo de)</label>
                <select name="installmentQuantity" id="installmentQuantity" tabindex="9" class="form-control"></select>
                <input type="hidden" name="installmentValue" id="installmentValue" />
            </div>

            <div class="row" style="margin-top:28px;">    
                <div class="col-md-12 mb-1">
                    <label for="name">Você tem alguma observação sobre esse pedido, insira abaixo?</label>
                    <textarea name="observacao" class="noborder obspagcard form-control" id="campo" rows="2" maxlength="140" tabindex="10"></textarea>
                </div>           
            </div> 
            
            <input type="hidden" name="creditCardToken" id="creditCardToken" />
            <input type="hidden" name="creditCardBrand" id="creditCardBrand" />
            <div class="col-md-12">
                <div id="erro-sandbox" style="text-align:right;color: red;"></div>
                <div id="erro-padrao" style="text-align:right;color: red;"></div>

                <div class="row" style="margin-top: 20px;">    
                    <div class="col-md-12 mb-2">                                            
                        <input type='hidden' name='total_compras'>  
                        <input type="button" id="creditPagseguroPaymentButton" class="btn btn-success btn-outline-hover-success" style="border-color: #4caf50; background-color: #4caf50;color: #fff;" onclick="pagarCartao();" value="FINALIZAR COMPRA" />
                    
                        <div class="loadercartao col-md-12" style="display:none; text-align:center; margin-top: 20px; font-family:'Futura';">
                            <div class="alert alert-success" role="alert">
                                <img src="{{ this.url.getBaseUri() ~ 'images/cart.gif' }}"/> Processando aguarde...
                            </div>                                       
                        </div> 
                    </div>
                </div>
            </div>                                
        </div>
    </div>

</div>
</div>
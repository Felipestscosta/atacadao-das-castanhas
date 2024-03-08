 <form class='pagamentos' id='pagamentos' name='frmpgto' onsubmit="myButton.disabled = true; return true;">                      
                    <input name='cep' type='hidden'>
                    <input name='endereco'   type='hidden'>
                    <input name='numero'      type='hidden'>
                    <input name='cidade'      type='hidden'>
                    <input name='estado'      type='hidden'>
                    <input name='bairro'      type='hidden'>
                    <input name='complemento' type='hidden'>                 
                    <div class="pagamento_cielo">            
                        <input type="hidden" name="tipopagamento" value="Cielo"> 
                        <div class="row col-md-12 mb-1">
                            <div class="alert alert-warning" role="alert" style="font-size: 0.8em;">
                                Atenção! Todas as compras feitas via Cielo, será confirmada a documentação do portador do cartão antes do envio dos produtos.
                              </div>
                        </div>
                        <div class="row">      
                                <div class="col-md-12 mb-1">
                                    <label for="name">BANDEIRA</label>
                                        <select name="bandeira">
                                        <option value="">Selecione</option> 
                                        <option value="Visa">Visa</option> 
                                        <option value="Master">Master Card</option>
                                        <option value="Diners">Diners</option>
                                        <option value="Discover">Discover</option>
                                        <option value="Elo">Elo</option>                       
                                        <option value="JCB">JCB</option>
                                        <option value="Aura">Aura</option>
                                    </select>             
                                    <div class="invalid-feedback">
                                    Selecione a bandeira!
                                    </div>
                                </div>   
                            </div>                   
            
                        <div class="row" style="margin-top:5px;">    
                            <div class="col-md-8 mb-1">
                                <label for="name">NÚMERO DO CARTÃO</label>
                                <input type="text" id="cardCielo" class="cartao" maxlength="19" placeholder="0000 0000 0000 000" onkeypress="return verificanumero(event)" name="numero_cartao" required="" autocomplete="off">
                                <div class="invalid-feedback">
                                Insira o número do cartão!
                                </div>
                            </div>
            
                            <div class="col-md-4 mb-1">
                                <label for="name">CVV</label>
                                <input type="text" name="codigo_seguranca" min="1" max="999" placeholder="XXX" onkeypress="return verificanumero(event)" class="noborder" width="219px" ;="" required="">
                                <div class="invalid-feedback">
                                Insira o CVV!
                                </div>
                            </div>   
                        </div>
            
                        <div class="row" style="margin-top:5px;">    
                            <div class="col-md-12 mb-1">
                                <label for="name">NOME NO CARTÃO</label>
                                <input type="text" class="noborder" style="text-transform:uppercase;" placeholder="COMO ESTÁ ESCRITO NO CARTÃO" name="nome_cartao" required="">
  
                                <div class="invalid-feedback">
                                Insira seu nome!
                                </div>
                            </div>                     
                        </div>   

                         <div class="row">    
                            <div class="col-md-12 mb-1">
                                <label for="name">CPF DO DONO DO CARTÃO</label>
                                <input type="text" class='form-control noborder cpf' style="text-transform:uppercase;" placeholder='INFORME O CPF DO DONO DO CARTÃO' name="cpf_cartao" required>
                                
                                <div class="invalid-feedback">
                                Insira seu cpf!
                                </div>
                            </div>                     
                        </div>  
                        
                        <div class="row" style="margin-top:5px;">    
                            <div class="col-md-6 mb-1">
                                <label for="name">MÊS</label>
                                    <select name="mes" class="noborder" required="">
                                    <?php for($i= 1;$i <= 12;$i++): ?>
                                        <option value="<?php if(strlen($i) < 2) {echo "0".$i;}else{echo $i;}?>"><?php if(strlen($i) < 2) {echo "0".$i;}else{echo $i;}?></option>
                                    <?php endfor;?>
                                 </select>               
                                <div class="invalid-feedback">
                                        Selecione o mês de vencimento!
                                </div>
                            </div>
            
                            <div class="col-md-6 mb-1">
                                <label for="name">ANO</label>
                                    <select name="ano" class="noborder" required="">
                                        <option>Ano venc. cartão</option>
                                        <?php for($i = date("Y");$i <= date("Y") + 20;$i++){?>
                                            <option value="{{ i }}">{{ i }}</option>
                                        <?php }?>
                                    </select>               
                                <div class="invalid-feedback">
                                Insira o ano!
                                </div>
                            </div>   
                        </div>     
            
                        <div class="row" style="margin-top:5px;">    
                            <div class="col-md-12 mb-1">
                                <label for="name">PARCELAS</label>
                                <div class="parcelas_append"></div>               
                                <div class="invalid-feedback">
                                Selecione a parcela!
                                </div>
                            </div>           
                        </div>   
                        
                        <div class="row" style="margin-top:28px;">    
                            <div class="col-md-12 mb-1">
                                <label for="name">Você tem alguma observação sobre esse pedido, insira abaixo?</label>
                                <textarea name="observacao_pedido" class="noborder obspaggielo" id="campo" rows="2" onkeyup="mostrarResultado(this.value,140,'spcontando');contarCaracteres(this.value,140,'sprestante')"></textarea>
                                <span id="spcontando">Limite 140 caracteres.</span><br />
                                <span id="sprestante"></span>
                            </div>           
                        </div>    
                    </div> 
                    
                    <div class="row" style="margin-top: 20px;">    
                        <div class="col-md-12 mb-2">                                            
                            <input type='hidden' name='total_compras'>  
                            <input type="button" name="myButton" id="creditCieloPaymentButton" style="margin-top: 10px; border-color: #4caf50; background-color: #4caf50;color: #fff;" class="botaoverde btn btn-success btn-outline-hover-success finalizar_compras" style=" border: 2px solid #409444; border-bottom-color: #409444;background-color: #409444; color:#fff;" value="FINALIZAR COMPRA" />  
                        
                            <div class="loadercielo col-md-12" style="display:none; text-align:center; margin-top: 20px; font-family:'Futura',">
                                <div class="alert alert-success" role="alert">
                                    <img src="{{ this.url.getBaseUri() ~ 'images/cart.gif' }}"/> Processando aguarde...
                                </div>                                       
                            </div> 
                        </div>
                    </div> 
                </form>
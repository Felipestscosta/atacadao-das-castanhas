<script type="text/javascript" src="{{ this.url.getBaseUri() }}js/jquery.mask.min.js"></script>
<script>
    ////////////////////////////////*INPUT MASK*///////////////////////////////
    $(document).ready(function () {
        $('.cpf').mask('999.999.999-99');
        $('.cnpj').mask('99.999.999/9999-99');
        $('.cep').mask('99999-999');
        $('.telefone').mask('(99) 9999-9999');
        $('.data').mask('99/99/9999');
        $('.dataurl').mask('99-99-9999');
        $('.cartao').mask('9999.9999.9999.9999');

        var SPMaskBehavior = function (val) {
            return val.replace(/\D/g, '').length === 11 ? '(00) 0 0000-0000' : '(00) 0000-00009';
        },
            spOptions = {
                onKeyPress: function (val, e, field, options) {
                    field.mask(SPMaskBehavior.apply({}, arguments), options);
                }
            };
        $('.celular').mask(SPMaskBehavior, spOptions);


        var SPMaskCelBehavior = function (val) {
            return val.replace(/\D/g, '').length === 9 ? '00000-0000' : '0000-00009';
        },
            spOptionsCel = {
                onKeyPress: function (val, e, field, options) {
                    field.mask(SPMaskCelBehavior.apply({}, arguments), options);
                }
            };
        $('.celcard').mask(SPMaskCelBehavior, spOptionsCel);

        var CpfCnpjMaskBehavior = function (val) {
                    return val.replace(/\D/g, '').length <= 11 ? '000.000.000-009' : '00.000.000/0000-00';
                },
            cpfCnpjpOptions = {
                onKeyPress: function(val, e, field, options) {
                field.mask(CpfCnpjMaskBehavior.apply({}, arguments), options);
            }
        };
        $('.cpfcnpj').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions);

        //CPF E CNPJ MESMO CAMPO
        var CpfCnpjMaskBehavior = function (val) {
            return val.replace(/\D/g, '').length <= 11 ? '000.000.000-009' : '00.000.000/0000-00';
        },
            cpfCnpjpOptions = {
                onKeyPress: function (val, e, field, options) {
                    field.mask(CpfCnpjMaskBehavior.apply({}, arguments), options);
                }
            };

        $(':input[name=documento]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions);     
    });

</script>

<script>
    $("input[name='changePaymentMethod']").on('click', function (e) {
        if ($(this).val() == 'creditCard') {
            $('#entregaData').css('display', 'none');
            $('#creditCardData').css('display', 'block');
            $('.pagseguro_finaliza').show();  
        } else if ($(this).val() == 'entrega') {
            $('#creditCardData').css('display', 'none');
            $('#entregaData').css('display', 'block');
            $('.pagseguro_finaliza').hide();  
        }
    });

    //GERA PARCELAS
    function parcelasDisponiveis() {      
        PagSeguroDirectPayment.getInstallments({
            amount: (($("#totalValue").html()).replace(",", ".")),
            brand: $("#creditCardBrand").val(), 
           // maxInstallmentNoInterest: 2,
            success: function (response) {                
                $("#installmentsWrapper").css('display', "block");
                var installments = response.installments[$("#creditCardBrand").val()];               
                var options = '<option>Selecione:</option>';
                for (var i in installments) {
                    var optionItem = installments[i];
                    var optionQuantity = optionItem.quantity;
                    var optionAmount = optionItem.installmentAmount;
                    var infojunros = (installments[i].interestFree) ? " sem juros" : " com juros";
                    var optionLabel = (optionQuantity + " x R$ " + (optionAmount.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,').replace(".", ',')) + infojunros);
                    var optionLabel1 = (optionQuantity > 1) ? optionLabel + " - Total R$ " + installments[i].totalAmount.toFixed(2).toString().replace('.',',') : optionLabel;
                   
                    options += (`<option value="${optionItem.quantity}" valorparcela="${optionAmount.toFixed(2)}" data-valortotalpagseguro="${installments[i].totalAmount}">${optionLabel1}</option>`);
                };
                $("#installmentQuantity").html(options);
            },
            error: function (response) {
                //console.log(response);
            },
            complete: function (response) {
            }
        })
    }

    $("#installmentQuantity").change(function () {
        var option = $(this).find("option:selected");
        if (option.length) {
            $("#installmentValue").val(option.attr("valorparcela"));
        }
            $("#creditCardPaymentButton").prop('disabled', false);
    });

    $('#cardCvv').blur(function () {
        PagSeguroDirectPayment.createCardToken({
            cardNumber: $("#cardNumber").val().replace(/[^\d]+/g, ''),
            brand: $("#creditCardBrand").val(),
            cvv: $(this).val(),
            expirationMonth: $("#cardExpirationMonth").val(),
            expirationYear: $("#cardExpirationYear").val(),
            success: function (response) {
                $("#creditCardToken").val(response.card.token);
            },
            error: function (response) {               
                if (response.error) { 
                    $.each(response.errors, function (index, value) {                       
                        tratarError(value);
                    });
                }
            },
            complete: function (response) {
            }
        });
    });

    function brandCard() {
        var sessao_id = "<?php echo $pagsession;?>";
        PagSeguroDirectPayment.setSessionId(sessao_id);
        var numcard = $("[name='cardNumber']").val().replace(".", "");
        PagSeguroDirectPayment.getBrand({
            cardBin: numcard,
            success: function (response) {            
                $("#creditCardBrand").val(response.brand.name);
                $("#bandeiraCartao").attr('src', '{{this.url.getBaseUri()}}images/' + response.brand.name + '.png');
                parcelasDisponiveis();
            },
            error: function (response) {
                $("#cardNumber").css('border', '2px solid red');
                $("#cardNumber").focus();
            },
            complete: function (response) {
            }
        });
    }


    // function showModal() {
    //   $("#modal-title").html("Aguarde");
    //   $(".modal-body").html("");
    //   $("#aguarde").modal("show");
    // }

    //pagamento Boleto
    function pagarEntrega() {
        $('.loaderentrega').show();        
        $.ajax({
            type: 'POST',
            url: '{{ this.url.getBaseUri() }}checkout/pagamentoEntrega',
            cache: false,
            data: {
                id: "<?php echo $id;?>", 
                cep: $("input[name=cep]").val(),
                endereco: $("input[name=endereco]").val(),
                numero: $("input[name=numero]").val(),
                cidade: $("input[name=cidade]").val(),
                estado: $("input[name=estado]").val(),
                bairro: $("input[name=bairro]").val(),
                complemento: $("input[name=complemento]").val(),              
                pais: "BRA",               
                totalcompras: $("input[name=total_compras]").val(),
                observacao_pedido: $(".obspagent").val()                  
            },
            success: function (data) {                
                        $('.loaderentrega').hide();       
                         var closeInSeconds = 4,
                            displayText = "Você será redirecionado em #1 segundos.",
                            timer; 
                            swal({
                                    title: "Compra efetuada com sucesso!",
                                    text: displayText.replace(/#1/, closeInSeconds), 
                                    type: "success",
                                    //timer: closeInSeconds * 1000,
                                    showConfirmButton: false
                                });
                            timer = setInterval(function() { 
                                closeInSeconds--; 
                                if (closeInSeconds == 1) { 
                                    clearInterval(timer);                                
                                    location.href = '{{this.url.getBaseUri()}}checkout/sucesso'; 
                                } 
                                $('.sweet-alert > p').text(displayText.replace(/#1/, closeInSeconds)); 
                                },1000);                                           
                
            }
        });
    }

    //pagamento Boleto
    function pagarBoleto() {
        $('#boletoButton').hide();       
        $('.loaderboleto').show();        
        $.ajax({
            type: 'POST',
            url: '{{ this.url.getBaseUri() }}checkout/pagamentoBoleto',
            cache: false,
            data: {
                id: "<?php echo $id;?>", 
                cep: $("input[name=cep]").val(),
                endereco: $("input[name=endereco]").val(),
                numero: $("input[name=numero]").val(),
                cidade: $("input[name=cidade]").val(),
                estado: $("input[name=estado]").val(),
                bairro: $("input[name=bairro]").val(),
                complemento: $("input[name=complemento]").val(),              
                pais: "BRA",
                senderHash: PagSeguroDirectPayment.getSenderHash(), 
                totalcompras: $("input[name=total_compras]").val(),
                observacao_pedido: $(".obspagbol").val()           
            },
            success: function (data) {  
                if (!(data.paymentLink)) {                                                   
                    $.each(data.error, function (index, value) {   
                            if (value.code) {
                                $('.erroboleta').html(value.mensagem);
                                $('.loaderboleto').hide();
                                $('.minhaconta').show();
                                //tratarError(value.code);
                                } else {
                                 $('.erroboleta').html(data.error.mensagem);
                                  $('.loaderboleto').hide();
                                  $('.minhaconta').show();
                                //tratarError(data.error.code)
                            }                     
                    })      
                } else {  
                        $('.loaderboleto').hide();                                    
                        //window.location = data.paymentLink;
                         var closeInSeconds = 4,
                            displayText = "Uma nova janela será aberta em #1 segundos.",
                            timer; 
                            swal({
                                    title: "Efetuado com sucesso!",
                                    text: displayText.replace(/#1/, closeInSeconds), 
                                    type: "success",
                                    timer: closeInSeconds * 1000,
                                    showConfirmButton: false
                                });
                            timer = setInterval(function() { 
                                closeInSeconds--; 
                                if (closeInSeconds == 1) { 
                                    clearInterval(timer);                                
                                    window.open(data.paymentLink, 'pagseguroboleto', 'toolbar=1, scrollbars=1, location=1, statusbar=0, menubar=1, resizable=1, width=900, height=600');
                                } 
                                $('.sweet-alert > p').text(displayText.replace(/#1/, closeInSeconds)); 
                                },1000);                                           
                }
            }
        });
    }

    //pagamento Cartão
    function pagarCartao() {        
        $('.loadercartao').show();
        $('.carregando').show();      
        $("#valida-telefone").html("");  
        $("#valida-ddd").html("");
        $("#valida-nome").html("");
        $("#valida-cartao").html("");
        $("#valida-vencimento").html("");
        $("#valida-cvv").html("");
        $("#valida-nascimento").html("");
        $("#valida-nome").html("");
        $("#valida-cpf").html("");
        $("#erro-sandbox").html("");
        $("#erro-padrao").html("");
        //$('.pagseguro_finaliza').prop('value', 'Processando aguarde...').prop('disabled', true);         

        let totalPriceInstallments = $($("#installmentQuantity").find('option:selected')).data("valortotalpagseguro");
        let totalWithoutInstallments =  $("input[name=total_compras]").val()
        let endPriceOrder = totalPriceInstallments > totalWithoutInstallments ? totalPriceInstallments : totalWithoutInstallments        

        $.ajax({
            type: 'POST',
            url: '{{ this.url.getBaseUri() }}checkout/pagamentoCartao',
            cache: false,          
            data: {
                id: "<?php echo $id;?>",
                email: $("#senderEmail").val(),
                nome: $("#senderName").val(),
                cpf: $("#senderCPF").val(),
                ddd: $("#senderAreaCode").val(),
                telefone: $("#senderPhone").val(),              
                pais: "BRA",
                senderHash: PagSeguroDirectPayment.getSenderHash(),
                cardToken: $("#creditCardToken").val(),
                cardNome: $("#creditCardHolderName").val(),
                cardCPF: $("#creditCardHolderCPF").val(),
                cardNasc: $("#creditCardHolderBirthDate").val(),
                cardFoneArea: $("#creditCardHolderAreaCode").val(),
                cardFoneNum: $("#creditCardHolderPhone").val(),
                numParcelas: $("#installmentQuantity").val(),
                valorParcelas: $("#installmentValue").val(),
                valorTotalParcela: totalPriceInstallments,
                cep: $("input[name=cep]").val(),
                endereco: $("input[name=endereco]").val(),
                numero: $("input[name=numero]").val(),
                cidade: $("input[name=cidade]").val(),
                estado: $("input[name=estado]").val(),
                bairro: $("input[name=bairro]").val(),
                complemento: $("input[name=complemento]").val(),
                totalcompras: endPriceOrder,
                observacao_pedido: $(".obspagcard").val()                   
            },
            success: function (data) {  
                console.log(data)                           
                if(data['error']) {
                     if (data['error']['code'] == "53037") {
                        $("#creditPagseguroPaymentButton").click();
                     } else {
                            if(data['error']['code']){           
                                tratarError(data['error']['code'],data['error']['mensagem']);
                            }
                            else{
                                $.each(data['error'], function (index, value) {                                                                      
                                    tratarError(value.code,value.mensagem);                                               
                                }) 
                            } 
                    }                 
                } else {                                          
                    $('.loadercartao').hide();  
                    $('.carregando').hide();  
                    var closeInSeconds = 4,
                    displayText = "Você será redirecionado em #1 segundos.",
                    timer; 
                    swal({
                            title: "Transação efetuada",
                            text: displayText.replace(/#1/, closeInSeconds), 
                            type: "success",
                            showConfirmButton: false
                        });
                    timer = setInterval(function() { 
                        closeInSeconds--; 
                        if (closeInSeconds == 1) { 
                            clearInterval(timer);                                
                            location.href = '{{this.url.getBaseUri()}}checkout/sucesso'; 
                        } 
                        $('.sweet-alert > p').text(displayText.replace(/#1/, closeInSeconds)); 
                    },1000);
                }
            }
        });

        // $.ajax({
        //     type: 'POST',
        //     url: '{{ this.url.getBaseUri() }}checkout/pagamentoCartao',
        //     cache: false,          
        //     data: {
        //         id: "<?php echo $id;?>",
        //         email: $("#senderEmail").val(),
        //         nome: $("#senderName").val(),
        //         cpf: $("#senderCPF").val(),
        //         ddd: $("#senderAreaCode").val(),
        //         telefone: $("#senderPhone").val(),              
        //         pais: "BRA",
        //         senderHash: PagSeguroDirectPayment.getSenderHash(),
        //         cardToken: $("#creditCardToken").val(),
        //         cardNome: $("#creditCardHolderName").val(),
        //         cardCPF: $("#creditCardHolderCPF").val(),
        //         cardNasc: $("#creditCardHolderBirthDate").val(),
        //         cardFoneArea: $("#creditCardHolderAreaCode").val(),
        //         cardFoneNum: $("#creditCardHolderPhone").val(),
        //         numParcelas: $("#installmentQuantity").val(),
        //         valorParcelas: $("#installmentValue").val(),                            
        //         cep: $("input[name=cep]").val(),
        //         endereco: $("input[name=endereco]").val(),
        //         numero: $("input[name=numero]").val(),
        //         cidade: $("input[name=cidade]").val(),
        //         estado: $("input[name=estado]").val(),
        //         bairro: $("input[name=bairro]").val(),
        //         complemento: $("input[name=complemento]").val(),
        //         totalcompras: $("input[name=total_compras]").val(),
        //         observacao_pedido: $(".obspagcard").val()                        
        //     },
        //     success: function (data) {                             
        //         if(data['error']) {
        //              if (data['error']['code'] == "53037") {
        //                 $("#creditPagseguroPaymentButton").click();
        //              } else {
        //                     if(data['error']['code']){           
        //                         tratarError(data['error']['code'],data['error']['mensagem']);
        //                     }
        //                     else{
        //                         $.each(data['error'], function (index, value) {                                                                      
        //                             tratarError(value.code,value.mensagem);                                               
        //                         }) 
        //                     } 
        //             }                 
        //         } else {                                          
        //                 $('.loadercartao').hide();  
        //                 $('.carregando').hide();  
        //                     var closeInSeconds = 4,
        //                     displayText = "Você será redirecionado em #1 segundos.",
        //                     timer; 
        //                     swal({
        //                             title: "Transação efetuada",
        //                             text: displayText.replace(/#1/, closeInSeconds), 
        //                             type: "success",
        //                             showConfirmButton: false
        //                         });
        //                     timer = setInterval(function() { 
        //                         closeInSeconds--; 
        //                         if (closeInSeconds == 1) { 
        //                             clearInterval(timer);                                
        //                             //location.href = '{{this.url.getBaseUri()}}checkout/sucesso'; 
        //                         } 
        //                         $('.sweet-alert > p').text(displayText.replace(/#1/, closeInSeconds)); 
        //                         },1000);                         
                    
        //         }
        //     }
        // });
    }

    function tratarError(id,mensagem) {     
        if (id.charAt(0) == '2') id = id.substr(1);
        if (id == "53020" || id == '53021') {  
            $("#valida-telefone").html(mensagem);     
            $("#senderPhone").css('border', '2px solid red');
        } else if (id == "53018" || id == "53019") {
            $("#valida-ddd").html(mensagem);
            $("#senderAreaCode").css('border', '2px solid red');
        } else if (id == "53013" || id == '53014' || id == '53015') {
            $("#valida-nome").html(mensagem);
            $("#senderName").css('border', '2px solid red');
        } else if (id == '10001') {
            $("#valida-cartao").html(mensagem);
            $("#cardNumber").css('border', '2px solid red');
        } else if (id == '10002' || id == '30405') {
            $("#valida-vencimento").html(mensagem);
            $("#cardExpirationMonth").css('border', '2px solid red');
            $("#cardExpirationYear").css('border', '2px solid red');
        } else if (id == '10006' || id == '10003' || id == '10004' || id == '53037') {
            $("#valida-cvv").html(mensagem);
            $("#cardCvv").css('border', '2px solid red');
        } else if (id == '53047') {
            $("#valida-nascimento").html(mensagem);
            $("#creditCardHolderBirthDate").css('border', '2px solid red');
        } else if (id == '53042' || id == '53043' || id == '53044') {
            $("#valida-nome").html(mensagem);
            $("#creditCardHolderName").css('border', '2px solid red');
        } else if (id == '53045' || id == '53046' || id == '53017') {
            $("#valida-cpf").html(mensagem);
            $("#creditCardHolderCPF").css('border', '2px solid red');
        } else if (id == '53051' || id == '53052') {  
            $("#valida-telefone").html(mensagem);   
            $("#creditCardHolderPhone").css('border', '2px solid red');
        } else if (id == '53049' || id == '53050') {
            $("#valida-ddd").html(mensagem);
            $("#creditCardHolderAreaCode").css('border', '2px solid red');
        } else if (id == '53122') {
            $("#erro-sandbox").html(mensagem);
        }
        else {
            $("#erro-padrao").html(mensagem);
            //$("#erro-padrao").append("<p>"+ id + "</p>");
        }
    }

    $(document).on('click','.corsele',function(){  
        $('.corsele').closest('tr').css({"background" : "#fff",  "border-bottom": "3px solid #e4e4e4"}); 
        if ($(this).is(":checked")) {					
            $(this).closest('tr').css({"background" : "#f0fcf7",  "border-bottom": "3px solid #3ECBBC"});
        }
    });
    
</script>
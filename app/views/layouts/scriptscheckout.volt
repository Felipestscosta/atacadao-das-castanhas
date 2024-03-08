<script type="text/javascript" src="{{ this.url.getBaseUri() }}js/jquery.mask.min.js"></script>
<script>
    ////////////////////////////////*INPUT MASK*///////////////////////////////
    $(document).ready(function () {
        //$('.cpf').mask('999.999.999-99');
        // $('.cnpj').mask('99.999.999/9999-99');
        $('.cep').mask('99999-999');
        $('.telefone').mask('(99) 9999-9999');
        $('.data').mask('99/99/9999');
        $('.validade').mask('99/99');
        $('.dataurl').mask('99-99-9999');
        $('.cartao').mask('9999.9999.9999.9999');

        //  $('#smartwizard').smartWizard();            

        var SPMaskBehavior = function (val) {
            return val.replace(/\D/g, '').length === 11 ? '(00) 0 0000-0000' : '(00) 0000-00009';
        },
            spOptions = {
                onKeyPress: function (val, e, field, options) {
                    field.mask(SPMaskBehavior.apply({}, arguments), options);
                }
            };
        $('.celular').mask(SPMaskBehavior, spOptions);


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
  	$('.cartao').blur(function(){
          $('.cartao-bandeira-img').css('display','block'); 
          var cardNumber = $(this).val().replace(/[^\d]+/g,'');   
          var regexElo = /^((((636368)|(438935)|(504175)|(451416)|(636297))\d{0,10})|((5067)|(4576)|(4011))\d{0,12})$/;      
		  var regexVisa = /^4[0-9]{12}(?:[0-9]{3})?/;
		  var regexMaster = /^5[1-5][0-9]{14}/;
		  var regexAmex = /^3[47][0-9]{13}/;
		  var regexDiners = /^3(?:0[0-5]|[68][0-9])[0-9]{11}/;
		  var regexDiscover = /^6(?:011|5[0-9]{2})[0-9]{12}/;
		  var regexJCB = /^(?:2131|1800|35\d{3})\d{11}/;		  
          var regexHipercard = /^(606282\d{10}(\d{3})?)|(3841\d{15})$/;
          var bandeira = '';
		  
          if(regexElo.test(cardNumber)){
		   bandeira = 'Elo';
		  }
		  if(regexVisa.test(cardNumber)){
		   bandeira = 'Visa';
		  }
		  if(regexMaster.test(cardNumber)){
		   bandeira = 'Mastercard';
		  }
		  if(regexAmex.test(cardNumber)){
		   bandeira = 'Amex';
		  }
		  if(regexDiners.test(cardNumber)){
		   bandeira = 'diners';
		  }
		  if(regexDiscover.test(cardNumber)){
		   bandeira = 'discover'
		  }
		  if(regexJCB.test(cardNumber)){
		   bandeira = 'jcb';
		  }		 
          if(regexHipercard.test(cardNumber)){
		   bandeira = 'Hipercard';
		  }
		  $('.cartao-bandeira').attr('value',bandeira);
		  url = '{{this.url.getBaseUri()}}img/bandeiras/'+bandeira+'.png';
		  if($('.cartao-bandeira-img').length == 0){
		  	$(this).parent().parent().prepend('<img src="'+url+'" class="img-responsive thumbnail cartao-bandeira" width="30px" />')
		  }else{
		  	$('.cartao-bandeira-img').attr('src',url)
		  }
	})

    //pagamento Boleto
    function pagarBoletoGetnet() {
       // $('.loaderboleto').show();  
       $('.pagetnet').prop('value', 'AGUARDE...').prop('disabled', true);             
        $.ajax({
            type: 'POST',
            url: '{{ this.url.getBaseUri() }}checkout/pagamentoBoletoGetNet',
            cache: false,
            data: {
                tipopagamento : $('#tipopagamento').val(),     
                valor: $("input[name=total_compras]").val(),
                cep: $("input[name=cep]").val(),
                endereco: $("input[name=endereco]").val(),
                numero: $("input[name=numero]").val(),
                cidade: $("input[name=cidade]").val(),
                estado: $("input[name=estado]").val(),
                bairro: $("input[name=bairro]").val(),
                complemento: $("input[name=complemento]").val()     
            },
            success: function (data) {  
                   if (data.status == true) {               
                        var closeInSeconds = 4,
                        displayText = "Você será redirecionado em #1 segundos.",
                        timer; 
                        swal({
                                title: data.mensagem,
                                text: displayText.replace(/#1/, closeInSeconds), 
                                type: "success",
                                timer: closeInSeconds * 1000,                              
                                showConfirmButton: false,                                
                            });
                        timer = setInterval(function() { 
                            closeInSeconds--; 
                            if (closeInSeconds == 1) { 
                                clearInterval(timer);   
                                window.open(data.boleta, '_blank');    
                            } 
                            $('.sweet-alert > p').text(displayText.replace(/#1/, closeInSeconds)); 
                            },1000);          
                } else {
                        var closeInSeconds = 4,
                        displayText = "Você será redirecionado em #1 segundos.",
                        timer; 
                        swal({
                                title: "Erro ao processar - "+ data.mensagem,
                                text: displayText.replace(/#1/, closeInSeconds),
                                type: "error",
                                //timer: closeInSeconds * 1000,
                                showConfirmButton: false
                            });
                        timer = setInterval(function() { 
                            closeInSeconds--; 
                            if (closeInSeconds == 1) { 
                                clearInterval(timer);                                
                                //location.href = host+'cupons'; 
                            } 
                            $('.sweet-alert > p').text(displayText.replace(/#1/, closeInSeconds)); 
                            },1000); 
                }
            }
        });
    }

    //pagamento Cartão
    function pagarCartaoGetnet() { 
        //$('.carregando').show();        
        $('.pagetnet').prop('value', 'AGUARDE...').prop('disabled', true);                      
        $.ajax({
            type: 'POST',
            url: '{{ this.url.getBaseUri() }}checkout/pagamentoCartaoGetnet',
            cache: false,
            data: {              
                tipopagamento : $('#tipopagamento').val(),              
                nome: $("#nome").val(),   
                cardNumber: $("#cardNumber").val(),
                creditCardBrand: $("#creditCardBrand").val(),               
                validade: $('#expiryDate').val(),
                cvv: $("#cvv").val(),     
                parcelas: $("#parcelas").val(),
                valor: $("input[name=total_compras]").val(),                          
                cep: $("input[name=cep]").val(),
                endereco: $("input[name=endereco]").val(),
                numero: $("input[name=numero]").val(),
                cidade: $("input[name=cidade]").val(),
                estado: $("input[name=estado]").val(),
                bairro: $("input[name=bairro]").val(),
                complemento: $("input[name=complemento]").val()               
            },
            success: function (data) {                       
                if (data.status == true) {               
                        var closeInSeconds = 4,
                        displayText = "Você será redirecionado em #1 segundos.",
                        timer; 
                        swal({
                                title: "Compra efetuada com sucesso!",
                                text: displayText.replace(/#1/, closeInSeconds), 
                                type: "success",
                                timer: closeInSeconds * 1000,
                                showConfirmButton: false
                            });
                        timer = setInterval(function() { 
                            closeInSeconds--; 
                            if (closeInSeconds == 1) { 
                                clearInterval(timer);                                
                                location.href = '{{this.url.getBaseUri()}}paginas/minhaconta'; 
                            } 
                            $('.sweet-alert > p').text(displayText.replace(/#1/, closeInSeconds)); 
                        },1000); 
                        $('.pagetnet').prop('value', 'FINALIZAR COMPRA').prop('disabled', false);  
                        $('#cardNumber').val(''); 
                        $('#nome').val(''); 
                        $('#expiryDate').val(''); 
                        $('#cvv').val(''); 
                        $('#parcelas').val('');  
                        $('.cartao-bandeira-img').css('display','none');                    
                } else {
                        var closeInSeconds = 4,
                        displayText = "Você será redirecionado em #1 segundos.",
                        timer; 
                        swal({
                                title: "Erro ao processar - "+ data.mensagem,
                                text: displayText.replace(/#1/, closeInSeconds), 
                                type: "error",
                                timer: closeInSeconds * 1000,
                                showConfirmButton: false
                            });
                        timer = setInterval(function() { 
                            closeInSeconds--; 
                            if (closeInSeconds == 1) { 
                                clearInterval(timer);                                
                                location.href = host+'cupons'; 
                            } 
                            $('.sweet-alert > p').text(displayText.replace(/#1/, closeInSeconds)); 
                        },1000); 
                        $('.pagetnet').prop('value', 'FINALIZAR COMPRA').prop('disabled', false);  
                        $('#cardNumber').val(''); 
                        $('#nome').val(''); 
                        $('#expiryDate').val(''); 
                        $('#cvv').val(''); 
                        $('#parcelas').val('');  
                        $('.cartao-bandeira-img').css('display','none');   
                }
            }
        });
    }      
</script>


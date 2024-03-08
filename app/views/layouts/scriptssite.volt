<script type="text/javascript" src="{{ this.url.getBaseUri() }}js/jquery.mask.min.js"></script>   
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
<script>
    ////////////////////////////////*INPUT MASK*///////////////////////////////
    $(document).ready(function () {
        $('.cpf').mask('999.999.999-99');
        $('.cnpj').mask('99.999.999/9999-99');
        $('.cep').mask('99999-999');
        $('.telefone').mask('(99) 9999-9999');
        $('.data').mask('99/99/9999');
        $('.dataurl').mask('99-99-9999');
        
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
 
      //$('[data-toggle="tooltip"]').tooltip();
      
      
      /////////////////////////////////newsleter////////////////////////     
       $("#mc-news").validate({
        debug: true,
            rules: {
                email: {
                    required: true,
                    email: true
                }                                         
            },
            messages:{
                email: 'E-mail inválido'                               
            },
            submitHandler: function(form) {             
                var f = $("#mc-news");
                // f.preventDefault();        
                $('.ajax-loader').show();        
                    $.ajax({
                        url: '{{ this.url.getBaseUri() }}paginas/news',
                        type: "POST",
                        data: f.serialize(),
                    }).done(function (data) {
                        if (data['status'] == true) {
                            $(".divnews").html("<div class='alert alert-success'>"+data['mensagem']+"</div>");  
                            $('#mc-email').val(); 
                            setTimeout(function() {
                                $(".divnews").fadeOut().empty();
                                $("input[name=email]").val('');
                            }, 5000);                         
                        } else {
                            $(".divnews").html("<div class='alert alert-danger'>"+data['mensagem']+"</div>");
                            $('#mc-email').val();
                            setTimeout(function() {
                                $(".divnews").fadeOut().empty();
                            }, 5000);    
                        }                   
                    });
            }
        }); 

         /////////////////////////////////newsleter////////////////////////     
       $("#formcontato").validate({
        debug: true,
            rules: {
                assunto:"required",
                nome:"required",
                telefone:"required",
                mensagem:"required",
                email: {
                    required: true,
                    email: true
                }                                         
            },
            messages:{
                email: 'E-mail inválido',
                nome: 'Informe o seu nome',
                assunto: "Selecione o assunto que deseja tratar",  
                mensagem: "Informe a mensagem",                               
            },
            submitHandler: function(form) {             
                var f = $("#formcontato");
                // f.preventDefault();        
                $('.ajax-loader').show();        
                    $.ajax({
                        url: '{{ this.url.getBaseUri() }}paginas/send',
                        type: "POST",
                        data: f.serialize(),
                    }).done(function (data) {
                        if (data['status'] == true) {
                            $(".divcont").html("<div class='alert alert-success'>"+data['mensagem']+"</div>");  
                            $('#formcontato').val(); 
                            setTimeout(function() {
                                $(".divcont").fadeOut().empty();
                            }, 5000);                         
                        } else {
                            $(".divcont").html("<div class='alert alert-danger'>"+data['mensagem']+"</div>");
                            $('#formcontato').val();
                            setTimeout(function() {
                                $(".divcont").fadeOut().empty();
                            }, 5000);    
                        }                   
                    });
            }
        });
  
       $(".formulario_contato").submit(function () {
            event.preventDefault();
            $('.loading').show();
            dados = $(this).serialize()
            $.ajax({
                url: "{{this.url.getBaseUri()}}paginas/send",
                type: "POST",
                data: dados                
            }).done(function (data) {
                if (data['status'] == true) { 
                    $('.loading').hide();
                    $('.msg').text('Enviado com sucesso!');
                    $(".msg").delay(5000).fadeOut();
                    $("#formcontato")[0].reset();
                }
                else {
                   
                    $('.divMsgCont').fadeOut(7000);
                }
            })
        });  


        $("#formcontato").validate({
        debug: true,
        rules: {
            email: "required",
            nome: "required",
            assunto: "required", 
            mensagem: "required",                       
        },
            messages:{
                email: 'O e-mail é obrigatório',
                nome: 'O nome é obrigatório',
                assunto: 'O assunto é obrigatório',
                mensagem: 'A mensagem é obrigatória'
            }
        });    

        $.each($('.show-detalhes'),function(key,value){
            $('.show-detalhes').eq(key).click(function(){
                $('.produto-detalhes').eq(key).toggle('fast');
            })
        })        
    });




    $(document).on('click', '.tamanhoselec', function(){      
            var tamanho = $(this).data('tamanho');     
            var estoque =  $(this).data('estoque');                
            $('.adicionar_carrinho').attr('data-tamanho', tamanho);
            $('#valormaximo').val(estoque);
            $('.adicionar_carrinho').removeClass('desabilita');   
            $(".corteste li").each(function() {   
                if(tamanho == $('a',this).data('tamanho')){ 
                    $(this).css({'background':'#EE8E9B'})      
                    $('a',this).css({'color':'#ffffff !important'})                                              
                } 
                else{
                    $(this).removeAttr('style');
                }                        
            });
    });

    $(document).on('click', '.testamodal', function(){  
        $('body').addClass('win no-loader');    
        var id = $(this).data('id');                     
        var key = $(this).data('key');                             
        $(key).load("{{this.url.getBaseUri()}}paginas/visualizacao",{id:id}); 
    });

    $(document).on('click', '.deal-modal', function(){  
        $('body').addClass('win no-loader');    
        var id = $(this).data('id');                     
        var key = $(this).data('key');                             
        $(key).load("{{this.url.getBaseUri()}}paginas/promocoes",{id:id}); 
    });

      ///////////////////////////////////////////////////DELETE CARRINHO TOPO//////////////////////////////////////////
    $(document).on('click', '.cart_quantity_topo', function(){          
            var elemento = this;
            var id = $(this).data('id');          
            $.ajax({
                data: {id:id},
                type: 'POST',
                url: '{{this.url.getBaseUri()}}paginas/removeprodutoindex',
            }).done(function (retorno) {
                $(elemento).closest(".minicart-prd").remove();
                $(elemento).closest().remove();   
                $('.cart-count').empty().text(retorno['qtd']);   
                $('.amount').text(retorno['total_cart'].toFixed(2));           
            }).fail(function () {

            });
            return false;
        });


    function Mudarestado(el) {
    var display = document.getElementById(el).style.display;
    if(display == "none")
        document.getElementById(el).style.display = 'block';
    else
        document.getElementById(el).style.display = 'none';
}

</script>








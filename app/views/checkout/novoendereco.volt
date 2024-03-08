<form class="form-horizontal new_endereco">
    <fieldset>
        <div class="form-group">
             <div class="divMsgCep"></div>
          <label class="col-md-4 control-label" for="textinput">CEP *</label>  
          <div class="col-md-12">             
            <input name="cep" id='cep_ajax' type="text" placeholder="XXXX-XXX" class="cep form-control input-md" required>
            <div class='loader'></div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-4 control-label" for="textinput">Endereco*</label>  
          <div class="col-md-12">
          <input id="textinput" name="endereco" type="text" placeholder="XXXX-XXX" class="form-control input-md" required>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-4 control-label" for="textinput">Número </label>  
          <div class="col-md-12">
          <input id="textinput" name="numero" type="text" placeholder="N°" class="form-control input-md" required> 
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-4 control-label" for="textinput">Cidade* </label>  
          <div class="col-md-12">
          <input id="textinput" name="cidade" type="text" placeholder="Cidade" class="form-control input-md" required> 
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-4 control-label" for="textinput">Estado* </label>  
          <div class="col-md-12">
        

          <select name="estado" id="textinput" class="form-control">
                <option value="">Selecione</option>
                <option value="AC">Acre</option>
                <option value="AL">Alagoas</option>
                <option value="AP">Amapá</option>
                <option value="AM">Amazonas</option>
                <option value="BA">Bahia</option>
                <option value="CE">Ceará</option>
                <option value="DF">Distrito Federal</option>
                <option value="ES">Espírito Santo</option>
                <option value="GO">Goiás</option>
                <option value="MA">Maranhão</option>
                <option value="MT">Mato Grosso</option>
                <option value="MS">Mato Grosso do Sul</option>
                <option value="MG">Minas Gerais</option>
                <option value="PA">Pará</option>
                <option value="PB">Paraíba</option>
                <option value="PR">Paraná</option>
                <option value="PE">Pernambuco</option>
                <option value="PI">Piauí</option>
                <option value="RJ">Rio de Janeiro</option>
                <option value="RN">Rio Grande do Norte</option>
                <option value="RS">Rio Grande do Sul</option>
                <option value="RO">Rondônia</option>
                <option value="RR">Roraima</option>
                <option value="SC">Santa Catarina</option>
                <option value="SP">São Paulo</option>
                <option value="SE">Sergipe</option>
                <option value="TO">Tocantins</option>
        </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-4 control-label" for="textinput">Bairro* </label>  
          <div class="col-md-12">
          <input id="textinput" name="bairro" type="text" placeholder="Novo Bairro" class="form-control input-md" required> 
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-4 control-label" for="textinput">Complemento</label>  
          <div class="col-md-12">
          <input id="textinput" name="complemento" type="text" placeholder="Complemento" class="form-control input-md">
          </div>
        </div>
        <!-- Button -->
        <div class="form-group">
          <label class="col-md-4 control-label" for="singlebutton"></label>
          <div class="col-md-12">
            <button id="singlebutton" class="btn btn-animation w-100">Inserir Endereço</button>
          </div>
        </div>
        <div class='carregando'></div>
    </fieldset>
</form>
<script>
    $('document').ready(function() {

        var base_url = window.location.origin;
    
        $('.cep').mask('99999-999');
        $("#cep_ajax").change(function(){
            cep_ajax();
        });
        function cep_ajax(){
            var val = $("#cep_ajax").val().replace(/[^\d]+/g,'');
                   
            if (val != "" && val != $("#cep_ajax").data('cep')) {
                $.ajax({
                    url: "https://viacep.com.br/ws/" + val + "/json/",
                    beforeSend: function () {
                        $('.loader').append('<progress></progress>');
                    },
                    success: function (data) {
                        $('.loader').empty();
                        if (data['resultado'] != 0) {
                            $('input[name=endereco]').val(data['logradouro']);
                            $('input[name=bairro]').val(data['bairro']);                          
                            $('input[name=cidade]').val(data['localidade']);
                            $('input[name=numero]').focus();
                            $('#textinput option').each(function() {
                                if($(this).val() == data['uf']) {                              
                                    $(this).attr("selected", true);                                 
                                } 
                                else{
                                    $(this).attr("selected", false); 
                                }
                            });
                        }
                    },
                    error: function (error) {
                        alert('Falha ao gerar o CEP');
                    }
                });

            }
        }
        
        $('form.new_endereco').submit(function(e){
            e.preventDefault();
            var dados = $(this).serialize();
            $.ajax({
                url: base_url+"checkout/inserenovoend",
                type:'POST',
                data: dados,
                beforeSend: function () {
                    $('.carregando').append('<center><progress></progress></center>');
                },
                success: function (data) {
                    $('.carregando').empty();
                    if(data == true){
                       $('form.new_endereco')[0].reset();
                        swal({
                            title: 'Endereço Cadastrado!!',
                            type: 'success',
                            text: "A janela sera fechada em 3s ...",
                            html: true,
                            showCloseButton: false,
                            showConfirmButton: false,
                            showCancelButton: false
                        });
                        setTimeout(function () {
                            location.reload();
                        }, 3000);
                    }
                },
                error: function (error) {
                    alert('Falha ao criar novo CEP');
                }
            });
            return false;
        });
        
    });

    $(document).on("focus", ".cep", function(){
      $(this).mask('99999-999');
});
</script>

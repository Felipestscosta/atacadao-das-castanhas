    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>Cadastro</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="{{ this.url.getBaseUri() }}">
                                        <i class="fa-solid fa-house"></i>
                                    </a>                                    
                                </li>
                                <li class="breadcrumb-item active">Cadastro</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- log in section start -->
    <section class="log-in-section section-b-space">
        <div class="container-fluid-lg w-100">
            <div class="row">

                <div class="col-xxl-12 col-xl-12 col-lg-12 col-sm-12 mx-auto">
                    <div class="log-in-box">
                        <div class="log-in-title text-center">
                            <h3>Seja Bem Vindo!</h3>
                            <h4>Criar uma Nova Conta</h4>
                        </div>

                        <div class="input-box">
                            <form class="row g-4" method='POST' name="inserir_nova_conta" id="minha-conta">

                                <!-- <div class="col-6">
                                    <button type="button" class="btn btn-animation w-100" onclick="Mudarestado('cnpj')">COMPRE NO ATACADO COM CNPJ ?</button>
                                </div> -->
                                <!-- <div class="col-6" id="cnpj" style="display: none;">
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" class="form-control cnpj" name="cnpj" id="cnpj" placeholder="CNPJ">
                                        <label for="cnpj">CNPJ</label>
                                        <span>Cadastre com seu CNPJ e tenha acesso aos nossos produtos no ATACADO.</span>
                                        <div id="cnpjcadastrado"></div>
                                    </div>
                                </div> -->
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" onkeyup="document.getElementById('validation').innerHTML = validaCPF(this.value)" class="form-control cpf" name="cpf" id="cpf" placeholder="CPF">
                                        <label for="cpf">CPF</label>                                       
                                        <div id="validation"></div>
                                    </div>
                                </div>                                

                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" class="form-control" id="fullname" name="nome" placeholder="Nome">
                                        <label for="fullname">Nome</label>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" class="form-control" id="full-name" name="sobrenome" placeholder="Sobrenome">
                                        <label for="full-name">Sobrenome</label>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">                                        
                                        <label for="sexo"></label>
                                        <select name="sexo" class="form-control" tabindex="2">
                                            <option value="">Sexo</option>
                                            <option value="F">Feminino</option>
                                            <option value="M">Masculino</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="E-mail">
                                        <label for="email">E-mail</label>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" class="form-control celular" id="celular" name="celular" placeholder="Telefone">
                                        <label for="celular">Telefone</label>
                                    </div>
                                </div>

                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="senha" name="senha" class="form-control" id="senha"
                                            placeholder="Senha">
                                        <label for="senha">Senha</label>
                                    </div>
                                </div>


                                <div class="log-in-title text-center">
                                    <h3>Endereço de Entrega</h3>
                                </div>

                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" class="form-control cep" id="cep_ajax" name="cep" placeholder="Cep">
                                        <label for="cep">Cep</label>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" name="endereco" class="form-control" id="endereco"
                                            placeholder="Endereco">
                                        <label for="endereco">Endereco</label>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" class="form-control" id="numero" name="numero" placeholder="Número">
                                        <label for="numero">Número</label>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" name="bairro" class="form-control" id="bairro"
                                            placeholder="Bairro">
                                        <label for="bairro">Bairro</label>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" class="form-control" id="referencia" name="referencia" placeholder="Referência">
                                        <label for="referencia">Referência</label>
                                    </div>
                                </div>                                
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" name="cidade" class="form-control" id="cidade"
                                            placeholder="Cidade">
                                        <label for="ciadade">Cidade</label>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="form-floating theme-form-floating">
                                        <label for="estado" aria-placeholder="Estado"></label>
                                        <select name="estado" id="estado" class="form-select" tabindex="12">
                                            <option value="">Estado</option>
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
                                <div class="col-xxl-6 col-sm-12 col-sm-12">
                                    <div class="forgot-box">
                                        <div class="form-check ps-0 m-0 remember-box">
                                            <input class="checkbox_animated check-box" type="checkbox"
                                                id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">Aceito os
                                                <span>Termos</span> de <span>Privacidade</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <button class="btn btn-animation w-100" type="submit">Cadastrar</button>
                                </div>
                            </form>
                        </div>
                       
                    </div>
                </div>

                <div class="col-xxl-7 col-xl-6 col-lg-6"></div>
            </div>
        </div>
    </section>
    <!-- log in section end -->
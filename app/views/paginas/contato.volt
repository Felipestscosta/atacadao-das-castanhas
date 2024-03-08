    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>Contato</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="{{this.url.getBaseUri()}}">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Contato</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Contact Box Section Start -->
    <section class="contact-box-section">
        <div class="container-fluid-lg">
            <div class="row g-lg-5 g-3">
                <div class="col-lg-6">
                    <div class="left-sidebar-box">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="contact-image">
                                    <img src="{{this.url.getBaseUri()}}assets/images/inner-page/contact-us.png"
                                        class="img-fluid blur-up lazyloaded" alt="">
                                </div>
                            </div>
                            <div class="col-xl-12">
                                <div class="contact-title">
                                    <h3>Entre em Contato</h3>
                                </div>

                                <div class="contact-detail">
                                    <div class="row g-4">
                                        <div class="col-xxl-6 col-lg-12 col-sm-6">
                                            <div class="contact-detail-box">
                                                <div class="contact-icon">
                                                    <i class="fa-solid fa-phone"></i>
                                                </div>
                                                <div class="contact-detail-title">
                                                    <h4>Whatsapp</h4>
                                                </div>

                                                <div class="contact-detail-contain">
                                                    <p>{{ empresa.telefone is not empty ? ' ' ~ empresa.telefone : '' }}<br>{{ empresa.whatsapp is not empty ? ' ' ~ empresa.whatsapp : '' }}</p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xxl-6 col-lg-12 col-sm-6">
                                            <div class="contact-detail-box">
                                                <div class="contact-icon">
                                                    <i class="fa-solid fa-envelope"></i>
                                                </div>
                                                <div class="contact-detail-title">
                                                    <h4>E-mail</h4>
                                                </div>

                                                <div class="contact-detail-contain">
                                                    <p>{{empresa.email}}</p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xxl-6 col-lg-12 col-sm-6">
                                            <div class="contact-detail-box">
                                                <div class="contact-icon">
                                                    <i class="fa-solid fa-location-dot"></i>
                                                </div>
                                                <div class="contact-detail-title">
                                                    <h4>Matriz</h4>
                                                </div>

                                                <div class="contact-detail-contain">
                                                    <p>{{empresa.endereco ~ ', ' ~ empresa.numero}} {{empresa.bairro}} </p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xxl-6 col-lg-12 col-sm-6">
                                            <div class="contact-detail-box">
                                                <div class="contact-icon">
                                                    <i class="fa-solid fa-building"></i>
                                                </div>
                                                <div class="contact-detail-title">
                                                    <h4>Filial</h4>
                                                </div>

                                                <div class="contact-detail-contain">
                                                    <p>Carrefour Hipermercado</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="title d-xxl-none d-block">
                        <h2>Contato</h2>
                    </div>
                    <form class="right-sidebar-box" name="formcontato" id="formcontato" method="post">
                        <div class="row">
                            <div class="col-xxl-6 col-lg-12 col-sm-6">
                                <div class="mb-md-4 mb-3 custom-form">
                                    <!-- <label for="exampleFormControlInput" class="form-label">Nome</label> -->
                                    <div class="custom-input">
                                        <input type="text" name="nome" class="form-control"
                                            placeholder="Nome">
                                        <i class="fa-solid fa-user"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xxl-6 col-lg-12 col-sm-6">
                                <div class="mb-md-4 mb-3 custom-form">
                                    <!-- <label for="exampleFormControlInput1" class="form-label">Assunto</label> -->
                                    <div class="custom-input">
                                        <select name="assunto" class="form-control">
                                            <option value="">-- Selecione o assunto --</option>
                                            <option value="Duvidas Gerais">Dúvidas Gerais</option>
                                            <option value="Compras">Compras</option>
                                            <option value="Sugestões">Sugestões</option>
                                            <option value="Sugestões">Reclamações</option>
                                            <option value="Outros">Outros</option>
                                        </select>
                                        <i class="fa-solid fa-message"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xxl-6 col-lg-12 col-sm-6">
                                <div class="mb-md-4 mb-3 custom-form">
                                    <!-- <label for="exampleFormControlInput2" class="form-label">E-mail</label> -->
                                    <div class="custom-input">
                                        <input type="email" class="form-control" name="email"
                                            placeholder="E-mail">
                                        <i class="fa-solid fa-envelope"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xxl-6 col-lg-12 col-sm-6">
                                <div class="mb-md-4 mb-3 custom-form">
                                    <!-- <label for="exampleFormControlInput3" class="form-label">Telefone</label> -->
                                    <div class="custom-input">
                                        <input type="tel" class="form-control celular" name="telefone"
                                            placeholder="Telefone" maxlength="10">
                                        <i class="fa-solid fa-mobile-screen-button"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="mb-md-4 mb-3 custom-form">
                                    <!-- <label for="exampleFormControlTextarea" class="form-label">Mensagem</label> -->
                                    <div class="custom-textarea">
                                        <textarea class="form-control" name="mensagem"
                                            placeholder="Mensagem" rows="6"></textarea>
                                        <i class="fa-solid fa-message"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-animation btn-md fw-bold ms-auto">Enviar Mensagem</button>
                    </form>
                    <p class="divcont"></p>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Box Section End -->

    <!-- Map Section Start -->
    <section class="map-section">
        <div class="container-fluid p-0">
            <div class="map-box">
                {{ empresa.iframe is not empty ? empresa.iframe : '' }}
            </div>
        </div>
    </section>
    <!-- Map Section End -->
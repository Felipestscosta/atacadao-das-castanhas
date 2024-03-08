    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>Detalhes da Receita</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="{{this.url.getBaseUri()}}">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item" aria-current="page">Receitas</li>
                                <li class="breadcrumb-item active" aria-current="page">Detalhes da Receita</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Details Section Start -->
    <section class="blog-section section-b-space">
        <div class="container-fluid-lg">
            <div class="row g-sm-4 g-3">

                <div class="col-xxl-12 col-xl-12 col-lg-12 ratio_50">
                    <div class="blog-detail-image rounded-3 mb-4">
                        <img src="{{link_imagens ~ idrec.imagem[0]}}" class="bg-img blur-up lazyload" alt="">
                        <div class="blog-image-contain">
                            <!-- <ul class="contain-list">
                                <li>backpack</li>
                                <li>life style</li>
                                <li>organic</li>
                            </ul> -->
                            <h2>{{idrec.nome}}</h2>
                            <ul class="contain-comment-list">
                                <li>
                                    <div class="user-list">
                                        <i data-feather="user"></i>
                                        <span>Atacadão das Castanhas</span>
                                    </div>
                                </li>

                                <li>
                                    <div class="user-list">
                                        <i data-feather="calendar"></i>
                                        <span><?= date('d/m/Y', strtotime($idrec->created_at))?></span>
                                    </div>
                                </li>

                                <!-- <li>
                                    <div class="user-list">
                                        <i data-feather="message-square"></i>
                                        <span>82 Comment</span>
                                    </div>
                                </li> -->
                            </ul>
                        </div>
                    </div>

                    <div class="blog-detail-contain" style="text-align: left;">
                        <p>{{idrec.descricao}}</p>

                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->
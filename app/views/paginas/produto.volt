    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>{{produto.nome}}</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="{{ this.url.getBaseUri() }}">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                {% if produto.categoria_nome is not empty %}
                                <li class="breadcrumb-item active">{{produto.categoria_nome}}</li>
                                {% endif %}
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Left Sidebar Start -->
    <section class="product-section">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-xxl-9 col-xl-8 col-lg-7 wow fadeInUp">
                    <div class="row g-4">
                        <div class="col-xl-6 wow fadeInUp">
                            <div class="product-left-box">
                                <div class="row g-2">
                                    <div class="col-xxl-10 col-lg-12 col-md-10">
                                        <div class="product-main-2 no-arrow">
                                            {% if produto.imagens is not empty %}
                                            {% for key,value in produto.imagens %}
                                            <div>
                                                <div class="slider-image">
                                                    <img src="{{link_imagens ~ produto.imagens[key]}}" id="img-1"
                                                        data-zoom-image="{{link_imagens ~ produto.imagens[key]}}"
                                                        class="img-fluid image_zoom_cls-0 blur-up lazyload" alt="">
                                                </div>
                                            </div>
                                            {% endfor %}
                                            {% else %}
                                            <div>
                                                <div class="slider-image">
                                                    <img src="{{this.url.getBaseUri()}}img/nophoto.webp"
                                                        data-zoom-image="{{this.url.getBaseUri()}}img/nophoto.webp"
                                                        class="img-fluid image_zoom_cls-1 blur-up lazyload" alt="">
                                                </div>
                                            </div>
                                            {% endif %}
                                            
                                        </div>
                                    </div>

                                    <div class="col-xxl-2 col-lg-12 col-md-2">
                                        <div class="left-slider-image-2 left-slider no-arrow slick-top">
                                            {% if produto.imagens is not empty %}
                                            {% for key,value in produto.imagens %}
                                            <div>
                                                <div class="sidebar-image">
                                                    <img src="{{link_imagens ~ produto.imagens[key]}}"
                                                        class="img-fluid blur-up lazyload" alt="">
                                                </div>
                                            </div>
                                            {% endfor %}
                                            {% else %}
                                            <div>
                                                <div class="sidebar-image">
                                                    <img src="{{this.url.getBaseUri()}}img/nophoto.webp"
                                                        class="img-fluid blur-up lazyload" alt="">
                                                </div>
                                            </div>
                                            {% endif %}
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="right-box-contain">
                                <h4><a href="{{this.url.getBaseUri() ~ 'atacado/paginas/novaconta'}}" style="padding: 15px;text-align: center; display: flex;background-color: #f8f8f8;flex-direction: column-reverse;">TEM CNPJ? <br>COMPRE NO ATACADO, DESCONTOS INCRÍVEIS!</a> </h4>

                                
                                <h6 class="offer-top">
                                    <?php
                                        if((isset($produto->variacoes)) && (!empty($produto->variacoes))){
                                        $existedesc = (isset($produto->variacoes[0]['desconto'])) ? $produto->variacoes[0]['desconto'] : '';
                                        $result = $this->app->verificaDesconto($produto->variacoes[0]['valor'],$produto->categoria,$existedesc); 
                                        }
                                    ?>
                                </h6>
                                
                                
                                <h2 class="name">{{produto.nome}}</h2>
                                <div class="price-rating">
                                    <h3 class="theme-color price"><?php if(isset($result['por'])){ echo $result['por']; }?> <del class="text-content"><?php if(isset($result['de'])){echo $result['de'];}?></del> <span
                                            class="offer theme-color">
                                            <?php
                                            if((isset($produto->variacoes)) && (!empty($produto->variacoes))){
                                            $existedesc = (isset($produto->variacoes[0]['desconto'])) ? $produto->variacoes[0]['desconto'] : '';
                                            $result = $this->app->verificaDesconto($produto->variacoes[0]['valor'],$produto->categoria,$existedesc); 
                                            }
                                        ?>
                                    </span></h3>
                                    <div class="product-rating custom-rate">
                                        <ul class="rating">
                                            <li>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star fill"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                            </li>
                                            <li>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star fill"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                            </li>
                                            <li>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star fill"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                            </li>
                                            <li>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star fill"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                            </li>
                                            <li>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                            </li>
                                        </ul>
                                        <!-- <span class="review">23 Customer Review</span> -->
                                    </div> 
                                </div>

                                <div class="procuct-contain">
                                    <p>{{this.app.limitaTexto(produto.descricao, 300)}}</p>
                                </div>

                                <?php  if(isset($produto->variacoes[0]['cor']) && (!empty($produto->variacoes[0]['cor']))){?>
                                <div class="product-packege">
                                    <div class="product-title">
                                        <h4>Peso</h4>
                                    </div>
                                    <ul class="select-packege">
                                        <li>
                                            <a href="javascript:void(0)" class="active">1/2 KG</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">1 KG</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">1.5 KG</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">Red Roses</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">With Pink Roses</a>
                                        </li>
                                    </ul>
                                </div>
                                <?php }?>

                                <?php  if((count($produto->variacoes == 1)) && ($produto->variacoes[0]['estoque'] <= 0)){?>
                                <div class="note-box product-packege">                                   
                                    <a href="javascript:void(0);" class="btn btn--add-to-cart" style="background: #ffa53b;">INDISPONÍVEL</a>
                                </div>
                                <?php } else {?> 

                                <div class="note-box product-packege">                                    
                                    <div class="cart_qty qty-box product-qty">
                                        <div class="input-group">
                                            <button type="button" class="qty-btn qty-left-minus minus" data-type="minus">
                                                <i class="fa fa-minus" aria-hidden="true"></i>
                                            </button>

                                            <input class="form-control input-number qty-input maximo" type="text" readonly=“true”
                                            name="qty" id="valormaximo" value="<?php if($produto->variacoes[0]['estoque']>1){echo 1;}else{echo 1;};?>" data-min="1" data-max="{{ produto.variacoes[0]['estoque'] }}">

                                            <button type="button" class="qty-btn qty-right-plus plus" data-type="plus">
                                                <i class="fa fa-plus" aria-hidden="true"></i>
                                            </button>

                                        </div>

                                    </div>


                                    <button onclick="location.href = '#';"
                                        class="btn btn-animation w-100 adicionar_carrinho" <?php if(empty($produto->variacoes[0]['estoque']) || ($produto->variacoes[0]['estoque'] <= 0)){echo 'disabilita';};?>" data-cat="<?= $produto->categoria ?>" data-produto="<?= $produto->_id ?>" data-cor="<?= isset($produto->variacoes[0]['cor']) ? $produto->variacoes[0]['cor'] : '' ?>" data-estoque="<?= isset($produto->variacoes[0]['estoque']) ? $produto->variacoes[0]['estoque'] : '' ?>" data-tamanho="<?= isset($produto->variacoes[0]['tamanho']) ? $produto->variacoes[0]['tamanho'] : '' ?>" data-nome="<?= $produto->nome ?>" data-valor="<?= $result['por'] ?>" data-estoque="<?= isset($produto->variacoes[0]['estoque']) ? $produto->variacoes[0]['estoque'] : '' ?>" data-imagem="<?= $produto->imagens[0] ?>" <?php if(isset($produto->produto_id)){?> data-migracao='<?php if(isset($produto->produto_id)){echo $value->produto_id;}?>' <?php } ?>>
                                        Adicionar ao Carrinho
                                    </button>
                                </div>
                                <?php }?>  
                                
                                <br>
                                <h3>VENDAS SOMENTE PARA UBERLÂNDIA </h3>
                                <br>
                                <h4> <strong style="color: #ff6b6b;">PRAZO DE ENTREGA</strong> <br> - 3 (três) dias úteis para compras no varejo. <br>- 5 (cinco) dias úteis para compras no atacado. <br><br>
                                    <span style="color: #ff6b6b;">NÃO FAZEMOS ENTREGAS NO DOMINGO.</span></h4>

                                <div class="buy-box">
                                    <a href="https://api.whatsapp.com/send?text=<?php echo $_SERVER['SCRIPT_URI'];?>">
                                        <i class="fab fa-whatsapp" style="font-size: 30px;"></i>                                       
                                        <span>Compartilhar whatsapp</span>
                                    </a>

                                    <!-- <a href="#" class="compare" data-produto="{{ value._id }}">
                                        <i data-feather="shuffle"></i>
                                        <span>Comparar produto</span>
                                    </a> -->
                                </div>

                                <!-- <div class="pickup-box">
                                    <div class="product-title">
                                        <h4>Store Information</h4>
                                    </div>

                                    <div class="pickup-detail">
                                        <h4 class="text-content">Lollipop cake chocolate chocolate cake dessert jujubes.
                                            Shortbread sugar plum dessert powder cookie sweet brownie.</h4>
                                    </div>

                                </div> -->

                                <div class="paymnet-option">
                                    <div class="product-title">
                                        <h4>Forma de Pagamento</h4>
                                    </div>
                                    <ul>
                                        <li>
                                            <a href="javascript:void(0)">
                                                <img src="{{this.url.getBaseUri()}}images/logo_pix.webp"
                                                    class="blur-up lazyload" alt="">
                                            </a>
                                        </li>
                                       <li>
                                            <a href="javascript:void(0)">
                                                <img src="{{this.url.getBaseUri()}}images/pagseguro.webp"
                                                    class="blur-up lazyload" alt="">
                                            </a>
                                        </li>
                                       <!--   <li>
                                            <a href="javascript:void(0)">
                                                <img src="{{this.url.getBaseUri()}}assets/images/product/payment/3.svg"
                                                    class="blur-up lazyload" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">
                                                <img src="{{this.url.getBaseUri()}}assets/images/product/payment/4.svg"
                                                    class="blur-up lazyload" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">
                                                <img src="{{this.url.getBaseUri()}}assets/images/product/payment/5.svg"
                                                    class="blur-up lazyload" alt="">
                                            </a>
                                        </li> -->
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="product-section-box">
                                <ul class="nav nav-tabs custom-nav" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="description-tab" data-bs-toggle="tab"
                                            data-bs-target="#description" type="button" role="tab"
                                            aria-controls="description" aria-selected="true">Descrição</button>
                                    </li>

                                    <!-- <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="info-tab" data-bs-toggle="tab"
                                            data-bs-target="#info" type="button" role="tab" aria-controls="info"
                                            aria-selected="false">Como usar</button>
                                    </li>

                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="care-tab" data-bs-toggle="tab"
                                            data-bs-target="#care" type="button" role="tab" aria-controls="care"
                                            aria-selected="false">Videos</button>
                                    </li>

                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="review-tab" data-bs-toggle="tab"
                                            data-bs-target="#review" type="button" role="tab" aria-controls="review"
                                            aria-selected="false">Avaliação</button>
                                    </li> -->
                                </ul>

                                <div class="tab-content custom-tab" id="myTabContent">
                                    <div class="tab-pane fade show active" id="description" role="tabpanel"
                                        aria-labelledby="description-tab">
                                        <div class="product-description">
                                            <div class="nav-desh">
                                                <p>{{produto.descricao}}</p>
                                            </div>                                    
                                            
                                        </div>
                                    </div>

                                    <!-- <div class="tab-pane fade" id="info" role="tabpanel" aria-labelledby="info-tab">
                                        <div class="table-responsive">
                                            <table class="table info-table">
                                                <tbody>
                                                    <tr>
                                                        <td>Specialty</td>
                                                        <td>Vegetarian</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Ingredient Type</td>
                                                        <td>Vegetarian</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Brand</td>
                                                        <td>Lavian Exotique</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Form</td>
                                                        <td>Bar Brownie</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Package Information</td>
                                                        <td>Box</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Manufacturer</td>
                                                        <td>Prayagh Nutri Product Pvt Ltd</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Item part number</td>
                                                        <td>LE 014 - 20pcs Crème Bakes (Pack of 2)</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Net Quantity</td>
                                                        <td>40.00 count</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="care" role="tabpanel" aria-labelledby="care-tab">
                                        <div class="information-box">
                                            <ul>
                                                <li>Store cream cakes in a refrigerator. Fondant cakes should be
                                                    stored in an air conditioned environment.</li>

                                                <li>Slice and serve the cake at room temperature and make sure
                                                    it is not exposed to heat.</li>

                                                <li>Use a serrated knife to cut a fondant cake.</li>

                                                <li>Sculptural elements and figurines may contain wire supports
                                                    or toothpicks or wooden skewers for support.</li>

                                                <li>Please check the placement of these items before serving to
                                                    small children.</li>

                                                <li>The cake should be consumed within 24 hours.</li>

                                                <li>Enjoy your cake!</li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                                        <div class="review-box">
                                            <div class="row g-4">
                                                <div class="col-xl-6">
                                                    <div class="review-title">
                                                        <h4 class="fw-500">Customer reviews</h4>
                                                    </div>

                                                    <div class="d-flex">
                                                        <div class="product-rating">
                                                            <ul class="rating">
                                                                <li>
                                                                    <i data-feather="star" class="fill"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star" class="fill"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star" class="fill"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star"></i>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <h6 class="ms-3">4.2 Out Of 5</h6>
                                                    </div>

                                                    <div class="rating-box">
                                                        <ul>
                                                            <li>
                                                                <div class="rating-list">
                                                                    <h5>5 Star</h5>
                                                                    <div class="progress">
                                                                        <div class="progress-bar" role="progressbar"
                                                                            style="width: 68%" aria-valuenow="100"
                                                                            aria-valuemin="0" aria-valuemax="100">
                                                                            68%
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>

                                                            <li>
                                                                <div class="rating-list">
                                                                    <h5>4 Star</h5>
                                                                    <div class="progress">
                                                                        <div class="progress-bar" role="progressbar"
                                                                            style="width: 67%" aria-valuenow="100"
                                                                            aria-valuemin="0" aria-valuemax="100">
                                                                            67%
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>

                                                            <li>
                                                                <div class="rating-list">
                                                                    <h5>3 Star</h5>
                                                                    <div class="progress">
                                                                        <div class="progress-bar" role="progressbar"
                                                                            style="width: 42%" aria-valuenow="100"
                                                                            aria-valuemin="0" aria-valuemax="100">
                                                                            42%
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>

                                                            <li>
                                                                <div class="rating-list">
                                                                    <h5>2 Star</h5>
                                                                    <div class="progress">
                                                                        <div class="progress-bar" role="progressbar"
                                                                            style="width: 30%" aria-valuenow="100"
                                                                            aria-valuemin="0" aria-valuemax="100">
                                                                            30%
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>

                                                            <li>
                                                                <div class="rating-list">
                                                                    <h5>1 Star</h5>
                                                                    <div class="progress">
                                                                        <div class="progress-bar" role="progressbar"
                                                                            style="width: 24%" aria-valuenow="100"
                                                                            aria-valuemin="0" aria-valuemax="100">
                                                                            24%
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="col-xl-6">
                                                    <div class="review-title">
                                                        <h4 class="fw-500">Add a review</h4>
                                                    </div>

                                                    <div class="row g-4">
                                                        <div class="col-md-6">
                                                            <div class="form-floating theme-form-floating">
                                                                <input type="text" class="form-control" id="name"
                                                                    placeholder="Name">
                                                                <label for="name">Your Name</label>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-floating theme-form-floating">
                                                                <input type="email" class="form-control" id="email"
                                                                    placeholder="Email Address">
                                                                <label for="email">E-mail</label>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-floating theme-form-floating">
                                                                <input type="url" class="form-control" id="website"
                                                                    placeholder="Website">
                                                                <label for="website">Website</label>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-floating theme-form-floating">
                                                                <input type="url" class="form-control" id="review1"
                                                                    placeholder="Give your review a title">
                                                                <label for="review1">Review Title</label>
                                                            </div>
                                                        </div>

                                                        <div class="col-12">
                                                            <div class="form-floating theme-form-floating">
                                                                <textarea class="form-control"
                                                                    placeholder="Leave a comment here"
                                                                    id="floatingTextarea2"
                                                                    style="height: 150px"></textarea>
                                                                <label for="floatingTextarea2">Write Your
                                                                    Comment</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xxl-3 col-xl-4 col-lg-5 d-none d-lg-block wow fadeInUp">
                    <div class="right-sidebar-box">
                        <div class="vendor-box">
                            <div class="verndor-contain">
                                <div class="vendor-image">
                                    <img src="{{link_imagens ~ empresa.profile_logo}}" class="blur-up lazyload" alt="">
                                </div>

                                <div class="vendor-name">
                                    <h5 class="fw-500">PRODUTOS NO ATACADO</h5>

                                    <div class="product-rating mt-1">
                                        <ul class="rating">
                                            <li>
                                                <i data-feather="star" class="fill"></i>
                                            </li>
                                            <li>
                                                <i data-feather="star" class="fill"></i>
                                            </li>
                                            <li>
                                                <i data-feather="star" class="fill"></i>
                                            </li>
                                            <li>
                                                <i data-feather="star" class="fill"></i>
                                            </li>
                                            <li>
                                                <i data-feather="star" class="fill"></i>
                                            </li>
                                        </ul>
                                        <!-- <span>(36 Reviews)</span> -->
                                    </div>

                                </div>
                            </div>

                            <p class="vendor-detail">Vendemos todos os nossos produtos no <b>ATACADO</b>, faça seu Cadastro com o CNPJ. <a href="{{this.url.getBaseUri() ~ 'atacado/paginas/novaconta'}}" style="text-align: center;">Clique Aqui!</a></p>

                            <div class="vendor-list">
                                <ul>
                                    <li>
                                        <div class="address-contact">
                                            <i data-feather="map-pin"></i>
                                            <h5><span class="text-content">{{empresa.endereco ~ ', ' ~ empresa.numero}}</span></h5>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="address-contact">
                                            <i data-feather="headphones"></i>
                                            <h5><span class="text-content">{{empresa.telefone}}</span></h5>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Trending Product -->
                        <div class="pt-25">
                            <div class="category-menu">
                                <h3>Promoções</h3>

                                <ul class="product-list product-right-sidebar border-0 p-0">
                                    <?php foreach($destaques as $key => $value){?>
                                    <li>
                                        <div class="offer-product">
                                            <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}" class="offer-image">

                                                {% if value.variacoes[0]['desconto'] is not empty %}
                                                <div class="label-flex">
                                                    <div class="discount">
                                                        <label>
                                                            <?php
                                                            $existedesc = (isset($value->variacoes[0]['desconto'])) ? $value->variacoes[0]['desconto'] : '';
                                                            $result = $this->app->verificaDesconto($value->variacoes[0]['valor'],$value->categoria,$existedesc);
                                                            ?>
                                                        </label>
                                                    </div>
                                                </div>
                                                {% endif %}

                                                <?php 
                                                    $existedesc = (isset($value->variacoes[0]['desconto'])) ? $value->variacoes[0]['desconto'] : '';
                                                    $result = $this->app->verificaDesconto($value->variacoes[0]['valor'],$value->categoria,$existedesc);
                                                ?> 
                                                <?php if(isset($value->imagens[0])):?>
                                                <img src="{{link_imagens ~ value.imagens[0]}}"
                                                    class="img-fluid blur-up lazyload" alt="{{value.nome}}">
                                                <?php else:?>
                                                <img src="{{this.url.getBaseUri()}}img/nophoto.webp"
                                                    class="img-fluid blur-up lazyload" alt="{{value.nome}}">
                                                <?php endif;?>
                                            </a>

                                            <div class="offer-detail">
                                                <div>
                                                    <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
                                                        <h6 class="name">
                                                            <?php 	
                                                            $nomedest = mb_convert_case($value->nome, MB_CASE_LOWER, 'UTF-8');												
                                                            echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                            ?> 
                                                        </h6>
                                                    </a>
                                                    <!-- <span>450 G</span> -->
                                                    <h5 class="price"><span class="theme-color" style="font-size: 17px;"><?php if(isset($result['por'])){ echo $result['por']; }?></span> <del style="font-size: 13px;"><?php if(isset($result['de'])){echo $result['de'];}?></del>
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <?php }?>

                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Left Sidebar End -->

    <!-- Releted Product Section Start -->
    <section class="product-list-section section-b-space">
        <div class="container-fluid-lg">
            <div class="title">
                <h2>Relacionados</h2>
                <span class="title-leaf">
                    <svg class="icon-width">
                        <use xlink:href="assets/svg/leaf.svg#leaf"></use>
                    </svg>
                </span>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="slider-6_1 product-wrapper">
                        <?php foreach($relacionados as $key => $value){?> 
                        <div>
                            <div class="product-box-3 wow fadeInUp">                                
                                <div class="product-header">
                                    <div class="product-image">
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
                                            
                                            {% if value.variacoes[0]['desconto'] is not empty %}
                                            <div class="label-flex">
                                                <div class="discount">
                                                    <label>
                                                        <?php
                                                        $existedesc = (isset($value->variacoes[0]['desconto'])) ? $value->variacoes[0]['desconto'] : '';
                                                        $result = $this->app->verificaDesconto($value->variacoes[0]['valor'],$value->categoria,$existedesc);
                                                        ?>
                                                    </label>
                                                </div>
                                            </div>
                                            {% endif %}

                                            <?php 
                                                $existedesc = (isset($value->variacoes[0]['desconto'])) ? $value->variacoes[0]['desconto'] : '';
                                                $result = $this->app->verificaDesconto($value->variacoes[0]['valor'],$value->categoria,$existedesc);
                                            ?> 
                                            <?php if(isset($value->imagens[0])):?>
                                            <img src="{{link_imagens ~ value.imagens[0]}}"
                                                class="img-fluid blur-up lazyload" alt="{{value.nome}}">
                                            <?php else:?>
                                            <img src="{{this.url.getBaseUri()}}img/nophoto.webp"
                                                class="img-fluid blur-up lazyload" alt="{{value.nome}}">
                                            <?php endif;?>
                                        </a>

                                        <!-- <ul class="product-option">
                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Carrinho">
                                                <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}" tabindex="0">
                                                    <i class="iconly-Buy icli"></i>
                                                </a>
                                            </li>
                                         
                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Ver">
                                                <a href="javascript:void(0)" data-id="{{value._id}}" data-bs-toggle="modal"
                                                    data-bs-target="#view" class="testamodal">
                                                    <i data-feather="eye"></i>
                                                </a>
                                            </li>

                                            <li data-bs-toggle="tooltip" data-produto="{{ value._id }}" data-bs-placement="top" class="compare" title="Compare">
                                                <a href="#">
                                                    <i data-feather="refresh-cw"></i>
                                                </a>
                                            </li>
                                        </ul> -->
                                    </div>
                                </div>                               

                                <div class="product-footer">
                                    <div class="product-detail">
                                        <!-- <span class="span-name">Cake</span> -->
                                        <a href="#0">
                                            <h5 class="name">
                                                <?php 	
                                                $nomedest = mb_convert_case($value->nome, MB_CASE_LOWER, 'UTF-8');												
                                                echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                ?> </h5>
                                        </a>
                                        <div class="product-rating mt-2">
                                            <ul class="rating">
                                                <li>
                                                    <i data-feather="star" class="fill"></i>
                                                </li>
                                                <li>
                                                    <i data-feather="star" class="fill"></i>
                                                </li>
                                                <li>
                                                    <i data-feather="star" class="fill"></i>
                                                </li>
                                                <li>
                                                    <i data-feather="star" class="fill"></i>
                                                </li>
                                                <li>
                                                    <i data-feather="star" class="fill"></i>
                                                </li>
                                            </ul>
                                            <span>(5.0)</span>
                                        </div>
                                        <!-- <h6 class="unit">500 G</h6> -->
                                        <h5 class="price"><span class="theme-color"><?php if(isset($result['por'])){ echo $result['por']; }?></span> <del><?php if(isset($result['de'])){echo $result['de'];}?></del>
                                        </h5>
                                        <!-- <div class="add-to-cart-box bg-white">
                                            <button class="btn btn-add-cart addcart-button">Add
                                                <span class="add-icon bg-light-gray">
                                                    <i class="fa-solid fa-plus"></i>
                                                </span>
                                            </button>
                                            <div class="cart_qty qty-box">
                                                <div class="input-group bg-white">
                                                    <button type="button" class="qty-left-minus bg-gray"
                                                        data-type="minus" data-field="">
                                                        <i class="fa fa-minus" aria-hidden="true"></i>
                                                    </button>
                                                    <input class="form-control input-number qty-input" type="text"
                                                        name="quantity" value="0">
                                                    <button type="button" class="qty-right-plus bg-gray"
                                                        data-type="plus" data-field="">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php }?>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Releted Product Section End -->
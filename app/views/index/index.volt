    <!-- Home Section Start -->
    <section class="home-section pt-2">
        <div class="container-fluid-lg">
            {% for item in banners %}
            <div class="row g-4">                
                <div class="col-xl-9 col-lg-8">
                    <div class="home-contain h-100">
                        <img src="{{link_imagens ~ item.imagem[0]}}" class="bg-img blur-up lazyload" alt="">
                        <div class="home-detail p-center-left w-75 position-relative mend-auto">
                            <div>
                                <h6>Todos os produtos com <span>10% Off</span></h6>
                                <h1 class="w-75 text-uppercase poster-1">Castanha do Pará Média<span
                                        class="daily">em promoção!</span></h1>
                                <p class="w-58 d-none d-sm-block">Confira...</p>
                                <a href="{{this.url.getBaseUri() ~ 'atacado'}}"><button class="btn btn-animation mt-xxl-4 mt-2 home-button mend-auto"> COMPRE POR QUILO  <i class="fa-solid fa-right-long ms-2 icon"></i></button></a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xl-3 col-lg-4 d-lg-inline-block d-none ratio_156">
                    <div class="home-contain h-100">
                        <img src="{{link_imagens ~ item.imagem[1]}}" class="bg-img blur-up lazyload" alt="">
                        <div class="home-detail p-top-left home-p-sm w-75">
                            <div>
                                <h2 class="mt-0 text-danger">COMPRAS COM CARTÃO </h2>
                                <h3 class="theme-color">IMPLEMENTAMOS A COMPRA VIA CATÃO DE CRÉDITO</h3>
                                <!-- <h5 class="text-content">{{item.texto2}}</h5> -->
                                <a data-bs-toggle="modal" href="#deal-box" class="shop-button">CONFERIR PROMOÇÃO  <i
                                        class="fa-solid fa-right-long ms-2"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {% endfor %}
        </div>
    </section>
    <!-- Home Section End -->

        <!-- Category Section Start -->
        <section class="category-section-2">
            <div class="container-fluid-lg">

                <div class="row">
                    <div class="col-12">
                        <div class="category-slider arrow-slider">
                            {% for key, cate in todascategorias %}
                            <div>
                                <div class="shop-category-box border-0 wow fadeIn">
                                    <a href="{{this.url.getBaseUri()}}categoria/{{this.app.toURI(cate.categoria_nome)}}/?cat={{cate._id}}" class="circle-{{key}}">
                                        <img src="{{link_imagens ~ cate.imagem[0]}}" class="img-fluid blur-up lazyload"
                                            alt="">
                                    </a>
                                    <div class="category-name">
                                        <h6>{{cate.categoria_nome}}</h6>
                                    </div>
                                </div>
                            </div>
                            {% endfor %}
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Category Section End -->


    <!-- Product Kitchen & Dining Needs Section Start -->
    <section class="product-section">
        <div class="container-fluid-lg">
            <div class="show-button" style="text-align: center;">
                <div class="title">
                    <h2>Promoções</h2>
                    <span class="title-leaf">
                        <img src="{{this.url.getBaseUri() ~ 'images/icone.jpg'}}" alt="">
                    </span>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="slider-6_1 arrow-slider img-slider">
                        <?php foreach($destaques as $key => $value){?>
                        <div>
                            <div class="product-box-4 wow fadeInUp">
                                <div class="product-image product-image-2">
                                    <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
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
                                </div>

                                <div class="product-detail">
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
                                            <i data-feather="star"></i>
                                        </li>
                                    </ul>

                                    <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
                                        <h5 class="name text-title">
                                            <?php 	
                                            $nomedest = mb_convert_case($value->nome, MB_CASE_LOWER, 'UTF-8');												
                                            echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                            ?> 
                                        </h5>
                                    </a>
                                    <h5 class="price theme-color">
                                        <span class="theme-color">
                                            <?php if(isset($result['por'])){
                                                echo $result['por'];
                                            }?>
                                        </span>
                                        <del>
                                            <?php if(isset($result['de'])){
                                                echo $result['de'];
                                            }?>
                                        </del>
                                    </h5>


                                    <div class="price-qty">
                                        <div class="counter-number">
                                            <div class="counter">
                                                <div class="qty-left-minus" data-type="minus" data-field="">
                                                    <i class="fa-solid fa-minus"></i>
                                                </div>
                                                <input class="form-control input-number qty-input" type="text"
                                                    name="quantity" value="1">
                                                <div class="qty-right-plus" data-type="plus" data-field="">
                                                    <i class="fa-solid fa-plus"></i>
                                                </div>
                                            </div>
                                        </div>

                                        <button
                                            class="buy-button buy-button-2 btn btn-cart adicionar_carrinho_rapido"
                                            {% if result['por'] is defined and result['de'] is defined and value.variacoes[0]['estoque'] is defined%}
                                                {%
                                                    set price = result['por'] ? result['por'] : result['de']
                                                %}
                                                {%
                                                    set estoque_verificado = value.variacoes[0]['estoque'] ? value.variacoes[0]['estoque'] : ''
                                                %}
                                            {% endif %}
                                            data-nome="{{ nomedest }}"
                                            data-produto="{{ value._id }}"
                                            data-imagem="{{ value.imagens[0] }}"
                                            data-valor="{{ result['por'] }}"
                                            data-estoque="{{ estoque_verificado }}"
                                            data-cat="{{ value.categoria }}"
                                            
                                        >
                                            <i class="iconly-Buy icli text-white m-0"></i>
                                        </button>
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
    <!-- Product Kitchen & Dining Needs Section End -->

    <section>
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="banner-contain">
                        <div class="banner-contain hover-effect bg-size blur-up lazyloaded" style="background-image: url(assets/images/vegetable/banner/15.jpg;); display: block; background-position: center top; background-repeat: no-repeat;  background-size: cover; background-attachment: fixed;">
                            <img src="assets/images/vegetable/banner/15.jpg" class="bg-img blur-up lazyload" alt="" style="display: none;">
                            <div class="banner-details p-center p-sm-4 p-3 text-white text-center">
                                <div>
                                    <h3 class="lh-base fw-bold text-light">De tudo para o seu bem-estar!</h3>
                                    <h6 class="coupon-code">Atacadão das Castanhas</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Shop Section Start -->
    <section class="section-b-space shop-section">
        <div class="container-fluid-lg">
            <div class="row">

                <div class="col-custome-12">
                    <div class="show-button">
                        <div class="title">
                            <h2>Últimos Cadastrados</h2>
                            <span class="title-leaf">
                                <img src="{{this.url.getBaseUri() ~ 'images/icone.jpg'}}" alt="">
                            </span>
                            <p>Os produtos mais recentes que chegaram em nossa loja</p>
                        </div>
                    </div>

                    <div class="row g-8">
                        
                            <?php foreach($produtos_rand1 as $key => $value){ ?>
                            <div class="col-xxl-3 col-lg-3 col-md-4 col-6 wow fadeInUp">
                                <div class="product-box-4">

                                    <div class="product-image">
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

                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
                                            <?php 
                                                $existedesc = (isset($value->variacoes[0]['desconto'])) ? $value->variacoes[0]['desconto'] : '';
                                                $result = $this->app->verificaDesconto($value->variacoes[0]['valor'],$value->categoria,$existedesc);                           
                                            ?>
                                            <?php if(isset($value->imagens[0])): ?>
                                                <img src="{{link_imagens ~ value.imagens[0]}}" class="img-fluid" alt="{{ value.nome }}">
                                            <?php else:?>
                                                <img src="{{this.url.getBaseUri()}}img/nophoto.webp" class="img-fluid" alt="">
                                            <?php endif;?> 
                                        </a>
                                    </div>

                                    <div class="product-detail">
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
                                            <h5 class="name">
                                                <?php 	
                                                    $nomedest = mb_convert_case($value->nome, MB_CASE_LOWER, 'UTF-8');												
                                                    echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                ?> 
                                            </h5>
                                        </a>
                                        <h5 class="price theme-color">
                                            <span class="theme-color">
                                                <?php if(isset($result['por'])){
                                                    echo $result['por'];
                                                }?>
                                            </span>
                                            <del>
                                                <?php if(isset($result['de'])){
                                                    echo $result['de'];
                                                }?>
                                            </del>
                                        </h5>
                                        <div class="price-qty">
                                            <div class="counter-number">
                                                <div class="counter">
                                                    <div class="qty-left-minus" data-type="minus" data-field="">
                                                        <i class="fa-solid fa-minus"></i>
                                                    </div>
                                                    <input class="form-control input-number qty-input" type="text"
                                                        name="quantity" value="1">
                                                    <div class="qty-right-plus" data-type="plus" data-field="">
                                                        <i class="fa-solid fa-plus"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <button 
                                                class="buy-button buy-button-2 btn btn-cart adicionar_carrinho_rapido"
                                                {% if result['por'] is defined and result['de'] is defined and value.variacoes[0]['estoque'] is defined%}
                                                    {%
                                                        set price = result['por'] ? result['por'] : result['de']
                                                    %}
                                                    {%
                                                        set estoque_verificado = value.variacoes[0]['estoque'] ? value.variacoes[0]['estoque'] : ''
                                                    %}
                                                {% endif %}
                                                data-nome="{{ nomedest }}"
                                                data-produto="{{ value._id }}"
                                                data-imagem="{{ value.imagens[0] }}"
                                                data-valor="{{ result['por'] }}"
                                                data-estoque="{{ estoque_verificado }}"
                                                data-cat="{{ value.categoria }}"
                                            >
                                                <i class="iconly-Buy icli text-white m-0"></i>
                                            </button>
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
    <!-- Shop Section End -->

    <!-- Product Section Start -->
    <section>
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="slider-4-1 ratio_65 no-arrow product-wrapper">
                        {% for item in minibanners %}
                        <div>
                            <div class="product-slider wow fadeInUp">
                                <a href="{{item.link}}" class="product-slider-image">
                                    <img src="{{link_imagens ~ item.imagem[0]}}" width="450px" height="230px" class="w-100 blur-up lazyload rounded-3"
                                        alt="">
                                </a>

                                <div class="product-slider-detail">
                                    <div>
                                        <a href="{{item.link}}" class="d-block">
                                            <h3 class="text-title">{{item.texto1}}</h3>
                                        </a>
                                        <h5>{{item.texto2}}</h5>

                                        <h6> <span class="theme-color">Atacadão das Castanhas</span></h6>
                                        <button onclick="location.href = '{{item.link}}';"
                                            class="btn btn-animation product-button btn-sm">Ver Mais <i
                                                class="fa-solid fa-arrow-right icon"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {% endfor %}
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Top Selling Section Start -->
    <section class="top-selling-section">
        <div class="container-fluid-lg">
            <div class="slider-4-1">
                <div>
                    <div class="row">
                        <div class="col-12">
                            <div class="top-selling-box">
                                <div class="top-selling-title">
                                    <h3>Castanhas</h3>
                                </div>

                                
                                <?php foreach($castanhas as $key => $cat1){?>
                                <div class="top-selling-contain wow fadeInUp">
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
                                    
                                    <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(cat1.nome)}}/{{cat1._id}}" class="top-selling-image">
                                        <?php
                                            $existedesc = (isset($cat1->variacoes[0]['desconto'])) ? $cat1->variacoes[0]['desconto'] : '';
                                            $result = $this->app->verificaDesconto($cat1->variacoes[0]['valor'],$cat1->categoria,$existedesc); 
                                        ?> 
                                    {% if cat1.imagens[0] is not empty %}
                                        <img src="{{link_imagens ~ cat1.imagens[0]}}"
                                            class="img-fluid blur-up lazyload" alt="">
                                    </a>
                                    {% else %}                                    
                                        <img src="{{this.url.getBaseUri() ~ 'img/nophoto.webp'}}"
                                            class="img-fluid blur-up lazyload" alt="">
                                    </a>
                                    {% endif %}

                                    <div class="top-selling-detail">
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(cat1.nome)}}/{{cat1._id}}">
                                            <h5>
                                                <?php 	
                                                $nomedest = mb_convert_case($cat1->nome, MB_CASE_LOWER, 'UTF-8');												
                                                echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                ?> 
                                            </h5>
                                        </a>
                                        <h5 class="price theme-color">
                                            <span class="theme-color">
                                                <?php if(isset($result['por'])){
                                                    echo $result['por'];
                                                }?>
                                            </span>
                                            <del style="font-size: 12px;">
                                                <?php if(isset($result['de'])){
                                                    echo $result['de'];
                                                }?>
                                            </del>
                                        </h5>
                                    </div>
                                </div>
                                <?php }?> 
                               
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="row">
                        <div class="col-12">
                            <div class="top-selling-box">
                                <div class="top-selling-title">
                                    <h3>Temperos</h3>
                                </div>

                                {% for cat2 in temperos %}
                                <div class="top-selling-contain wow fadeInUp">

                                    <?php
                                        $existedesc = (isset($cat2->variacoes[0]['desconto'])) ? $cat2->variacoes[0]['desconto'] : '';
                                        $result = $this->app->verificaDesconto($cat2->variacoes[0]['valor'],$cat2->categoria,$existedesc); 
                                    ?> 
                                    {% if cat2.imagens[0] is not empty %}
                                    <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(cat2.nome)}}/{{cat2._id}}" class="top-selling-image">
                                        <img src="{{link_imagens ~ cat2.imagens[0]}}"
                                            class="img-fluid blur-up lazyload" alt="">
                                    </a>
                                    {% else %}
                                    <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(cat2.nome)}}/{{cat2._id}}" class="top-selling-image">
                                        <img src="{{this.url.getBaseUri() ~ 'img/nophoto.webp'}}"
                                            class="img-fluid blur-up lazyload" alt="">
                                    </a>
                                    {% endif %}
                                    

                                    <div class="top-selling-detail">
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(cat2.nome)}}/{{cat2._id}}">
                                            <h5>
                                                <?php 	
                                                $nomedest = mb_convert_case($cat2->nome, MB_CASE_LOWER, 'UTF-8');												
                                                echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                ?> 
                                            </h5>
                                        </a>

                                        <h5 class="price theme-color">
                                            <span class="theme-color">
                                                <?php if(isset($result['por'])){
                                                    echo $result['por'];
                                                }?>
                                            </span>
                                            <del style="font-size: 12px;">
                                                <?php if(isset($result['de'])){
                                                    echo $result['de'];
                                                }?>
                                            </del>
                                        </h5>
                                    </div>
                                </div>
                                {% endfor %}

                                
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="row">
                        <div class="col-12">
                            <div class="top-selling-box">
                                <div class="top-selling-title">
                                    <h3>Grãos e Sementes</h3>
                                </div>
                                

                                {% for cat3 in graos %}
                                <div class="top-selling-contain wow fadeInUp">

                                    <?php
                                    $existedesc = (isset($cat3->variacoes[0]['desconto'])) ? $cat3->variacoes[0]['desconto'] : '';
                                    $result = $this->app->verificaDesconto($cat3->variacoes[0]['valor'],$cat3->categoria,$existedesc); 
                                ?> 
                                    {% if cat3.imagens[0] is not empty %}
                                    <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(cat3.nome)}}/{{cat3._id}}" class="top-selling-image">
                                        <img src="{{link_imagens ~ cat3.imagens[0]}}"
                                            class="img-fluid blur-up lazyload" alt="">
                                    </a>
                                    {% else %}
                                    <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(cat3.nome)}}/{{cat3._id}}" class="top-selling-image">
                                        <img src="{{this.url.getBaseUri() ~ 'img/nophoto.webp'}}"
                                            class="img-fluid blur-up lazyload" alt="">
                                    </a>
                                    {% endif %}
                                    <div class="top-selling-detail">
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(cat3.nome)}}/{{cat3._id}}">
                                            <h5>
                                                <?php
                                                $nomedest = mb_convert_case($cat3->nome, MB_CASE_LOWER, 'UTF-8');												
                                                echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                ?> 
                                            </h5>
                                        </a>

                                        <h5 class="price theme-color">
                                            <span class="theme-color">
                                                <?php if(isset($result['por'])){
                                                    echo $result['por'];
                                                }?>
                                            </span>
                                            <del style="font-size: 12px;">
                                                <?php if(isset($result['de'])){
                                                    echo $result['de'];
                                                }?>
                                            </del>
                                        </h5>
                                    </div>
                                </div>
                                {% endfor %}

                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="row">
                        <div class="col-12">
                            <div class="top-selling-box">
                                <div class="top-selling-title">
                                    <h3>Farinhas</h3>
                                </div>

                                {% for cat4 in farinhas %}
                                <div class="top-selling-contain wow fadeInUp">

                                    <?php
                                        $existedesc = (isset($cat4->variacoes[0]['desconto'])) ? $cat4->variacoes[0]['desconto'] : '';
                                        $result = $this->app->verificaDesconto($cat4->variacoes[0]['valor'],$cat4->categoria,$existedesc); 
                                    ?> 
                                    
                                    {% if cat4.imagens[0] is not empty %}
                                    <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(cat4.nome)}}/{{cat4._id}}" class="top-selling-image">
                                        <img src="{{link_imagens ~ cat4.imagens[0]}}"
                                            class="img-fluid blur-up lazyload" alt="">
                                    </a>
                                    {% else %}
                                    <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(cat4.nome)}}/{{cat4._id}}" class="top-selling-image">
                                        <img src="{{this.url.getBaseUri() ~ 'img/nophoto.webp'}}"
                                            class="img-fluid blur-up lazyload" alt="">
                                    </a>
                                    {% endif %}
                                    <div class="top-selling-detail">
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(cat4.nome)}}/{{cat4._id}}">
                                            <h5>
                                                <?php
                                                $nomedest = mb_convert_case($cat4->nome, MB_CASE_LOWER, 'UTF-8');												
                                                echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                ?> 
                                            </h5>
                                        </a>

                                        <h5 class="price theme-color">
                                            <span class="theme-color">
                                                <?php if(isset($result['por'])){
                                                    echo $result['por'];
                                                }?>
                                            </span>
                                            <del style="font-size: 12px;">
                                                <?php if(isset($result['de'])){
                                                    echo $result['de'];
                                                }?>
                                            </del>
                                        </h5>
                                    </div>
                                </div>
                                {% endfor %}

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Top Selling Section End -->

    <!-- Blog Section Start -->
    <section>
        <div class="container-fluid-lg">
            <div class="title">
                <h2>Dicas / Receitas</h2>
                <span class="title-leaf">
                    <img src="{{this.url.getBaseUri() ~ 'images/icone.jpg'}}" alt="">
                </span>
                <p>Dicas de saúde e novidades para você ficar bem informado</p>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="slider-5 ratio_87">
                        {% for item in receitas %}
                        <div>
                            <div class="blog-box">
                                <div class="blog-box-image">
                                    <a href="{{this.url.getBaseUri() ~ 'receita_detalhes/' ~ item._id}}" class="blog-image">
                                        <img src="{{link_imagens ~ item.imagem[0]}}" class="bg-img blur-up lazyload"
                                            alt="{{item.nome}}">
                                    </a>
                                </div>

                                <div class="blog-detail">
                                    <!-- <h6>Farmart</h6> -->
                                    <h5>{{item.nome}}</h5>
                                </div>
                            </div>
                        </div>
                        {% endfor %}
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
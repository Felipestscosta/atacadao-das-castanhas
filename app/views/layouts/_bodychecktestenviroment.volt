<!DOCTYPE html>
<html lang="pt_br">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="{{ empresa.seo['description'] is not empty ? empresa.seo['description'] : '' }}">
    <meta name="keywords" content="{{ empresa.seo['keywords']  is not empty ? empresa.seo['keywords'] : '' }}" />
    <meta property="og:image" content="{{ this.url.getBaseUri() }}images/logo-whats.webp" />
    <meta name="author" content="Webearte">
    <link rel="icon" href="{{ link_imagens ~ empresa.profile_favicon }}" type="image/x-icon">
    <title>{{empresa.razao_social}}</title>

        <!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-P7QJ75Z');</script>
    <!-- End Google Tag Manager -->

    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.gstatic.com/">
    <link href="https://fonts.googleapis.com/css2?family=Russo+One&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;500;600;700;800;900&amp;display=swap"
        rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
        rel="stylesheet">

    <!-- bootstrap css -->
    <link id="rtl-link" rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/vendors/bootstrap.css">

    <!-- wow css -->
    <link rel="stylesheet" href="{{this.url.getBaseUri()}}assets/css/animate.min.css" />

    <!-- font-awesome css -->
    <link rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/vendors/font-awesome.css">

    <!-- feather icon css -->
    <link rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/vendors/feather-icon.css">

    <!-- slick css -->
    <link rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/vendors/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/vendors/slick/slick-theme.css">

    <!-- Iconly css -->
    <link rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/bulk-style.css">

    <!-- Template css -->
    <link id="color-link" rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="{{ this.url.getBaseUri() }}assets/css/custom.css">

    {{ assets.outputCss() }}

<!-- Event snippet for Website sale conversion page --> <script> gtag('event', 'conversion', { 'send_to': 'AW-11146294219/xfRsCKHQ9Z8YEMvn-8Ip', '{{ dados._id }}': '' }); </script>   

</head>

<body class="bg-effect">

    <!-- Loader Start -->
    <!-- <div class="fullpage-loader">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div> -->
    <!-- Loader End -->

    <!-- Header Start -->
    <header class="pb-md-4 pb-0">
        <div class="header-top">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-xxl-3 d-xxl-block d-none">
                        <div class="top-left-header">
                            <i class="iconly-Location icli text-white"></i>
                            <span class="text-white">{{empresa.endereco ~ ', ' ~ empresa.numero ~ ' - ' ~ empresa.cidade}}</span>
                        </div>
                    </div>

                    <div class="col-xxl-6 col-lg-9 d-lg-block d-none">
                        <div class="header-offer">
                            <div class="notification-slider">
                                <div>
                                    <div class="timer-notification">
                                        <h6><strong class="me-1">Bem Vindo ao Atacadão das Castanhas!</strong> Ofertas diárias.<strong class="ms-1">Aguarde mais novidades...</strong>
                                        </h6>
                                    </div>
                                </div>

                                <div>
                                    <div class="timer-notification">
                                        <h6>Venda no atacado
                                            <a href="{{this.url.getBaseUri() ~ 'paginas/novaconta'}}" class="text-white">Click aqui!</a>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <ul class="about-list right-nav-about">
                            <li class="right-nav-list">                                                             
                                <span style="color: #fff;">{{empresa.email}}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="top-nav top-header sticky-header">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-12">
                        <div class="navbar-top">
                            <button class="navbar-toggler d-xl-none d-inline navbar-menu-button" type="button"
                                data-bs-toggle="offcanvas" data-bs-target="#primaryMenu">
                                <span class="navbar-toggler-icon">
                                    <i class="fa-solid fa-bars"></i>
                                </span>
                            </button>
                            <a href="{{this.url.getBaseUri()}}" class="web-logo nav-logo">
                                <img src="{{ link_imagens ~ empresa.profile_logo }}" class="img-fluid blur-up lazyload" alt="{{empresa.nome_fantasia}}">
                            </a>

                            <div class="middle-box">
                                <!-- <div class="location-box">
                                    <button class="btn location-button" data-bs-toggle="modal"
                                        data-bs-target="#locationModal">
                                        <span class="location-arrow">
                                            <i data-feather="map-pin"></i>
                                        </span>
                                        <span class="locat-name">Your Location</span>
                                        <i class="fa-solid fa-angle-down"></i>
                                    </button>
                                </div> -->

                                <form class="search-box" method='GET' action="{{ this.url.getBaseUri() }}paginas/busca">
                                    <div class="input-group">
                                        <input type="search" name="busca" class="form-control" placeholder="Procurar por..."
                                            aria-label="Recipient's username" aria-describedby="button-addon2">
                                        <button class="btn" type="submit" id="button-addon2">
                                            <i data-feather="search"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>

                            <div class="rightside-box">
                                <div class="search-full">
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i data-feather="search" class="font-light"></i>
                                        </span>
                                        <input type="text" class="form-control search-type" placeholder="Buscar...">
                                        <span class="input-group-text close-search">
                                            <i data-feather="x" class="font-light"></i>
                                        </span>
                                    </div>
                                </div>
                                <ul class="right-side-menu">
                                    <li class="right-side">
                                        <div class="delivery-login-box">
                                            <div class="delivery-icon">
                                                <div class="search-box">
                                                    <i data-feather="search"></i>
                                                </div>
                                            </div>
                                        </div>

                                    </li>
                                    <li class="right-side">
                                        <a href="https://api.whatsapp.com/send?phone=55{{ this.app.limpar_texto(empresa.whatsapp) }}" class="delivery-login-box">
                                            <div class="delivery-icon">
                                                <i data-feather="phone-call"></i>
                                            </div>
                                            <div class="delivery-detail">
                                                <h6>Atendimento</h6>
                                                <h5> {{empresa.whatsapp}}</h5>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- <li class="right-side">
                                        <a href="{{ this.url.getBaseUri() ~ 'paginas/vercomparacao '}}" class="btn p-0 position-relative header-wishlist comparacao-count">
                                            <i data-feather="refresh-cw"></i>
                                            <span class="position-absolute top-0 start-100 translate-middle badge">
                                                {% if session.has("comparacao") %} 
                                                {{ count(session.get('comparacao')) }}
                                                {% else %}  
                                                {{ 0 }}
                                                {% endif %}
                                                <span class="visually-hidden">unread messages</span>
                                            </span>
                                        </a>
                                    </li> -->
                                    <li class="right-side">
                                        <div class="onhover-dropdown header-badge">
                                            <button type="button" class="btn p-0 position-relative header-wishlist">
                                                <i data-feather="shopping-cart"></i>
                                                <span class="position-absolute top-0 start-100 translate-middle badge cart-count">{{carrinho_quantidade}}
                                                    <span class="visually-hidden">unread messages</span>
                                                </span>
                                            </button>

                                            <div class="onhover-div">
                                                <ul class="cart-list">
                                                    {% for key, carrinho in conteudo_carrinho %}
                                                    <li class="product-box-contain">
                                                        <div class="drop-cart">
                                                            <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(carrinho['name'])}}/{{carrinho['id_mongo']}}" class="drop-image">
                                                                <?php if(isset($carrinho->imagens[0])):?>
                                                                <img src="{{link_imagens ~ carrinho.imagens[0]}}"
                                                                    class="blur-up lazyload" alt="">
                                                                <?php else:?>
                                                                <img src="{{this.url.getBaseUri()}}img/nophoto.webp"
                                                                    class="blur-up lazyload" alt="">
                                                                <?php endif;?>
                                                            </a>

                                                            <div class="drop-contain remove">
                                                                <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(carrinho['name'])}}/{{carrinho['id_mongo']}}">
                                                                    <h5>
                                                                        <?php 	
                                                                        $nomedest = mb_convert_case($carrinho['name'], MB_CASE_LOWER, 'UTF-8');												
                                                                        echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                                        ?>   
                                                                    </h5>
                                                                </a>
                                                                {{ carrinho['options']['cor'] is not empty ? this.app.getCor(carrinho['options']['cor']) : '' }}
                                                                <h6 ><span>{{ carrinho['qty'] }} x</span> R$ {{carrinho['price']}}</h6>
                                                                <button class="close-button close_button remove cart_quantity_delete" data-id="{{carrinho['rowId']}}">
                                                                    <i class="fa-solid fa-xmark"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    {% endfor %}
                                                    
                                                </ul>

                                                <div class="price-box">
                                                    <h5>Total :</h5>
                                                    <h4 class="theme-color fw-bold"><?= number_format($total_carrinho,2,',','.') ?></h4>
                                                </div>

                                                <div class="button-group">
                                                    <a href="{{this.url.getBaseUri()}}carrinho" class="btn btn-sm cart-button">Ver Carrinho</a>
                                                    <a href="{{this.url.getBaseUri()}}checkout" class="btn btn-sm cart-button theme-bg-color
                                                    text-white">Finalizar</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    {% if session.has("email") %} 
                                    <li class="right-side onhover-dropdown">
                                        <div class="delivery-login-box">
                                            <div class="delivery-icon">
                                                <i data-feather="user"></i>
                                            </div>
                                            <div class="delivery-detail">
                                                <h6>Olá,</h6>
                                                <h5>{{session.get("nome")}}</h5>
                                            </div>
                                        </div>

                                        <div class="onhover-div onhover-div-login">
                                            <ul class="user-box-name">
                                                <li class="product-box-contain">
                                                    <i></i>
                                                    <a href="{{this.url.getBaseUri()}}paginas/minhaconta/top-home">Meus dados</a>
                                                </li>

                                                <li class="product-box-contain">
                                                    <a href="{{ this.url.getBaseUri() }}paginas/minhaconta/pedidos-contact">Pedidos</a>
                                                </li>

                                                <li class="product-box-contain">
                                                    <a href="{{this.url.getBaseUri() ~ 'paginas/logoutuser'}}">Sair</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    {% else %}
                                    <li class="right-side onhover-dropdown">                                        
                                        <div class="delivery-login-box">
                                            <div class="delivery-icon">
                                                <i data-feather="user"></i>
                                            </div>                                            
                                            <div class="delivery-detail">
                                                <h6>Acessar</h6>
                                                <h5>Minha Conta</h5>
                                            </div>                                            
                                        </div> 
                                                                                
                                        <div class="onhover-div onhover-div-login">
                                            <ul class="user-box-name">
                                                <li class="product-box-contain">
                                                    <i></i>
                                                    <a href="{{ this.url.getBaseUri() ~ 'paginas/login' }}">Login</a>
                                                </li>

                                                <li class="product-box-contain">
                                                    <a href="{{ this.url.getBaseUri() ~ 'paginas/novaconta' }}">Cadastrar</a>
                                                </li>

                                                <li class="product-box-contain">
                                                    <a href="{{ this.url.getBaseUri() ~ 'paginas/login' }}">Minha Conta</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    {% endif %}
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </header>
    <!-- Header End -->

    <!-- mobile fix menu start -->
    <div class="mobile-menu d-md-none d-block mobile-cart">
        <ul>
            <li class="active">
                <a href="{{this.url.getBaseUri()}}">
                    <i class="iconly-Home icli"></i>
                    <span>Home</span>
                </a>
            </li>

            <li class="mobile-category">
                <a href="javascript:void(0)">
                    <i class="iconly-Category icli js-link"></i>
                    <span>Categoria</span>
                </a>
            </li>

            <li>
                <a href="{{this.url.getBaseUri() ~ 'paginas/busca'}}" class="search-box">
                    <i class="iconly-Search icli"></i>
                    <span>Busca</span>
                </a>
            </li>

            <!-- <li>
                <a href="{{ this.url.getBaseUri() ~ 'paginas/vercomparacao'}}" class="notifi-wishlist">
                    <i data-feather="refresh-cw"></i>
                    <span>Compare</span>
                </a>
            </li> -->

            <li>
                <a href="{{this.url.getBaseUri() ~ 'carrinho'}}">
                    <i class="iconly-Bag-2 icli fly-cate"></i>
                    <span>Carrinho</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- mobile fix menu end -->

    {{content()}}

        <!-- Newsletter Section Start -->
        <section class="newsletter-section section-b-space">
            <div class="container-fluid-lg">
                <div class="newsletter-box newsletter-box-2">
                    <div class="newsletter-contain py-5">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-xxl-4 col-lg-5 col-md-7 col-sm-9 offset-xxl-2 offset-md-1">
                                    <form id="mc-news" class="newsletter-detail">
                                        <h2>Inscreva-se em nossa newsletter...</h2>
                                        <h5>Receba por e-mail, descontos incríveis!</h5>
                                        <div class="input-box">
                                            <input type="email" name="email" class="form-control" id="exampleFormControlInput1"
                                                placeholder="Coloque seu E-mail">
                                            <i class="fa-solid fa-envelope arrow"></i>
                                            <button id="mc-submit" class="sub-btn btn">
                                                <span class="d-sm-block d-none">Inscreva-se</span>
                                                <i class="fa-solid fa-arrow-right icon"></i>
                                            </button>
                                            <div class="divnews"></div>
                                        </div>                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Newsletter Section End -->
    
        <!-- Footer Section Start -->
        <footer class="section-t-space">
            <div class="container-fluid-lg">
                <div class="service-section">
                    <div class="row g-3">
                        <div class="col-12">
                            <div class="service-contain">
                                <div class="service-box">
                                    <div class="service-image">
                                        <img src="{{this.url.getBaseUri()}}assets/svg/product.svg" class="blur-up lazyload" alt="">
                                    </div>
    
                                    <div class="service-detail">
                                        <h5>Produtos de qualidade</h5>
                                    </div>
                                </div>
    
                                <div class="service-box">
                                    <div class="service-image">
                                        <img src="{{this.url.getBaseUri()}}assets/svg/delivery.svg" class="blur-up lazyload" alt="">
                                    </div>
    
                                    <div class="service-detail">
                                        <h5>Entrega rápida</h5>
                                    </div>
                                </div>
    
                                <div class="service-box">
                                    <div class="service-image">
                                        <img src="{{this.url.getBaseUri()}}assets/svg/discount.svg" class="blur-up lazyload" alt="">
                                    </div>
    
                                    <div class="service-detail">
                                        <h5>Descontos e promoções</h5>
                                    </div>
                                </div>
    
                                <div class="service-box">
                                    <div class="service-image">
                                        <img src="{{this.url.getBaseUri()}}assets/svg/market.svg" class="blur-up lazyload" alt="">
                                    </div>
    
                                    <div class="service-detail">
                                        <h5>Os melhores preços</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    
                <div class="main-footer section-b-space section-t-space">
                    <div class="row g-md-4 g-3">
                        <div class="col-xl-4 col-lg-4 col-sm-6">
                            <div class="footer-logo">
                                <div class="theme-logo">
                                    <a href="{{this.url.getBaseUri()}}">
                                        <img src="{{link_imagens ~ empresa.profile_logo}}" class="blur-up lazyload" alt="">
                                    </a>
                                </div>
    
                                <div class="footer-logo-contain">
                                    <!-- <p>We are a friendly bar serving a variety of cocktails, wines and beers. Our bar is a
                                        perfect place for a couple.</p> -->
    
                                    <ul class="address">
                                        <li>
                                            <i data-feather="home"></i>
                                            <a href="javascript:void(0)">{{empresa.endereco ~ ', ' ~ empresa.numero}} <br> {{empresa.bairro ~ ' ' ~ empresa.cep}} <br> {{empresa.cidade ~ ' - ' ~ empresa.estado}}</a>
                                        </li>
                                        <li>
                                            <i data-feather="mail"></i>
                                            <a href="javascript:void(0)">{{empresa.email}}</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
    
    
                        <div class="col-xl col-lg-2 col-sm-3">
                            <div class="footer-title">
                                <h4>Links</h4>
                            </div>
    
                            <div class="footer-contain">
                                <ul>
                                    <li>
                                        <a href="{{this.url.getBaseUri()}}" class="text-content">Home</a>
                                    </li>
                                    <li>
                                        <a href="{{ this.url.getBaseUri() ~ 'paginas/receitas/' }}" class="text-content">Dicas / Receitas</a>
                                    </li>
                                    <li>
                                        <a href="{{ this.url.getBaseUri() ~ 'paginas/informacoes/entrega' }}" class="text-content">Entregas</a>
                                    </li>
                                    <li>
                                        <a href="{{ this.url.getBaseUri() ~ 'paginas/informacoes/politica_privacidade' }}" class="text-content">Política de privacidade</a>
                                    </li>
                                    <li>
                                        <a href="{{this.url.getBaseUri() ~ 'sobre'}}" class="text-content">A Empresa</a>
                                    </li>
                                    <li>
                                        <a href="{{this.url.getBaseUri() ~ 'contato'}}" class="text-content">Contato</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
    
                        <div class="col-xl-3 col-lg-4 col-sm-6">
                            <div class="footer-title">
                                <h4>Contatos</h4>
                            </div>
    
                            <div class="footer-contact">
                                <ul>
                                    <li>
                                        <div class="footer-number">
                                            <i data-feather="phone"></i>
                                            <div class="contact-number">
                                                <h6 class="text-content">Atendimento 24/7 :</h6>
                                                <h5>{{empresa.whatsapp}}</h5>
                                            </div>
                                        </div>
                                    </li>
    
                                    <li>
                                        <div class="footer-number">
                                            <i data-feather="mail"></i>
                                            <div class="contact-number">
                                                <h6 class="text-content">E-mail :</h6>
                                                <h5>{{empresa.email}}</h5>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
    
                <div class="sub-footer section-small-space">
                    <div class="reserve">
                        <h6 class="text-content">©<?php echo date('Y');?> Atacadão das Castanhas</h6>
                    </div>
    
                    <div class="social-link">
                        <h6 class="text-content">Somos sociais :</h6>
                        <ul>
                            {% if empresa.redes['facebook'] is not empty %}
                            <li>
                                <a href="{{empresa.redes['facebook']}}" target="_blank">
                                    <i class="fa-brands fa-facebook-f"></i>
                                </a>
                            </li>
                            {% endif %}{% if empresa.redes['twitter'] is not empty %}
                            <li>
                                <a href="https://twitter.com/" target="_blank">
                                    <i class="fa-brands fa-twitter"></i>
                                </a>
                            </li>
                            {% endif %}{% if empresa.redes['instagram'] is not empty %}
                            <li>
                                <a href="{{empresa.redes['instagram']}}" target="_blank">
                                    <i class="fa-brands fa-instagram"></i>
                                </a>
                            </li>
                            {% endif %}{% if empresa.redes['pinterest'] is not empty %}
                            <li>
                                <a href="{{empresa.redes['pinterest']}}" target="_blank">
                                    <i class="fa-brands fa-pinterest-p"></i>
                                </a>
                            </li>
                            {% endif %}
                        </ul>
                    </div>

                    <div>
                        <a href="https://www.webearte.com.br" target="_blank">Webearte</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->
    
    <!-- Modal -->
        <!-- Quick View Modal Box Start -->
        <div class="modal fade theme-modal view-modal" id="view" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">

        </div>
        <!-- Quick View Modal Box End -->


            
        <!-- Location Modal Start -->
        <div class="modal location-modal fade theme-modal" id="locationModal" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Choose your Delivery Location</h5>
                        <p class="mt-1 text-content">Enter your address and we will specify the offer for your area.</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="location-list">
                            <div class="search-input">
                                <input type="search" class="form-control" placeholder="Search Your Area">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
    
                            <div class="disabled-box">
                                <h6>Select a Location</h6>
                            </div>
    
                            <ul class="location-select custom-height">
                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Alabama</h6>
                                        <span>Min: $130</span>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Arizona</h6>
                                        <span>Min: $150</span>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>California</h6>
                                        <span>Min: $110</span>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Colorado</h6>
                                        <span>Min: $140</span>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Florida</h6>
                                        <span>Min: $160</span>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Georgia</h6>
                                        <span>Min: $120</span>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Kansas</h6>
                                        <span>Min: $170</span>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Minnesota</h6>
                                        <span>Min: $120</span>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>New York</h6>
                                        <span>Min: $110</span>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Washington</h6>
                                        <span>Min: $130</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Location Modal End -->
    
        
    
    
    
        <!-- Cookie Bar Box Start -->
        <!-- <div class="cookie-bar-box">
            <div class="cookie-box">
                <div class="cookie-image">
                    <img src="{{this.url.getBaseUri()}}assets/images/cookie-bar.png" class="blur-up lazyload" alt="">
                    <h2>Cookies!</h2>
                </div>
    
                <div class="cookie-contain">
                    <h5 class="text-content">Usamos cookies para tornar sua experiência melhor</h5>
                </div>
            </div>
    
            <div class="button-group">
                <button class="btn privacy-button">Política de Privacidade</button>
                <button class="btn ok-button">OK</button>
            </div>
        </div> -->
        <!-- Cookie Bar Box End -->
    
        <!-- Deal Box Modal Start -->
        <div class="modal fade theme-modal deal-modal" id="deal-box" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <div>
                            <h5 class="modal-title w-100" id="deal_today">Deal Today</h5>
                            <p class="mt-1 text-content">Recommended deals for you.</p>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="deal-offer-box">
                            <ul class="deal-offer-list">
                                <li class="list-1">
                                    <div class="deal-offer-contain">
                                        <a href="shop-left-sidebar.html" class="deal-image">
                                            <img src="{{this.url.getBaseUri()}}assets/images/vegetable/product/10.png" class="blur-up lazyload"
                                                alt="">
                                        </a>
    
                                        <a href="shop-left-sidebar.html" class="deal-contain">
                                            <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                            <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                        </a>
                                    </div>
                                </li>
    
                                <li class="list-2">
                                    <div class="deal-offer-contain">
                                        <a href="shop-left-sidebar.html" class="deal-image">
                                            <img src="{{this.url.getBaseUri()}}assets/images/vegetable/product/11.png" class="blur-up lazyload"
                                                alt="">
                                        </a>
    
                                        <a href="shop-left-sidebar.html" class="deal-contain">
                                            <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                            <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                        </a>
                                    </div>
                                </li>
    
                                <li class="list-3">
                                    <div class="deal-offer-contain">
                                        <a href="shop-left-sidebar.html" class="deal-image">
                                            <img src="{{this.url.getBaseUri()}}assets/images/vegetable/product/12.png" class="blur-up lazyload"
                                                alt="">
                                        </a>
    
                                        <a href="shop-left-sidebar.html" class="deal-contain">
                                            <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                            <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                        </a>
                                    </div>
                                </li>
    
                                <li class="list-1">
                                    <div class="deal-offer-contain">
                                        <a href="shop-left-sidebar.html" class="deal-image">
                                            <img src="{{this.url.getBaseUri()}}assets/images/vegetable/product/13.png" class="blur-up lazyload"
                                                alt="">
                                        </a>
    
                                        <a href="shop-left-sidebar.html" class="deal-contain">
                                            <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                            <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Deal Box Modal End -->
    
        <!-- Tap to top start -->
        <div class="theme-option">
            <div class="setting-box">
                <button class="btn setting-button">
                    <a href="https://api.whatsapp.com/send?phone=55{{ this.app.limpar_texto(empresa.whatsapp) }}"> 
                        <svg enable-background="new 0 0 512 512" width="45" height="45" version="1.1" viewBox="0 0 512 512" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><path d="M256.064,0h-0.128l0,0C114.784,0,0,114.816,0,256c0,56,18.048,107.904,48.736,150.048l-31.904,95.104  l98.4-31.456C155.712,496.512,204,512,256.064,512C397.216,512,512,397.152,512,256S397.216,0,256.064,0z" fill="#4CAF50"/><path d="m405.02 361.5c-6.176 17.44-30.688 31.904-50.24 36.128-13.376 2.848-30.848 5.12-89.664-19.264-75.232-31.168-123.68-107.62-127.46-112.58-3.616-4.96-30.4-40.48-30.4-77.216s18.656-54.624 26.176-62.304c6.176-6.304 16.384-9.184 26.176-9.184 3.168 0 6.016 0.16 8.576 0.288 7.52 0.32 11.296 0.768 16.256 12.64 6.176 14.88 21.216 51.616 23.008 55.392 1.824 3.776 3.648 8.896 1.088 13.856-2.4 5.12-4.512 7.392-8.288 11.744s-7.36 7.68-11.136 12.352c-3.456 4.064-7.36 8.416-3.008 15.936 4.352 7.36 19.392 31.904 41.536 51.616 28.576 25.44 51.744 33.568 60.032 37.024 6.176 2.56 13.536 1.952 18.048-2.848 5.728-6.176 12.8-16.416 20-26.496 5.12-7.232 11.584-8.128 18.368-5.568 6.912 2.4 43.488 20.48 51.008 24.224 7.52 3.776 12.48 5.568 14.304 8.736 1.792 3.168 1.792 18.048-4.384 35.52z" fill="#FAFAFA"/></svg>
                    </a>                    
                </button>

            </div>
    
            <div class="back-to-top">
                <a id="back-to-top" href="#">
                    <i class="fas fa-chevron-up"></i>
                </a>
            </div>
        </div>
        <!-- Tap to top end -->
    
        <!-- Bg overlay Start -->
        <div class="bg-overlay"></div>
        <!-- Bg overlay End -->

    <!-- Bg overlay Start -->
    <div class="bg-overlay"></div>
    <!-- Bg overlay End -->

    <!-- Add address modal box start -->
    <div class="modal fade theme-modal" id="add-address" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add a new address</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-floating mb-4 theme-form-floating">
                            <input type="text" class="form-control" id="fname" placeholder="Enter First Name">
                            <label for="fname">First Name</label>
                        </div>
                    </form>

                    <form>
                        <div class="form-floating mb-4 theme-form-floating">
                            <input type="text" class="form-control" id="lname" placeholder="Enter Last Name">
                            <label for="lname">Last Name</label>
                        </div>
                    </form>

                    <form>
                        <div class="form-floating mb-4 theme-form-floating">
                            <input type="email" class="form-control" id="email" placeholder="Enter Email Address">
                            <label for="email">Email Address</label>
                        </div>
                    </form>

                    <form>
                        <div class="form-floating mb-4 theme-form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here" id="address"
                                style="height: 100px"></textarea>
                            <label for="address">Enter Address</label>
                        </div>
                    </form>

                    <form>
                        <div class="form-floating mb-4 theme-form-floating">
                            <input type="email" class="form-control" id="pin" placeholder="Enter Pin Code">
                            <label for="pin">Pin Code</label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-md" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn theme-bg-color btn-md text-white" data-bs-dismiss="modal">Save
                        changes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Add address modal box end -->

    <!-- Location Modal Start -->
    <div class="modal location-modal fade theme-modal" id="locationModal" tabindex="-1"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Choose your Delivery Location</h5>
                    <p class="mt-1 text-content">Enter your address and we will specify the offer for your area.</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="location-list">
                        <div class="search-input">
                            <input type="search" class="form-control" placeholder="Search Your Area">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </div>

                        <div class="disabled-box">
                            <h6>Select a Location</h6>
                        </div>

                        <ul class="location-select custom-height">
                            <li>
                                <a href="javascript:void(0)">
                                    <h6>Alabama</h6>
                                    <span>Min: $130</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0)">
                                    <h6>Arizona</h6>
                                    <span>Min: $150</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0)">
                                    <h6>California</h6>
                                    <span>Min: $110</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0)">
                                    <h6>Colorado</h6>
                                    <span>Min: $140</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0)">
                                    <h6>Florida</h6>
                                    <span>Min: $160</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0)">
                                    <h6>Georgia</h6>
                                    <span>Min: $120</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0)">
                                    <h6>Kansas</h6>
                                    <span>Min: $170</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0)">
                                    <h6>Minnesota</h6>
                                    <span>Min: $120</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0)">
                                    <h6>New York</h6>
                                    <span>Min: $110</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0)">
                                    <h6>Washington</h6>
                                    <span>Min: $130</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Location Modal End -->

    <!-- Edit Profile Start -->
    <div class="modal fade theme-modal" id="editProfile" tabindex="-1" aria-labelledby="exampleModalLabel2"
        aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered modal-fullscreen-sm-down">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Editar Perfil</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row g-4">
                        <div class="col-xxl-12">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <input type="text" class="form-control" name="nome" id="nome" value="{{dados_cliente.nome}} {{dados_cliente.sobrenome}}">
                                    <label for="pname">Nome</label>
                                </div>
                            </form>
                        </div>

                        <div class="col-xxl-6">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <input type="email" class="form-control" name="email" id="email" value="{{dados_cliente.email}}">
                                    <label for="email1">E-mail</label>
                                </div>
                            </form>
                        </div>

                        <div class="col-xxl-6">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <input class="form-control celular" type="tel" value="{{dados_cliente.celular}}" name="celular" id="celular"
                                        maxlength="10" oninput="javascript: if (this.value.length > this.maxLength) this.value =
                                            this.value.slice(0, this.maxLength);">
                                    <label for="mobile">Celular</label>
                                </div>
                            </form>
                        </div>

                        <div class="col-6">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <input type="text" class="form-control cep" id="cep_ajax" name="cep" value="{{dados_cliente.cep}}">
                                    <label for="address2">Cep</label>
                                </div>
                            </form>
                        </div>

                        <div class="col-6">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <input type="text" class="form-control" id="endereco" name="endereco"
                                        value="{{dados_cliente.endereco}}">
                                    <label for="address1">Endereço</label>
                                </div>
                            </form>
                        </div>

                        <div class="col-4">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <input type="text" class="form-control" id="numero" name="numero"
                                        value="{{dados_cliente.numero}}">
                                    <label for="address1">Número</label>
                                </div>
                            </form>
                        </div>

                        <div class="col-4">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <input type="text" class="form-control" id="bairro" name="bairro" value="{{dados_cliente.bairro}}">
                                    <label for="address2">Bairro</label>
                                </div>
                            </form>
                        </div>

                        <div class="col-4">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <input type="text" class="form-control" id="referencia" name="referencia" value="{{dados_cliente.referencia}}">
                                    <label for="address2">Referencia</label>
                                </div>
                            </form>
                        </div>                        

                        <div class="col-xxl-4">
                            
                                <div class="form-floating theme-form-floating">
                                    <select class="form-select" name="estado" id="estado"
                                        aria-label="Floating label select example">
                                        <option value="">Selecione</option>
                                        <option value="AC" <?php if($dados_cliente->estado == 'AC'){echo 'selected';}?>>Acre</option>
                                        <option value="AL" <?php if($dados_cliente->estado == 'AL'){echo 'selected';}?>>Alagoas</option>
                                        <option value="AP" <?php if($dados_cliente->estado == 'AP'){echo 'selected';}?>>Amapá</option>
                                        <option value="AM" <?php if($dados_cliente->estado == 'AM'){echo 'selected';}?>>Amazonas</option>
                                        <option value="BA" <?php if($dados_cliente->estado == 'BA'){echo 'selected';}?>>Bahia</option>
                                        <option value="CE" <?php if($dados_cliente->estado == 'CE'){echo 'selected';}?>>Ceará</option>
                                        <option value="DF" <?php if($dados_cliente->estado == 'DF'){echo 'selected';}?>>Distrito Federal</option>
                                        <option value="ES" <?php if($dados_cliente->estado == 'ES'){echo 'selected';}?>>Espírito Santo</option>
                                        <option value="GO" <?php if($dados_cliente->estado == 'GO'){echo 'selected';}?>>Goiás</option>
                                        <option value="MA" <?php if($dados_cliente->estado == 'MA'){echo 'selected';}?>>Maranhão</option>
                                        <option value="MT" <?php if($dados_cliente->estado == 'MT'){echo 'selected';}?>>Mato Grosso</option>
                                        <option value="MS" <?php if($dados_cliente->estado == 'MS'){echo 'selected';}?>>Mato Grosso do Sul</option>
                                        <option value="MG" <?php if($dados_cliente->estado == 'MG'){echo 'selected';}?>>Minas Gerais</option>
                                        <option value="PA" <?php if($dados_cliente->estado == 'PA'){echo 'selected';}?>>Pará</option>
                                        <option value="PB" <?php if($dados_cliente->estado == 'PB'){echo 'selected';}?>>Paraíba</option>
                                        <option value="PR" <?php if($dados_cliente->estado == 'PR'){echo 'selected';}?>>Paraná</option>
                                        <option value="PE" <?php if($dados_cliente->estado == 'PE'){echo 'selected';}?>>Pernambuco</option>
                                        <option value="PI" <?php if($dados_cliente->estado == 'PI'){echo 'selected';}?>>Piauí</option>
                                        <option value="RJ" <?php if($dados_cliente->estado == 'RJ'){echo 'selected';}?>>Rio de Janeiro</option>
                                        <option value="RN" <?php if($dados_cliente->estado == 'RN'){echo 'selected';}?>>Rio Grande do Norte</option>
                                        <option value="RS" <?php if($dados_cliente->estado == 'RS'){echo 'selected';}?>>Rio Grande do Sul</option>
                                        <option value="RO" <?php if($dados_cliente->estado == 'RO'){echo 'selected';}?>>Rondônia</option>
                                        <option value="RR" <?php if($dados_cliente->estado == 'RR'){echo 'selected';}?>>Roraima</option>
                                        <option value="SC" <?php if($dados_cliente->estado == 'SC'){echo 'selected';}?>>Santa Catarina</option>
                                        <option value="SP" <?php if($dados_cliente->estado == 'SP'){echo 'selected';}?>>São Paulo</option>
                                        <option value="SE" <?php if($dados_cliente->estado == 'SE'){echo 'selected';}?>>Sergipe</option>
                                        <option value="TO" <?php if($dados_cliente->estado == 'TO'){echo 'selected';}?>>Tocantins</option>
                                    </select>
                                    <label for="floatingSelect">Estado</label>
                                </div>
                           
                        </div>

                        <div class="col-xxl-4">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <input type="text" class="form-control" id="cidade" name="cidade" value="{{dados_cliente.cidade}}">
                                    <label for="floatingSelect">Cidade</label>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-animation btn-md fw-bold"
                        data-bs-dismiss="modal">Fechar</button>
                    <button type="submit" data-bs-dismiss="modal"
                        class="btn theme-bg-color btn-md fw-bold text-light">Salvar alterações</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit Profile End -->

    <!-- Edit Card Start -->
    <div class="modal fade theme-modal" id="editCard" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered modal-fullscreen-sm-down">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel8">Edit Card</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row g-4">
                        <div class="col-xxl-6">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <input type="text" class="form-control" id="finame" value="Mark">
                                    <label for="finame">First Name</label>
                                </div>
                            </form>
                        </div>

                        <div class="col-xxl-6">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <input type="text" class="form-control" id="laname" value="Jecno">
                                    <label for="laname">Last Name</label>
                                </div>
                            </form>
                        </div>

                        <div class="col-xxl-4">
                            <form>
                                <div class="form-floating theme-form-floating">
                                    <select class="form-select" id="floatingSelect12"
                                        aria-label="Floating label select example">
                                        <option selected>Card Type</option>
                                        <option value="kindom">Visa Card</option>
                                        <option value="states">MasterCard Card</option>
                                        <option value="fra">RuPay Card</option>
                                        <option value="china">Contactless Card</option>
                                        <option value="spain">Maestro Card</option>
                                    </select>
                                    <label for="floatingSelect12">Card Type</label>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-animation btn-md fw-bold"
                        data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn theme-bg-color btn-md fw-bold text-light">Update Card</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit Card End -->

    <!-- Alterar senha -->
    <div class="modal fade theme-modal remove-profile" id="removeProfile" tabindex="-1"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
            <div class="modal-content">
                <div class="modal-header d-block text-center">
                    <h5 class="modal-title w-100" id="exampleModalLabel22">Alterar Senha</h5>
                    <p>Esqueceu seua senha? </p> <p> Por favor insira seu e-mail cadastrado neste site, <br> que você receberá uma nova senha.</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="modal-body senha">
                    <div class="input-box">
                        <form method="post" class="row g-4" id="envia-recupera-senha">
                            <div class="col-12">
                                <div class="form-floating theme-form-floating log-in-form">                                    
                                    <input type="email" class="form-control" id="userName email" name="email">
                                    <label for="email">E-mail</label>
                                </div>
                                <br>
                                <div class="col-12">
                                    <button class="btn btn-animation w-100" type="submit" data-bs-target="#removeAddress" data-bs-toggle="modal">Enviar Senha</button>
                                </div>
                            </div>                            
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-animation btn-md fw-bold" data-bs-dismiss="modal">Cancelar</button>
                    <!-- <button type="button" class="btn theme-bg-color btn-md fw-bold text-light"
                        data-bs-target="#removeAddress" data-bs-toggle="modal">Yes</button> -->
                </div>
            </div>
        </div>
    </div>
    <!-- fim -->

    <div class="modal fade theme-modal remove-profile" id="removeAddress" tabindex="-1"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center" id="exampleModalLabel12">Confirmação</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="remove-box text-center">
                        <div class="msgLogin"></div>
                    </div>
                </div>
                <div class="modal-footer pt-0">
                    <button type="button" class="btn theme-bg-color btn-md fw-bold text-light"
                        data-bs-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Remove Profile Modal End -->        
    
        <!-- Bg overlay Start -->
        <div class="bg-overlay"></div>
        <!-- Bg overlay End -->
        <script>var hostsite = "{{ this.url.getBaseUri() }}";</script>
        <!-- latest jquery-->
        <!-- <script src="{{this.url.getBaseUri()}}assets/js/jquery-3.6.0.min.js"></script> -->

    
        <!-- Bootstrap js-->
        <script src="{{this.url.getBaseUri()}}assets/js/bootstrap/bootstrap.bundle.min.js"></script>
        <!-- <script src="{{this.url.getBaseUri()}}assets/js/bootstrap/bootstrap-notify.min.js"></script> -->
        <script src="{{this.url.getBaseUri()}}assets/js/bootstrap/popper.min.js"></script>
    
        <!-- feather icon js-->
        <script src="{{this.url.getBaseUri()}}assets/js/feather/feather.min.js"></script>
        <script src="{{this.url.getBaseUri()}}assets/js/feather/feather-icon.js"></script>
    
        <!-- Lazyload Js -->
        <script src="{{this.url.getBaseUri()}}assets/js/lazysizes.min.js"></script>
    
        <!-- WOW js -->
        <script src="{{this.url.getBaseUri()}}assets/js/wow.min.js"></script>
        <script src="{{this.url.getBaseUri()}}assets/js/custom-wow.js"></script>

        <!-- Price Range Js -->
        <!-- <script src="{{this.url.getBaseUri()}}assets/js/ion.rangeSlider.min.js"></script> -->
    
        <!-- script js -->
        <!-- <script src="{{this.url.getBaseUri()}}assets/js/script.js"></script> -->

        {{ assets.outputJs() }}

        <script>
            $('.cartao').mask('XXXX.XXXX.XXXX.XXXX');  
            function verificanumero(e) {
                var expressao;
                expressao = /[0-9]/;
                if (expressao.test(String.fromCharCode(e.keyCode))) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>

        {{ partial('layouts/scriptscheckout_pagseguro')}}


        <link rel="stylesheet" type="text/css" href="{{ this.url.getBaseUri() }}assets/css/privacidade.css" />
        <script src="{{ this.url.getBaseUri() }}assets/js/privacidade.js"></script>

        <script>
            function copiarTexto() {
            /* Selecionamos por ID o nosso input */
            var textoCopiado = document.getElementById("texto");

            /* Deixamos o texto selecionado (em azul) */
            textoCopiado.select();
            textoCopiado.setSelectionRange(0, 99999); /* Para mobile */

            /* Copia o texto que está selecionado */    
            document.execCommand("copy");             
            //  prompt ("COPIADO: " + textoCopiado.value);
             document.getElementById('texto');
            }
        </script>

        <script>
            window.addEventListener("load", function(){
            window.cookieconsent.initialise({
            "palette": {
                "popup": {
                "background": "rgba(64,64,64,.9)",
                "text": "#ffffff"
                },
                "button": {
                "background": "#afed71"
                }
            },
            "content": {
                "message": "Usamos cookies para tornar sua experiência melhor!",
                "dismiss": "OK",
                "href": "{{this.url.getBaseUri()}}paginas/informacoes/politica_privacidade"
            }
            })});
            </script>

    </body>
    
    
    </html>
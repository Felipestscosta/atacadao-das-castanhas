    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>Busca</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="{{this.url.getBaseUri()}}">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Busca</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Search Bar Section Start -->
    <section class="search-section">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-xxl-6 col-xl-8 mx-auto">
                    <form class="title d-block text-center">
                        Sua Busca por <h2> {{ busca }}</h2>
                        <span class="title-leaf">
                            <img src="{{this.url.getBaseUri() ~ 'images/icone.jpg'}}" alt="">
                        </span>
                    </form>

                    <div class="search-box">
                        <form class="input-group" method='GET' action="{{ this.url.getBaseUri() }}paginas/busca">
                            <input type="text" name="busca" class="form-control" placeholder=""
                                aria-label="Example text with button addon">
                            <button class="btn theme-bg-color text-white m-0" type="submit"
                                id="button-addon1">Buscar</button>
                        </form>
                        <h3 style="text-align: center;
                        padding: 30px 0 0;
                        color: #0da487;">
                            <?php if($total == 0){
                                echo "Nenhum produto encontrado";}
                                else if($total == 1){echo $total. " produto encontrado";}
                                else{echo $total. " produtos encontrados";}
                            ?> 
                            </h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Search Bar Section End -->

    <?php if(empty($page->items)){ ?> 
    <!-- Product Section Start -->
    <section class="section-b-space">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="search-product product-wrapper">

                        {% if page.items is not empty %}
                        <div class="title d-block text-center">
                            <h2>NENHUM PRODUTO ENCONTRADO</h2>
                        </div>
                        {% endif %}
         
                        <?php foreach($page->items as $key => $value){?>
                        <div>
                            <div class="product-box-3 h-100">
                                <div class="product-header">
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
                                            <?php if(isset($value->imagens[0])):?>
                                            <img src="{{link_imagens ~ value.imagens[0]}}"
                                                class="img-fluid blur-up lazyload" alt="{{value.nome}}">
                                        </a>
                                        <?php else:?>
                                        <img src="{{this.url.getBaseUri()}}img/nophoto.webp"
                                            class="img-fluid blur-up lazyload" alt="{{value.nome}}">
                                        <?php endif;?>

                                        <?php  if((count($value->variacoes == 1)) && ($value->variacoes[0]['estoque'] <= 0)){?>
                                        <ul class="product-option justify-content-around" style="background-color: #ffa53b;">
                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Indisponível">
                                                <p>INDISPONÍVEL</p>
                                            </li>
                                        </ul>
                                        <?php } else {?>

                                        <ul class="product-option justify-content-around">
                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Carrinho">
                                                <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}" tabindex="0">
                                                    <i class="iconly-Buy icli"></i>
                                                </a>
                                            </li>

                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Ver">
                                                <a href="javascript:void(0)" class="testamodal" data-hint="Visualizar" data-id="{{value._id}}" data-bs-toggle="modal"
                                                    data-bs-target="#view">
                                                    <i data-feather="eye"></i>
                                                </a>
                                            </li>

                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Compare">
                                                <a href="#" class="compare" data-produto="{{ value._id }}">
                                                    <i data-feather="refresh-cw"></i>
                                                </a>
                                            </li>
                                            <?php }?>
                                        </ul>
                                    </div>
                                </div>

                                <div class="product-footer">
                                    <div class="product-detail">
                                        <!-- <span class="span-name">Cake</span> -->
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
                                            <h5 class="name">
                                                <?php 	
                                                $nomedest = mb_convert_case($value->nome, MB_CASE_LOWER, 'UTF-8');												
                                                echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                ?> 
                                            </h5>
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
                                            <!-- <span>(5.0)</span> -->
                                        </div>
                                        <!-- <h6 class="unit">500 G</h6> -->
                                        <h5 class="price"><span class="theme-color"><?php if(isset($result['por'])){ echo $result['por']; }?></span> <del><?php if(isset($result['de'])){echo $result['de'];}?></del>
                                        </h5>

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
    
    <!-- Product Section End -->                        

    <?php }else{ ?>
    <!-- Shop Section Start -->
    <section class="section-b-space shop-section">
        <div class="container-fluid-lg">
            <div class="row">               

                <div class="col-custome-12">
                    {# <div class="show-button">

                        <div class="top-filter-menu">
                            <div class="grid-option d-none d-md-block">
                                <ul>
                                    <li class="three-grid">
                                        <a href="javascript:void(0)">
                                            <img src="../assets/svg/grid-3.svg" class="blur-up lazyload" alt="">
                                        </a>
                                    </li>
                                    <li class="grid-btn d-xxl-inline-block d-none active">
                                        <a href="javascript:void(0)">
                                            <img src="../assets/svg/grid-4.svg"
                                                class="blur-up lazyload d-lg-inline-block d-none" alt="">
                                            <img src="../assets/svg/grid.svg"
                                                class="blur-up lazyload img-fluid d-lg-none d-inline-block" alt="">
                                        </a>
                                    </li>
                                    <li class="list-btn">
                                        <a href="javascript:void(0)">
                                            <img src="../assets/svg/list.svg" class="blur-up lazyload" alt="">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div> #}

                    <div class="row g-8">
                        <?php foreach($page->items as $key => $value){ ?>
                            <div class="col-xxl-3 col-lg-3 col-md-4 col-6 wow fadeInUp" data-price="{{ this.app.transform(value.variacoes[0]['valor']) }}">
                                <div class="product-box-4">
                                     <?php if(empty($page->items)){ ?>
                                        <div class="product-header">
                                            NENHUM PRODUTO DISPONÍVEL NESTA CATEGORIA
                                        </div>
                                    <?php }else{ ?> 
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
                                            <h5 class="price">
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
                                    <?php }?>
                                </div>
                            </div>
                        <?php }?> 
                    </div>

                    <nav class="custome-pagination">
                        <?php 
                        $server = $_SERVER['SERVER_NAME'];
                        $endereco = $_SERVER ['REQUEST_URI'];
                        $url = "http://" . $server . $endereco;                         
                        $r = explode('&page=', $url);
                        $urlatual = $r[0].'&page='; 
                        $url = $urlatual; 
                        $number = ($page->total_pages > 4) ? 5 : $page->total_pages;

                        if ($page->total_pages > 1): ?>
                        <ul class="pagination justify-content-center">
                            <li class="page-item <?= ($page->before == $page->current) ? 'disabled' : '' ?>">
                                <a class="page-link href="<?php echo $urlatual;?><?= $page->before; ?>" " tabindex="-1" aria-disabled="true">
                                    <i class="fa-solid fa-angles-left"></i>
                                </a>
                            </li>
                            <?php
                            if ($page->current > 2 && $page->total_pages > 4 && $page->last > ($page->current + 2)) {
                                for($i = $page->current; $i < ($page->current + 5); $i++) {
                                    $j = $i - 2;
                                    $active = ($page->current == $j) ? ' class="page-item active"' : '';
                                    echo '<li' . $active . '><a href="'.($url.$j).'">'.$j.'</a></li>';
                                }
                            }
                            elseif ($page->current > 2 && $page->total_pages > 4 && $page->last < ($page->total_pages + 2)) {
                                for($i = ($page->total_pages - 4); $i < ($page->total_pages + 1); $i++) {
                                    $j = $i - 2;
                                    $active = ($page->current == $i) ? ' class="page-item active"' : '';
                                    echo '<li' . $active . '><a href="'.($url.$i).'">'.$i.'</a></li>';
                                }
                            }
                            else {
                                for($i = 1; $i < ($number + 1); $i++) {
                                    $active = ($page->current == $i) ? ' class="page-item active"' : '';
                                    echo '<li' . $active . '><a href="'.($url.$i). '" class="page-link">' . $i . '</a></li>';
                                }
                            }
                        ?>


                            <li class="page-item">
                                <a class="<?= ($page->last == $page->current) ? 'disabled' : '' ?> page-link" href="<?= ($url.$page->next); ?>">
                                    <i class="fa-solid fa-angles-right"></i>
                                </a>
                            </li>
                        </ul>
                        <?php endif ?>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->
    <?php }?>



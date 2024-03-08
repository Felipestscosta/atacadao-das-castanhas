    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>Produtos no Atacado</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="{{this.url.getBaseUri()}}">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Produtos no Atacado</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Category Section Start -->
    <section class="wow fadeInUp">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="slider-7_1 no-space shop-box no-arrow">
                        {% for cat in categorias %}
                        <div>
                            <div class="shop-category-box">
                                <a href="shop-left-sidebar.html">
                                    <div class="shop-category-image">
                                        <img src="{{this.url.getBaseUri()}}assets/svg/1/vegetable.svg" class="blur-up lazyload" alt="">
                                    </div>
                                    <div class="category-box-name">
                                        <h6>{{cat.categoria_nome}}</h6>
                                    </div>
                                </a>
                            </div>
                        </div>
                        {% endfor %}

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Category Section End -->

    <!-- Shop Section Start -->
    <section class="section-b-space shop-section">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-custome-3 wow fadeInUp">
                    <div class="left-box">
                        <div class="shop-left-sidebar">    

                            <div class="accordion custome-accordion" id="accordionExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne" aria-expanded="true"
                                            aria-controls="collapseOne">
                                            <span>Busca</span>
                                        </button>
                                    </h2>
                                    <div id="collapseOne" class="accordion-collapse collapse show"
                                        aria-labelledby="panelsStayOpen-headingOne">
                                        <div class="accordion-body">
                                            <form method='GET' action="{{ this.url.getBaseUri() }}paginas/atacado">
                                                <div class="form-floating theme-form-floating-2 search-box">
                                                    <input type="search" class="form-control" name="busca"
                                                        placeholder="Buscar ...">
                                                    <label for="busca">Buscar</label>
                                                </div>
                                            </form>

                                            <ul class="category-list custom-padding custom-height">
                                                {% for cate in categorias %}
                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox" id="fruit">
                                                        <label class="form-check-label" for="fruit">
                                                            <span class="name">{{cate.categoria_nome}}</span>
                                                            <span class="number">(15)</span>
                                                        </label>
                                                    </div>
                                                </li>
                                                {% endfor %}
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseThree"
                                            aria-expanded="false" aria-controls="collapseThree">
                                            <span>Preço</span>
                                        </button>
                                    </h2>
                                    <div id="collapseThree" class="accordion-collapse collapse show"
                                        aria-labelledby="panelsStayOpen-headingThree">
                                        <div class="accordion-body">
                                            <div class="range-slider">
                                                <input type="text" class="js-range-slider" value="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-custome-9 wow fadeInUp">
                    <div class="show-button">
                        <div class="filter-button-group mt-0">
                            <div class="filter-button d-inline-block d-lg-none">
                                <a><i class="fa-solid fa-filter"></i> Filtro</a>
                            </div>
                        </div>

                        <div class="top-filter-menu">
                            <div class="category-dropdown">
                                <h5 class="text-content">Ordenar por :</h5>
                                <form class="dropdown" action="{{atacado_url}}">
                                    <!-- <button class="dropdown-toggle" type="button" id="dropdownMenuButton1"
                                        data-bs-toggle="dropdown">
                                        <span>Ordenar</span> <i class="fa-solid fa-angle-down"></i>
                                    </button> -->
                                    <select class="dropdown-toggle" data-bs-toggle="dropdown" id="dropdownMenuButton1" name='ordenar' onchange="this.form.submit()">
                                        <option value="position:asc" <?= (isset($_POST['ordenar']) and $_POST['ordenar'] == 'position:asc' ) ? 'selected="selected"' : '' ?>>Ordenar por</option>
                                        <option value="price:asc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'price:asc') ? 'selected="selected"' : '' ?>>Menor Valor</option>
                                        <option value="price:desc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'price:desc') ? 'selected="selected"' : '' ?>>Maior Valor</option>
                                        <option value="name:asc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'name:asc') ? 'selected="selected"' : '' ?>>Produtos A a Z</option>
                                        <option value="name:desc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'name:desc') ? 'selected="selected"' : '' ?>>Produtos Z a A</option>
                                    </select>
                                </form>
                            </div>

                            <div class="grid-option d-none d-md-block">
                                <ul>
                                    <li class="three-grid">
                                        <a href="javascript:void(0)">
                                            <img src="{{this.url.getBaseUri()}}assets/svg/grid-3.svg" class="blur-up lazyload" alt="">
                                        </a>
                                    </li>
                                    <li class="grid-btn d-xxl-inline-block d-none active">
                                        <a href="javascript:void(0)">
                                            <img src="{{this.url.getBaseUri()}}assets/svg/grid-4.svg"
                                                class="blur-up lazyload d-lg-inline-block d-none" alt="">
                                            <img src="{{this.url.getBaseUri()}}assets/svg/grid.svg"
                                                class="blur-up lazyload img-fluid d-lg-none d-inline-block" alt="">
                                        </a>
                                    </li>
                                    <li class="list-btn">
                                        <a href="javascript:void(0)">
                                            <img src="{{this.url.getBaseUri()}}assets/svg/list.svg" class="blur-up lazyload" alt="">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div
                        class="row g-sm-4 g-3 row-cols-xxl-4 row-cols-xl-3 row-cols-lg-2 row-cols-md-3 row-cols-2 product-list-section">

                        <?php foreach($page->items as $key => $value){?>
                        <div data-price="{{ this.app.transform(value.variacoes[0]['valor']) }}">
                            <?php 
                                $existedesc = (isset($value->variacoes[0]['desconto'])) ? $value->variacoes[0]['desconto'] : '';
                                $result = $this->app->verificaDesconto($value->variacoes[0]['valor'],$value->categoria,$existedesc);                           
                            ?> 
                            <div class="product-box-3 h-100 wow fadeInUp">
                               
                                <div class="product-header">
                                    <div class="product-image">
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
                                            <?php if(isset($value->imagens[0])):?>
                                            <img src="{{link_imagens ~ value.imagens[0]}}"
                                                class="img-fluid blur-up lazyload" alt="">
                                                <?php else:?>                                                 
                                            <img src="{{this.url.getBaseUri()}}img/nophoto.webp"
                                                class="img-fluid blur-up lazyload" alt="">
                                            <?php endif;?>
                                        </a>
                                    </div>
                                </div>
                                
                                <div class="product-footer">
                                    <div class="product-detail">
                                        <span class="span-name">{{value.categoria_nome}}</span>
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
                                            <h5 class="name">
                                                <?php 	
                                                $nomedest = mb_convert_case($value->nome, MB_CASE_LOWER, 'UTF-8');												
                                                echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                ?> 
                                            </h5>
                                        </a>
                                        <p class="text-content mt-1 mb-2 product-content">{{this.app.limitaTexto(value.descricao, 500)}}</p>
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
                                        </div>
                                        <h6 class="unit">1 Kg</h6>
                                        <h5 class="price"><span class="theme-color"><?php if(isset($result['por'])){ echo $result['por']; }?></span> <del><?php if(isset($result['de'])){echo $result['de'];}?></del>
                                        </h5>
                                        <div class="add-to-cart-box bg-white">
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
                                        </div>
                                    </div>
                                </div>
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
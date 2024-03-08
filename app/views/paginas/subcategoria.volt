    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>{{ info_cat['subcategoria_nome'] }}</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="{{ this.url.getBaseUri() }}">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">{{ info_cat['subcategoria_nome'] }}</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Shop Section Start -->
    <section class="section-b-space shop-section">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-custome-3 wow fadeInUp">
                    <div class="left-box">
                        <div class="shop-left-sidebar">
                            <div class="back-button">
                                <h3><i class="fa-solid fa-arrow-left"></i> Back</h3>
                            </div>

                            <!-- <div class="filter-category">
                                <div class="filter-title">
                                    <h2>Filters</h2>
                                    <a href="javascript:void(0)">Clear All</a>
                                </div>
                                <ul>
                                    <li>
                                        <a href="javascript:void(0)">Vegetable</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">Fruit</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">Fresh</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">Milk</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">Meat</a>
                                    </li>
                                </ul>
                            </div> -->

                            <div class="accordion custome-accordion" id="accordionExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne" aria-expanded="true"
                                            aria-controls="collapseOne">
                                            <span>{{ info_cat['subcategoria_nome'] }}</span>
                                        </button>
                                    </h2>
                                    <div id="collapseOne" class="accordion-collapse collapse show"
                                        aria-labelledby="panelsStayOpen-headingOne">
                                        <div class="accordion-body">
                                            <div class="form-floating theme-form-floating-2 search-box">
                                                <input type="search" class="form-control" id="search"
                                                    placeholder="Busca ...">
                                                <label for="search">Busca</label>
                                            </div> 
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

                                <!-- <div class="accordion-item">
                                    <h2 class="accordion-header" id="panelsStayOpen-headingSix">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseSix"
                                            aria-expanded="false" aria-controls="collapseSix">
                                            <span>Rating</span>
                                        </button>
                                    </h2>
                                    <div id="collapseSix" class="accordion-collapse collapse show"
                                        aria-labelledby="panelsStayOpen-headingSix">
                                        <div class="accordion-body">
                                            <ul class="category-list custom-padding">
                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox">
                                                        <div class="form-check-label">
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
                                                            <span class="text-content">(5 Star)</span>
                                                        </div>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox">
                                                        <div class="form-check-label">
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
                                                            <span class="text-content">(4 Star)</span>
                                                        </div>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox">
                                                        <div class="form-check-label">
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
                                                            <span class="text-content">(3 Star)</span>
                                                        </div>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox">
                                                        <div class="form-check-label">
                                                            <ul class="rating">
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
                                                                <li>
                                                                    <i data-feather="star"></i>
                                                                </li>
                                                            </ul>
                                                            <span class="text-content">(2 Star)</span>
                                                        </div>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox">
                                                        <div class="form-check-label">
                                                            <ul class="rating">
                                                                <li>
                                                                    <i data-feather="star" class="fill"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star"></i>
                                                                </li>
                                                            </ul>
                                                            <span class="text-content">(1 Star)</span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="panelsStayOpen-headingFour">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseFour"
                                            aria-expanded="false" aria-controls="collapseFour">
                                            <span>Discount</span>
                                        </button>
                                    </h2>
                                    <div id="collapseFour" class="accordion-collapse collapse show"
                                        aria-labelledby="panelsStayOpen-headingFour">
                                        <div class="accordion-body">
                                            <ul class="category-list custom-padding">
                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault">
                                                        <label class="form-check-label" for="flexCheckDefault">
                                                            <span class="name">upto 5%</span>
                                                            <span class="number">(06)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault1">
                                                        <label class="form-check-label" for="flexCheckDefault1">
                                                            <span class="name">5% - 10%</span>
                                                            <span class="number">(08)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault2">
                                                        <label class="form-check-label" for="flexCheckDefault2">
                                                            <span class="name">10% - 15%</span>
                                                            <span class="number">(10)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault3">
                                                        <label class="form-check-label" for="flexCheckDefault3">
                                                            <span class="name">15% - 25%</span>
                                                            <span class="number">(14)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault4">
                                                        <label class="form-check-label" for="flexCheckDefault4">
                                                            <span class="name">More than 25%</span>
                                                            <span class="number">(13)</span>
                                                        </label>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="panelsStayOpen-headingFive">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseFive"
                                            aria-expanded="false" aria-controls="collapseFive">
                                            <span>Pack Size</span>
                                        </button>
                                    </h2>
                                    <div id="collapseFive" class="accordion-collapse collapse show"
                                        aria-labelledby="panelsStayOpen-headingFive">
                                        <div class="accordion-body">
                                            <ul class="category-list custom-padding custom-height">
                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault5">
                                                        <label class="form-check-label" for="flexCheckDefault5">
                                                            <span class="name">400 to 500 g</span>
                                                            <span class="number">(05)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault6">
                                                        <label class="form-check-label" for="flexCheckDefault6">
                                                            <span class="name">500 to 700 g</span>
                                                            <span class="number">(02)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault7">
                                                        <label class="form-check-label" for="flexCheckDefault7">
                                                            <span class="name">700 to 1 kg</span>
                                                            <span class="number">(04)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault8">
                                                        <label class="form-check-label" for="flexCheckDefault8">
                                                            <span class="name">120 - 150 g each Vacuum 2 pcs</span>
                                                            <span class="number">(06)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault9">
                                                        <label class="form-check-label" for="flexCheckDefault9">
                                                            <span class="name">1 pc</span>
                                                            <span class="number">(09)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault10">
                                                        <label class="form-check-label" for="flexCheckDefault10">
                                                            <span class="name">1 to 1.2 kg</span>
                                                            <span class="number">(06)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault11">
                                                        <label class="form-check-label" for="flexCheckDefault11">
                                                            <span class="name">2 x 24 pcs Multipack</span>
                                                            <span class="number">(03)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault12">
                                                        <label class="form-check-label" for="flexCheckDefault12">
                                                            <span class="name">2x6 pcs Multipack</span>
                                                            <span class="number">(04)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault13">
                                                        <label class="form-check-label" for="flexCheckDefault13">
                                                            <span class="name">4x6 pcs Multipack</span>
                                                            <span class="number">(05)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault14">
                                                        <label class="form-check-label" for="flexCheckDefault14">
                                                            <span class="name">5x6 pcs Multipack</span>
                                                            <span class="number">(09)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault15">
                                                        <label class="form-check-label" for="flexCheckDefault15">
                                                            <span class="name">Combo 2 Items</span>
                                                            <span class="number">(10)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault16">
                                                        <label class="form-check-label" for="flexCheckDefault16">
                                                            <span class="name">Combo 3 Items</span>
                                                            <span class="number">(14)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault17">
                                                        <label class="form-check-label" for="flexCheckDefault17">
                                                            <span class="name">2 pcs</span>
                                                            <span class="number">(19)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault18">
                                                        <label class="form-check-label" for="flexCheckDefault18">
                                                            <span class="name">3 pcs</span>
                                                            <span class="number">(14)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault19">
                                                        <label class="form-check-label" for="flexCheckDefault19">
                                                            <span class="name">2 pcs Vacuum (140 g to 180 g each
                                                                )</span>
                                                            <span class="number">(13)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault20">
                                                        <label class="form-check-label" for="flexCheckDefault20">
                                                            <span class="name">4 pcs</span>
                                                            <span class="number">(18)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault21">
                                                        <label class="form-check-label" for="flexCheckDefault21">
                                                            <span class="name">4 pcs Vacuum (140 g to 180 g each
                                                                )</span>
                                                            <span class="number">(07)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault22">
                                                        <label class="form-check-label" for="flexCheckDefault22">
                                                            <span class="name">6 pcs</span>
                                                            <span class="number">(09)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault23">
                                                        <label class="form-check-label" for="flexCheckDefault23">
                                                            <span class="name">6 pcs carton</span>
                                                            <span class="number">(11)</span>
                                                        </label>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">
                                                        <input class="checkbox_animated" type="checkbox"
                                                            id="flexCheckDefault24">
                                                        <label class="form-check-label" for="flexCheckDefault24">
                                                            <span class="name">6 pcs Pouch</span>
                                                            <span class="number">(16)</span>
                                                        </label>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-custome-9 wow fadeInUp">
                    <div class="show-button">
                        <div class="filter-button-group mt-0">
                            <div class="filter-button d-inline-block d-lg-none">
                                <a><i class="fa-solid fa-filter"></i> Filtro Menu</a>
                            </div>
                        </div>

                        <div class="top-filter-menu">
                            <div class="category-dropdown">
                                <h5 class="text-content">Ordenar por :</h5>
                                <div class="dropdown">
                                    <form id="dropdownMenuButton1" action="{{produto_url}}" method='POST' class="dropdown-toggle">
                                        <select id="dropdownMenuButton1" name='ordenar' class="nice-select dropdown-item" onchange="this.form.submit()">
                                            <option value="position:asc" <?= (isset($_POST['ordenar']) and $_POST['ordenar'] == 'position:asc' ) ? 'selected="selected"' : '' ?>>Ordenar por</option>
                                            <option value="price:asc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'price:asc') ? 'selected="selected"' : '' ?>>Menor Valor</option>
                                            <option value="price:desc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'price:desc') ? 'selected="selected"' : '' ?>>Maior Valor</option>
                                            <option value="name:asc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'name:asc') ? 'selected="selected"' : '' ?>>Produtos A a Z</option>
                                            <option value="name:desc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'name:desc') ? 'selected="selected"' : '' ?>>Produtos Z a A</option>
                                        </select>
                                    </form>
                                </div>
                            </div>

                            {# <div class="grid-option d-none d-md-block">
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
                            </div> #}
                        </div>
                    </div>

                    <div class="row g-8">
                        <?php foreach($page->items as $key => $value){ ?>
                            <div class="col-xxl-3 col-lg-3 col-md-4 col-6 wow fadeInUp" data-price="{{ this.app.transform(value.variacoes[0]['valor']) }}">
                                <div class="product-box-4">
                                     <?php if(empty($page->items)){ ?>
                                        <div class="product-header">
                                            NENHUM PRODUTO DISPONÍVEL NESTA SUBCATEGORIA
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
                                                        if($result['por'] !== "")
                                                            echo $result['por'];
                                                    }?>
                                                </span>
                                                <del>
                                                    <?php if(isset($result['de'])){ 
                                                        if($result['de'] !== "")
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
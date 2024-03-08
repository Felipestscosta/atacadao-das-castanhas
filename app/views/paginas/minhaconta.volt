    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>Painel do Usuário</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="{{this.url.getBaseUri()}}">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Painel do Usuário</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- User Dashboard Section Start -->
    <section class="user-dashboard-section section-b-space">
        <div class="container-fluid-lg">
            <?php 
                $url = explode('/',$_SERVER['SCRIPT_URI']);
                $posicao = (isset($url[6])) ? $url[6] : 'top-home';  
            ?>
            <div class="row">
                <div class="col-xxl-3 col-lg-4">
                    <div class="dashboard-left-sidebar">
                        <div class="close-button d-flex d-lg-none">
                            <button class="close-sidebar">
                                <i class="fa-solid fa-xmark"></i>
                            </button>
                        </div>
                        <div class="profile-box">
                            <div class="cover-image">
                                <img src="{{this.url.getBaseUri()}}assets/images/inner-page/cover-img.jpg" class="img-fluid blur-up lazyload"
                                    alt="">
                            </div>
                            
                            <div class="profile-contain">
                                <div class="profile-image">
                                    <div class="position-relative">
                                    
                                    <?php if (empty($dados_cliente->sexo['M'])): ?>
                                        <img src="{{this.url.getBaseUri()}}images/avatar-1.png"
                                            class="blur-up lazyload update_img" alt="">
                                    <?php else:?>                                   
                                        <img src="{{this.url.getBaseUri()}}assets/images/avatar-2.png"
                                            class="blur-up lazyload update_img" alt="">
                                    <?php endif;?>
                                      
                                        <div class="cover-icon">
                                            <i class="fa-solid fa-pen">
                                                <input type="file" onchange="readURL(this,0)">
                                            </i>
                                        </div>
                                    </div>
                                </div>

                                <div class="profile-name">
                                    <h3>{{dados_cliente.nome}} {{dados_cliente.sobrenome}}</h3>
                                    <h6 class="text-content">{{dados_cliente.email}}</h6>
                                </div>
                            </div>
                        </div>

                        <ul class="nav nav-pills user-nav-pills" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-dashboard-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-dashboard" type="button" role="tab"
                                    aria-controls="pills-dashboard" aria-selected="true"><i data-feather="home"></i>
                                    DashBoard</button>
                            </li>

                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="pills-order-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-order" type="button" role="tab" aria-controls="pills-order"
                                    aria-selected="false"><i data-feather="shopping-bag"></i>Pedidos</button>
                            </li>

                            <!-- <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-wishlist-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-wishlist" type="button" role="tab"
                                    aria-controls="pills-wishlist" aria-selected="false"><i data-feather="heart"></i>
                                    Wishlist</button>
                            </li> -->

                            <!-- <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-card-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-card" type="button" role="tab" aria-controls="pills-card"
                                    aria-selected="false"><i data-feather="credit-card"></i> Cartões salvos</button>
                            </li> -->

                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-address-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-address" type="button" role="tab"
                                    aria-controls="pills-address" aria-selected="false"><i data-feather="map-pin"></i>
                                    Endereço</button>
                            </li>

                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-profile" type="button" role="tab"
                                    aria-controls="pills-profile" aria-selected="false"><i data-feather="user"></i>
                                    Meus Dados
                                </button>
                            </li>

                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-security-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-security" type="button" role="tab"
                                    aria-controls="pills-security" aria-selected="false"><i data-feather="shield"></i>
                                    Alterar Senha</button>
                            </li>

                            <li class="nav-item" role="presentation">
                                <a class="nav-link" href="{{ this.url.getBaseUri() }}paginas/logoutuser" aria-controls="pills-profile" aria-selected="false"><i data-feather="user"></i>
                                    Sair da Conta</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-xxl-9 col-lg-8">
                    <button class="btn left-dashboard-show btn-animation btn-md fw-bold d-block mb-4 d-lg-none">Menu</button>
                    <div class="dashboard-right-sidebar">
                        <div class="tab-content" id="pills-tabContent" >
                            <div class="tab-pane fade show" id="pills-dashboard" role="tabpanel"
                                aria-labelledby="pills-dashboard-tab">
                                <div class="dashboard-home">
                                    <div class="title">
                                        <h2>Minha Dashboard</h2>
                                        <span class="title-leaf">
                                            <svg class="icon-width bg-gray">
                                                <use xlink:href="{{this.url.getBaseUri()}}assets/svg/leaf.svg#leaf"></use>
                                            </svg>
                                        </span>
                                    </div>

                                    <div class="dashboard-user-name">
                                        <h6 class="text-content">Olá, <b class="text-title">{{dados_cliente.nome}} {{dados_cliente.sobrenome}}</b></h6>
                                        <p class="text-content">No painel Minha conta, você pode
                                            visualizar sua atividade recente da sua conta e atualizar seus dados e
                                            informações. <br>Selecione um link abaixo para visualizar ou editar informações.</p>
                                    </div>

                                    <div class="total-box">
                                   
                                        <div class="row g-sm-4 g-3">
                                            <div class="col-xxl-4 col-lg-6 col-md-4 col-sm-6">
                                                <div class="totle-contain">
                                                    <img src="{{this.url.getBaseUri()}}assets/images/svg/order.svg"
                                                        class="img-1 blur-up lazyload" alt="">
                                                    <img src="{{this.url.getBaseUri()}}assets/images/svg/order.svg" class="blur-up lazyload"
                                                        alt="">
                                                    <div class="totle-detail">
                                                        <h5>Nome do Cliente</h5>
                                                        <h3>{{dados_cliente.nome}}</h3>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xxl-4 col-lg-6 col-md-4 col-sm-6">
                                                <div class="totle-contain">
                                                    <img src="{{this.url.getBaseUri()}}assets/images/svg/pending.svg"
                                                        class="img-1 blur-up lazyload" alt="">
                                                    <img src="{{this.url.getBaseUri()}}assets/images/svg/pending.svg" class="blur-up lazyload"
                                                        alt="">
                                                    <div class="totle-detail">
                                                        <h5>E-mail de Envio</h5>
                                                        <h3 style="font-size: 12px;">{{dados_cliente.email}}</h3>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xxl-4 col-lg-6 col-md-4 col-sm-6">
                                                <div class="totle-contain">
                                                    <img src="{{this.url.getBaseUri()}}assets/images/svg/wishlist.svg"
                                                        class="img-1 blur-up lazyload" alt="">
                                                    <img src="{{this.url.getBaseUri()}}assets/images/svg/wishlist.svg"
                                                        class="blur-up lazyload" alt="">
                                                    <div class="totle-detail">
                                                        <h5>Total de Pedidos</h5>
                                                        <h5><?php echo count($dados_cliente->_id)?></h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    

                                    <div class="dashboard-title">
                                        <h3>Informações da Conta</h3>
                                    </div>

                                    <div class="row g-4">
                                        <div class="col-xxl-6">
                                            <div class="dashboard-contant-title">
                                                <h4>Usuário 
                                                    <!-- <a href="javascript:void(0)"
                                                        data-bs-toggle="modal" data-bs-target="#editProfile">Edit</a> -->
                                                </h4>
                                            </div>
                                            <div class="dashboard-detail">
                                                <h6 class="text-content">{{dados_cliente.nome}} {{dados_cliente.sobrenome}}</h6>
                                                <!-- <h6 class="text-content">{{dados_cliente.email}}</h6> -->
                                                <!-- <a href="javascript:void(0)">Change Password</a> -->
                                            </div>
                                        </div>

                                        <div class="col-xxl-6">
                                            <div class="dashboard-contant-title">
                                                <h4>E-mail <a href="javascript:void(0)" data-bs-toggle="modal"
                                                        data-bs-target="#editProfile">Editar</a></h4>
                                            </div>
                                            <div class="dashboard-detail">
                                                <!-- <h6 class="text-content">You are currently not subscribed to any
                                                    newsletter</h6> -->
                                                <h6 class="text-content">{{dados_cliente.email}}</h6>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="dashboard-contant-title">
                                                <h4>Endereço de Entrega 
                                                    <a href="javascript:void(0)" data-bs-toggle="modal"
                                                        data-bs-target="#editProfile">Editar</a>
                                                </h4>
                                            </div>

                                            <div class="row g-4">
                                                <div class="col-xxl-6">
                                                    <div class="dashboard-detail">
                                                        <h6 class="text-content">{{dados_cliente.endereco ~ ', ' ~ dados_cliente.numero}}</h6>
                                                        <h6 class="text-content">{{dados_cliente.bairro ~ ' ' ~ dados_cliente.cep}}</h6>
                                                        <!-- <a href="javascript:void(0)" data-bs-toggle="modal"
                                                            data-bs-target="#editProfile">Editar Endereço</a> -->
                                                    </div>
                                                </div>

                                                <div class="col-xxl-6">
                                                    <div class="dashboard-detail">
                                                        <h6>{{dados_cliente.referencia}}</h6>
                                                        <h6>{{dados_cliente.cidade ~ ' ' ~ dados_cliente.estado}}</h6>
                                                        <!-- <a href="javascript:void(0)" data-bs-toggle="modal"
                                                            data-bs-target="#editProfile">Edit Address</a> -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade show active" id="pills-order" role="tabpanel"
                            aria-labelledby="pills-order-tab">
                                <div class="dashboard-order">
                                    <div class="title">
                                        <h2>Meus Pedidos</h2>
                                        <span class="title-leaf title-leaf-gray">
                                            <svg class="icon-width bg-gray">
                                                <use xlink:href="{{this.url.getBaseUri()}}assets/svg/leaf.svg#leaf"></use>
                                            </svg>
                                        </span>
                                    </div>
                                     
                                    <!-- inicio -->
                                    
                                    <div class="accordion accordion-flush custom-accordion"
                                    id="accordionFlushExample">
                                    <?php foreach ($minhascompras as $key => $value) { ?>
                                        <div class="accordion-item">
                                            <div class="accordion-header" id="flush-headingFour">
                                                <div class="accordion-button collapsed"
                                                    data-bs-toggle="collapse"
                                                    data-bs-target="#flush-collapseFour{{key}}">
                                                    <div class="custom-form-check form-check mb-0">
                                                        <label class="form-check-label" for="cash"><input
                                                                class="form-check-input mt-0" type="radio"
                                                                name="flexRadioDefault" id="cash" checked> Compra realizada em {{ date('d/m/Y', strtotime(value.created_at)) }} - <strong>Status:</strong> <span style="background: var(--theme-color2);    font-size: 12px;
                                                                font-weight: 400;
                                                                color: #fff;
                                                                background: -webkit-gradient(linear, right top, left top, from(#ff6b6b), to(#ff4f4f));
                                                                background: linear-gradient(-90deg, #ff6b6b 0%, #ff4f4f 100%);
                                                                padding: 4px 6px;
                                                                border-radius: 4px;
                                                                margin-left: calc(9px + (20 - 9) * ((100vw - 320px) / (1920 - 320)));
                                                                font-weight: 600;">{{ value.status is not empty ? value.status : '' }}</span></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="flush-collapseFour{{key}}"
                                                class="accordion-collapse collapse"
                                                data-bs-parent="#accordionFlushExample">
                                                <div class="accordion-body">
                                                    <div class="table-responsive dashboard-bg-box">
                                                        <table class="table product-table">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">Imagens</th>
                                                                    <th scope="col">Nome</th>
                                                                    <th scope="col">Frete</th>
                                                                    <th scope="col">Quantidade</th>
                                                                    <th scope="col">Preço</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <?php
                                                                    unset($minhascompras[$key]->itens['cart_total']);
                                                                    unset($minhascompras[$key]->itens['total_items']);
                                                                    foreach($minhascompras[$key]->itens as $valores) {                                          
                                                                ?>
                                                                <tr>
                                                                    <td class="product-image">
                                                                        <img src="{{link_imagens ~ valores.imagem[0]}}" class="img-fluid" alt="">
                                                                    </td>
                                                                    <td>
                                                                        <h6 style="text-align: left;"><?= $valores['name'];?></h6>
                                                                    </td>
                                                                    <td>
                                                                        <h6>R$ {{ value.frete }}</h6>
                                                                    </td>
                                                                    <td>
                                                                        <h6><?= $valores['qty']?></h6>
                                                                    </td>
                                                                    <td>
                                                                        <h6 class="theme-color fw-bold">R$ <?= number_format($valores['price'], 2, ",", ".")?></h6>
                                                                    </td>
                                                                </tr>
                                                                <?php }?>
                                                            </tbody>
                                                            <thead>
                                                                <tr>
                                                                    <th>Valor Total</th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th>R$ <?= number_format($value->valor_total,2, ',', '.') ?></th>
                                                                </tr>
                                                            </thead>
                                                        </table>                
                                                    </div>

                                                </div>
                                            </div>
                                        </div>                                        
                                        <?php }?>
                                    </div>
                                    
                                 <!-- fim -->

                                </div>
                            </div>

                            <div class="tab-pane fade show" id="pills-address" role="tabpanel"
                                aria-labelledby="pills-address-tab">
                                <div class="dashboard-address">
                                    <div class="title title-flex">
                                        <div>
                                            <h2>Meu Endereço de Entrega</h2>
                                            <span class="title-leaf">
                                                <svg class="icon-width bg-gray">
                                                    <use xlink:href="{{this.url.getBaseUri()}}assets/svg/leaf.svg#leaf"></use>
                                                </svg>
                                            </span>
                                        </div>

                                        <!-- <button class="btn theme-bg-color text-white btn-sm fw-bold mt-lg-0 mt-3"
                                            data-bs-toggle="modal" data-bs-target="#add-address"><i data-feather="plus"
                                                class="me-2"></i> Adicionar novo endereço</button> -->
                                    </div>

                                    
                                    <div class="row g-sm-4 g-3">
                                        
                                        <div class="col-xxl-4 col-xl-6 col-lg-12 col-md-6">
                                            <div class="address-box">
                                                <div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="{{dados_cliente.nome}}"
                                                            id="flexRadioDefault2" checked>
                                                    </div>

                                                    <div class="label">
                                                        <label>Principal</label>
                                                    </div>

                                                    <div class="table-responsive address-table">
                                                        <table class="table">
                                                            <tbody>
                                                                <tr>
                                                                    <td colspan="2">{{dados_cliente.nome}}</td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Endereço :</td>
                                                                    <td>
                                                                        <p>{{dados_cliente.endereco ~ ', ' ~ dados_cliente.numero}}</p>
                                                                        <p>{{dados_cliente.bairro ~ ', ' ~ dados_cliente.referencia}}</p>
                                                                        <p>{{dados_cliente.cidade ~ ', ' ~ dados_cliente.estado}}</p>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Cep :</td>
                                                                    <td>{{dados_cliente.cep}}</td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Celular :</td>
                                                                    <td>{{dados_cliente.celular}}</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                                <div class="button-group">
                                                    <button class="btn btn-sm add-button w-100" data-bs-toggle="modal"
                                                        data-bs-target="#editProfile"><i data-feather="edit"></i>
                                                        Editar</button>
                                                    <!-- <button class="btn btn-sm add-button w-100" data-bs-toggle="modal"
                                                        data-bs-target="#removeProfile"><i data-feather="trash-2"></i>
                                                        Remover</button> -->
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        
                                    </div>
                                         
                                </div>
                            </div>
<!-- 
                            <div class="tab-pane fade show" id="pills-card" role="tabpanel"
                                aria-labelledby="pills-card-tab">
                                <div class="dashboard-card">
                                    <div class="title title-flex">
                                        <div>
                                            <h2>My Card Details</h2>
                                            <span class="title-leaf">
                                                <svg class="icon-width bg-gray">
                                                    <use xlink:href="{{this.url.getBaseUri()}}assets/svg/leaf.svg#leaf"></use>
                                                </svg>
                                            </span>
                                        </div>

                                        <button class="btn theme-bg-color text-white btn-sm fw-bold mt-lg-0 mt-3"
                                            data-bs-toggle="modal" data-bs-target="#editCard"><i data-feather="plus"
                                                class="me-2"></i> Add New Card</button>
                                    </div>

                                    <div class="row g-4">
                                        <div class="col-xxl-4 col-xl-6 col-lg-12 col-sm-6">
                                            <div class="payment-card-detail">
                                                <div class="card-details">
                                                    <div class="card-number">
                                                        <h4>XXXX - XXXX - XXXX - 2548</h4>
                                                    </div>

                                                    <div class="valid-detail">
                                                        <div class="title">
                                                            <span>valid</span>
                                                            <span>thru</span>
                                                        </div>
                                                        <div class="date">
                                                            <h3>08/05</h3>
                                                        </div>
                                                        <div class="primary">
                                                            <span class="badge bg-pill badge-light">primary</span>
                                                        </div>
                                                    </div>

                                                    <div class="name-detail">
                                                        <div class="name">
                                                            <h5>Audrey Carol</h5>
                                                        </div>
                                                        <div class="card-img">
                                                            <img src="{{this.url.getBaseUri()}}assets/images/payment-icon/1.jpg"
                                                                class="img-fluid blur-up lazyloaded" alt="">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="edit-card">
                                                    <a data-bs-toggle="modal" data-bs-target="#editCard"
                                                        href="javascript:void(0)"><i class="far fa-edit"></i> edit</a>
                                                    <a href="javascript:void(0)" data-bs-toggle="modal"
                                                        data-bs-target="#removeProfile"><i
                                                            class="far fa-minus-square"></i> delete</a>
                                                </div>
                                            </div>

                                            <div class="edit-card-mobile">
                                                <a data-bs-toggle="modal" data-bs-target="#editCard"
                                                    href="javascript:void(0)"><i class="far fa-edit"></i> edit</a>
                                                <a href="javascript:void(0)"><i class="far fa-minus-square"></i>
                                                    delete</a>
                                            </div>
                                        </div>

                                        <div class="col-xxl-4 col-xl-6 col-lg-12 col-sm-6">
                                            <div class="payment-card-detail">
                                                <div class="card-details card-visa">
                                                    <div class="card-number">
                                                        <h4>XXXX - XXXX - XXXX - 1536</h4>
                                                    </div>

                                                    <div class="valid-detail">
                                                        <div class="title">
                                                            <span>valid</span>
                                                            <span>thru</span>
                                                        </div>
                                                        <div class="date">
                                                            <h3>12/23</h3>
                                                        </div>
                                                        <div class="primary">
                                                            <span class="badge bg-pill badge-light">primary</span>
                                                        </div>
                                                    </div>

                                                    <div class="name-detail">
                                                        <div class="name">
                                                            <h5>Leah Heather</h5>
                                                        </div>
                                                        <div class="card-img">
                                                            <img src="{{this.url.getBaseUri()}}assets/images/payment-icon/2.jpg"
                                                                class="img-fluid blur-up lazyloaded" alt="">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="edit-card">
                                                    <a data-bs-toggle="modal" data-bs-target="#editCard"
                                                        href="javascript:void(0)"><i class="far fa-edit"></i> edit</a>
                                                    <a href="javascript:void(0)" data-bs-toggle="modal"
                                                        data-bs-target="#removeProfile"><i
                                                            class="far fa-minus-square"></i> delete</a>
                                                </div>
                                            </div>

                                            <div class="edit-card-mobile">
                                                <a data-bs-toggle="modal" data-bs-target="#editCard"
                                                    href="javascript:void(0)"><i class="far fa-edit"></i> edit</a>
                                                <a href="javascript:void(0)"><i class="far fa-minus-square"></i>
                                                    delete</a>
                                            </div>
                                        </div>

                                        <div class="col-xxl-4 col-xl-6 col-lg-12 col-sm-6">
                                            <div class="payment-card-detail">
                                                <div class="card-details dabit-card">
                                                    <div class="card-number">
                                                        <h4>XXXX - XXXX - XXXX - 1366</h4>
                                                    </div>

                                                    <div class="valid-detail">
                                                        <div class="title">
                                                            <span>valid</span>
                                                            <span>thru</span>
                                                        </div>
                                                        <div class="date">
                                                            <h3>05/21</h3>
                                                        </div>
                                                        <div class="primary">
                                                            <span class="badge bg-pill badge-light">primary</span>
                                                        </div>
                                                    </div>

                                                    <div class="name-detail">
                                                        <div class="name">
                                                            <h5>mark jecno</h5>
                                                        </div>
                                                        <div class="card-img">
                                                            <img src="{{this.url.getBaseUri()}}assets/images/payment-icon/3.jpg"
                                                                class="img-fluid blur-up lazyloaded" alt="">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="edit-card">
                                                    <a data-bs-toggle="modal" data-bs-target="#editCard"
                                                        href="javascript:void(0)"><i class="far fa-edit"></i> edit</a>
                                                    <a href="javascript:void(0)" data-bs-toggle="modal"
                                                        data-bs-target="#removeProfile"><i
                                                            class="far fa-minus-square"></i> delete</a>
                                                </div>
                                            </div>

                                            <div class="edit-card-mobile">
                                                <a data-bs-toggle="modal" data-bs-target="#editCard"
                                                    href="javascript:void(0)"><i class="far fa-edit"></i> edit</a>
                                                <a href="javascript:void(0)"><i class="far fa-minus-square"></i>
                                                    delete</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <div class="tab-pane fade show" id="pills-profile" role="tabpanel"
                                aria-labelledby="pills-profile-tab">
                                <div class="dashboard-profile">
                                    <div class="title">
                                        <h2>Meus Dados</h2>
                                        <span class="title-leaf">
                                            <svg class="icon-width bg-gray">
                                                <use xlink:href="{{this.url.getBaseUri()}}assets/svg/leaf.svg#leaf"></use>
                                            </svg>
                                        </span>
                                    </div>

                                    <div class="profile-detail dashboard-bg-box">
                                        <div class="dashboard-title">                                            
                                            <h3>{{dados_cliente.nome}}</h3>
                                        </div>
                                        <div class="profile-name-detail">
                                            <div class="d-sm-flex align-items-center d-block">
                                                <h3>{{dados_cliente.nome ~ ' ' ~ dados_cliente.sobrenome}}</h3>
                                            </div>

                                            <a href="javascript:void(0)" data-bs-toggle="modal"
                                                data-bs-target="#editProfile">Editar</a>
                                        </div>

                                        <div class="location-profile">
                                            <ul>
                                                <li>
                                                    <div class="location-box">
                                                        <i data-feather="map-pin"></i>
                                                        <h6>{{dados_cliente.endereco}}</h6>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="location-box">
                                                        <i data-feather="mail"></i>
                                                        <h6>{{dados_cliente.email}}</h6>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="location-box">
                                                        <i data-feather="check-square"></i>
                                                        <h6>Habilitado para compra</h6>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="profile-description">
                                            <p>
                                                Faça suas compras no atacado com excelentes descontos em nossa extensa variedades de produtos.
                                            </p>
                                        </div>
                                    </div>

                                    <div class="profile-about dashboard-bg-box">
                                        <div class="row">
                                            <div class="col-xxl-7">
                                                <div class="dashboard-title mb-3">
                                                    <h3>Meu Perfil</h3>
                                                </div>

                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tbody>
                                                            <tr>
                                                                <td>Nome :</td>
                                                                <td>{{dados_cliente.nome}}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>CPF :</td>
                                                                <td>{{dados_cliente.cpf}}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Telefone :</td>
                                                                <td>
                                                                    {{dados_cliente.celular}}
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Endereço :</td>
                                                                <td>{{dados_cliente.endereco ~ ', ' ~ dados_cliente.numero}} <br>{{dados_cliente.cep ~ ' - ' ~ dados_cliente.bairro}} <br> {{dados_cliente.cidade ~ ' / ' ~ dados_cliente.estado}}</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="dashboard-title mb-3">
                                                    <h3>Dados de Login</h3>
                                                </div>

                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tbody>
                                                            <tr>
                                                                <td>Login :</td>
                                                                <td>
                                                                    <a href="javascript:void(0)">{{dados_cliente.email}}
                                                                        <span data-bs-toggle="modal"
                                                                            data-bs-target="#editProfile">Editar</span></a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Senha :</td>
                                                                <td>
                                                                    <a href="javascript:void(0)">●●●●●●
                                                                        <span data-bs-toggle="modal"
                                                                            data-bs-target="#editProfile">Editar</span></a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="col-xxl-5">
                                                <div class="profile-image">
                                                    <img src="{{this.url.getBaseUri()}}assets/images/inner-page/dashboard-profile.png"
                                                        class="img-fluid blur-up lazyload" alt="">
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- <div class="tab-pane fade show" id="pills-profile" role="tabpanel"
                                aria-labelledby="pills-profile-tab">
                                <div class="dashboard-profile">
                                    <div class="title">
                                        <h2>My Profile</h2>
                                        <span class="title-leaf">
                                            <svg class="icon-width bg-gray">
                                                <use xlink:href="{{this.url.getBaseUri()}}assets/svg/leaf.svg#leaf"></use>
                                            </svg>
                                        </span>
                                    </div>

                                    <div class="profile-detail dashboard-bg-box">
                                        <div class="dashboard-title">
                                            <h3>Profile Name</h3>
                                        </div>
                                        <div class="profile-name-detail">
                                            <div class="d-sm-flex align-items-center d-block">
                                                <h3>Vicki E. Pope</h3>
                                                <div class="product-rating profile-rating">
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
                                            </div>

                                            <a href="javascript:void(0)" data-bs-toggle="modal"
                                                data-bs-target="#editProfile">Edit</a>
                                        </div>

                                        <div class="location-profile">
                                            <ul>
                                                <li>
                                                    <div class="location-box">
                                                        <i data-feather="map-pin"></i>
                                                        <h6>Downers Grove, IL</h6>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="location-box">
                                                        <i data-feather="mail"></i>
                                                        <h6>vicki.pope@gmail.com</h6>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="location-box">
                                                        <i data-feather="check-square"></i>
                                                        <h6>Licensed for 2 years</h6>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="profile-description">
                                            <p>Residences can be classified by and how they are connected to
                                                neighbouring residences and land. Different types of housing tenure can
                                                be used for the same physical type.</p>
                                        </div>
                                    </div>

                                    <div class="profile-about dashboard-bg-box">
                                        <div class="row">
                                            <div class="col-xxl-7">
                                                <div class="dashboard-title mb-3">
                                                    <h3>Profile About</h3>
                                                </div>

                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tbody>
                                                            <tr>
                                                                <td>Gender :</td>
                                                                <td>Female</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Birthday :</td>
                                                                <td>21/05/1997</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Phone Number :</td>
                                                                <td>
                                                                    <a href="javascript:void(0)"> +91 846 - 547 -
                                                                        210</a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Address :</td>
                                                                <td>549 Sulphur Springs Road, Downers, IL</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="dashboard-title mb-3">
                                                    <h3>Login Details</h3>
                                                </div>

                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tbody>
                                                            <tr>
                                                                <td>E-mail :</td>
                                                                <td>
                                                                    <a href="javascript:void(0)">vicki.pope@gmail.com
                                                                        <span data-bs-toggle="modal"
                                                                            data-bs-target="#editProfile">Edit</span></a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Password :</td>
                                                                <td>
                                                                    <a href="javascript:void(0)">●●●●●●
                                                                        <span data-bs-toggle="modal"
                                                                            data-bs-target="#editProfile">Edit</span></a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="col-xxl-5">
                                                <div class="profile-image">
                                                    <img src="{{this.url.getBaseUri()}}assets/images/inner-page/dashboard-profile.png"
                                                        class="img-fluid blur-up lazyload" alt="">
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div> -->

                            <div class="tab-pane fade show" id="pills-security" role="tabpanel"
                                aria-labelledby="pills-security-tab">
                                <div class="dashboard-privacy">
                                    <form class="dashboard-bg-box" id="senha" class='senha'>
                                        <div class="dashboard-title mb-4">
                                            <h3>Alterar Senha</h3>
                                        </div>

                                        <div class="privacy-box">
                                            <div class="d-flex align-items-start">
                                                <h6>Lembre-se de anotar a senha alterada para ter acesso ao painel deste site.</h6>
                                            </div>
                                            <br>
                                            <div class="col-xxl-12">
                                                
                                                    <div class="form-floating theme-form-floating">
                                                        <input type="password" class="form-control senha" placeholder="nova senha" required name="senha">
                                                        <div class='loader'></div>
                                                        <label for="pname">Nova senha</label>
                                                    </div>
                                                
                                                
                                            </div>

                                            <input type='hidden' value='{{dados_cliente._id}}' name='id'>
                                        </div>                                        

                                        <button class="btn theme-bg-color btn-md fw-bold mt-4 text-white">Alterar Senha</button>
                                        
                                    </form>
                                    <div class='result'></div>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- User Dashboard Section End -->
    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>Carrinho</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="{{this.url.getBaseUri()}}">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Carrinho</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Cart Section Start -->
    <section class="cart-section section-b-space">
        <div class="container-fluid-lg">
            <div class="row g-sm-5 g-3">
                <div class="col-xxl-9">
                    <form class="cart-table">
                        <div class="table-responsive-xl">
                            <table class="table">
                                <!-- <thead>
                                    <tr>                                        
                                        <th class="name">Produto</th>
                                        <th class="price">Preço</th>
                                        <th class="quantity">Quantidade</th>
                                        <th class="subtotal">Total</th>
                                        <th class="remove">Ação</th>
                                    </tr>
                                </thead> -->
                                <tbody>
                                    {% if conteudo_carrinho is not empty %}
                                    {% for key, query in conteudo_carrinho %}
                                    <tr class="product-box-contain cart_item" id="carrinho_{{ query['rowId'] }}">
                                        <td class="product-detail thumbnail" id="carrinho_{{ query['rowId'] }}">
                                            <div class="product border-0">
                                                <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(query['name'])}}/{{query['id_mongo']}}" class="product-image">   
                                                    <?php if(isset($query['imagem'])):?> 
                                                    <img src="{{link_imagens ~ query['imagem']}}"
                                                        class="blur-up lazyload" alt="{{ query['name']}}" style="max-width: 70px;"> 
                                                    <?php else:?>
                                                    <img src="{{this.url.getBaseUri()}}img/nophoto.webp"
                                                        class="img-fluid blur-up lazyload" alt="{{query.nome}}" style="max-width: 70px;">
                                                    <?php endif;?> 
                                                    <br/>
                                                    {% if query['options']['cor'] is not empty %}
                                                        Cor: {{ this.app.getCor(query['options']['cor']) }}
                                                    {% endif %}       
                                                </a>
                                                <div class="product-detail">
                                                    <ul>
                                                        <li class="name" style="height: 20px;">
                                                            <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(query['name'])}}/{{query['id_mongo']}}">
                                                                <?php 	
                                                                $nomedest = mb_convert_case($query['name'], MB_CASE_LOWER, 'UTF-8');												
                                                                echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                                ?>   
                                                            </a>
                                                        </li>

                                                        <li class="text-content"><span class="text-title"></span> 
                                                        </li>

                                                        <li class="text-content"><span
                                                                class="text-title"></span> </li>

                                                        <li>
                                                            <!-- <h5 class="text-content d-inline-block">Preço :</h5> -->
                                                            <span>R$ <?= number_format($query['price'],2,',','.') ?></span>
                                                            <!-- <span class="text-content">$45.68</span> -->
                                                        </li>

                                                        <li class="quantity">
                                                            <div class="quantity-price">
                                                                <div class="cart_qty">
                                                                    <div class="input-group">
                                                                        <button type="button" class="btn qty-left-minus"
                                                                            data-type="minus" data-field="">
                                                                            <i class="fa fa-minus ms-0" aria-hidden="true"></i>
                                                                        </button>
                                                                        <input class="form-control input-number qty-input updateCartQuantidade" min="1" type="text"
                                                                            name="quantity" readonly=“true” data-estoque="{{ query['estoque'] is not empty ? query['estoque'] : '' }}" data-cat="{{ query['cat'] is not empty ? query['cat'] : '' }}" data-det="{{ query['options']['det'] is not empty ? query['options']['det'] : '' }}" data-cor="{{ query['options']['cor'] is not empty ? query['options']['cor'] : '' }}" data-tamanho="{{ query['options']['tamanho'] is not empty ? query['options']['tamanho'] : '' }}" data-price="{{ query['price'] }}" data-id="{{ query['id'] }}" data-idmongo="{{ query['id_mongo'] }}" data-rowid="{{ query['rowId'] }}" type="number" autocomplete="off" value="{{query['qty']}}" max="{{ query['estoque'] is not empty ? query['estoque'] : '' }}">
                                                                        <button type="button" class="btn qty-right-plus"
                                                                            data-type="plus" data-field="">
                                                                            <i class="fa fa-plus ms-0" aria-hidden="true"></i>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li class="subtotal">
                                                            <h5>R$ <?= number_format($query['total'],2,',','.') ?></h5>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </td>

                                        <td class="price">
                                            <!-- <h4 class="table-title text-content">Preço</h4> -->
                                            <h5>R$ <?= number_format($query['price'],2,',','.') ?> </h5>
                                        </td>

                                        <td class="quantity">
                                            <!-- <h4 class="table-title text-content">Qty</h4> -->
                                            <div class="quantity-price">
                                                <div class="cart_qty">
                                                    <div class="input-group">
                                                        <button type="button" class="btn qty-left-minus minus"
                                                            data-type="minus" data-field="">
                                                            <i class="fa fa-minus ms-0" aria-hidden="true"></i>
                                                        </button>
                                                        <input class="form-control input-number qty-input updateCartQuantidade" min="1" type="text"
                                                        name="quantity" readonly=“true” data-estoque="{{ query['estoque'] is not empty ? query['estoque'] : '' }}" data-cat="{{ query['cat'] is not empty ? query['cat'] : '' }}" data-det="{{ query['options']['det'] is not empty ? query['options']['det'] : '' }}" data-cor="{{ query['options']['cor'] is not empty ? query['options']['cor'] : '' }}" data-tamanho="{{ query['options']['tamanho'] is not empty ? query['options']['tamanho'] : '' }}" data-price="{{ query['price'] }}" data-id="{{ query['id'] }}" data-idmongo="{{ query['id_mongo'] }}" data-rowid="{{ query['rowId'] }}" type="number" autocomplete="off" value="{{query['qty']}}" max="{{ query['estoque'] is not empty ? query['estoque'] : '' }}">
                                                        <button type="button" class="btn qty-right-plus plus"
                                                            data-type="plus" data-field="">
                                                            <i class="fa fa-plus ms-0" aria-hidden="true"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <td class="subtotal">                                            
                                            <h5><span class="amount">R$ <?= number_format($query['total'],2,',','.') ?></span> </h5>
                                        </td>

                                        <td class="save-remove remove">
                                            <!-- <h4 class="table-title text-content">Ação</h4> -->
                                            <a class="remove close_button cart_quantity_delete" href="javascript:void(0)" data-id="{{ query['rowId'] }}"><i data-feather="trash-2"></i> <br> Remover</a>
                                        </td>
                                    </tr>
                                    {% endfor %}
                                    {% endif %}

                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>

                <div class="col-xxl-3">
                    <div class="summery-box p-sticky">
                        <div class="summery-header">
                            <h3>Opções de Frete</h3>
                        </div>

                        <div class="summery-contain">
                            <div class="coupon-cart">
                                <h6 class="text-content mb-2">{{ flashSession.output() }}</h6>
                                <div class="mb-3 coupon-box input-group">
                                    <input type="email" class="form-control cep" name="cep" id="zipcode" placeholder="Digite seu CEP">
                                    <button class="btn-apply">Cotar</button>
                                </div>

                                <div class="loadfrete" style="display:none;">
                                    <div class="alert alert-success" role="alert" style="background: #D4EDDA;">
                                    <font style="color:#3ECBBC; margin-top:5px; padding: 15px;"> Calculando aguarde...</font>
                                    </div>                                   
                                </div> 
                                <br clear='all'>  
                                <div id="availableCarriers" class='fretes'></div>
                            </div>
                            <ul>
                                <!-- <li>
                                    <h4>Subtotal</h4>
                                    {% if query.total is not empty %}
                                    <h4 class="price">R$ <?= number_format($query['total'],2,',','.') ?></h4>
                                    {% endif %}
                                </li>

                                <li id="descprogressivo" style="display:none;">
                                    <h5>Desconto</h5>
                                    <span id="descprog" style="color:#FF4C3B;"></span>
                                </li>

                                <li>
                                    <h4>Cupom de Desconto</h4>
                                    <h4 class="price">(-) 0.00</h4>
                                </li> -->

                                <li class="align-items-start">
                                    <h4>Frete</h4>
                                    <h4 class="price text-end" id="total_shipping">
                                        <?= ((isset($_SESSION['frete'])) && (!empty($_SESSION['frete']))) ? $_SESSION['frete'] : 'Não Selecionado';?>
                                    </h4>
                                </li>

                                <li id="frete" style="background-color: #e3e0e0;justify-content: center">
                                    
                                        <?php                                                            
                                            if(isset($notificafrete->tipofrete) && ($notificafrete->tipofrete == 'valor')){                                          
                                                if ((number_format($total_carrinho,2,'.',',')) < (number_format($notificafrete->valorminimo,2,'.',','))){
                                                    $valor =  ((number_format($notificafrete->valorminimo,2,'.',',')) - (number_format($total_carrinho,2,'.',',')));
                                                    echo '<span class="percentage" style="width: '.round($total_carrinho).'%;"></span><p data-valor-frete-gratis="'.number_format($notificafrete->valorminimo,2,',','.').'">Falta R$ '.number_format($valor,2,',','.').' para frete grátis <i class="fal fa-truck" style="margin-left: 10px;"></i></p>';               
                                                }
                                                else{
                                                    echo '<span class="percentage"></span><p data-valor-frete-gratis=".number_format($notificafrete->valorminimo,2,',','.')."><img src="https://www.atacadaodascastanhas.com.br/novo/assets/svg/delivery.svg" class="blur-up lazyloaded" alt=""><img src="https://www.atacadaodascastanhas.com.br/novo/images/fogos3.gif" width="41"/> PARABÉNS! <br>FRETE GRÁTIS ATIVO </p>';               
                                                }
                                            }
                                        ?>
                                    
                                </li>
                            </ul>
                        </div>

                        <ul class="summery-total">
                            <li class="list-total border-top-0 total">
                                <h4>Total</h4>
                                <h4 class="price theme-color" id="total_price">R$ <?= number_format($total_carrinho,2,',','.') ?></h4>
                            </li>
                        </ul>

                        <div class="button-group cart-button">
                            <ul>
                                <li>
                                    <button onclick="location.href = '{{this.url.getBaseUri()}}checkout';"
                                        class="btn btn-animation proceed-btn fw-bold">FINALIZAR COMPRA</button>
                                </li>

                                <li>
                                    <button onclick="location.href = '{{this.url.getBaseUri()}}';"
                                        class="btn btn-light shopping-button text-dark">
                                        <i class="fa-solid fa-arrow-left-long"></i>Continuar Comprando</button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Cart Section End -->
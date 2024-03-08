    <!-- Product Slider Section Start -->
    <section class="wow fadeInUp">
        <div class="container-fluid-lg" style="padding: unset !important;">
            <div class="row">
                <div class="col-12">
                    <div class="slider-3-product product-wrapper">
                        {% for item in destaques %}
                        <div>
                            <div class="product-slider-image">
                                <img src="{{ link_imagens ~ item.imagens[0] }}" alt="{{item.nome}}"
                                    class="img-fluid blur-up lazyload">
                            </div>
                            <h5 class="name">
                                <?php
                                    $nomedest = mb_convert_case($item->nome, MB_CASE_LOWER, 'UTF-8');												
                                    echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                ?>
                            </h5>
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
                        </div>
                        {% endfor %}
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Slider Section End -->
    <!--  Title/Header -->
    <div class="page-title-section section">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="page-title">                      
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ this.url.getBaseUri() }}">Home</a></li>
                            <li class="breadcrumb-item">{{ catnome }}</li>
                            <li class="breadcrumb-item">{{ subnome }}</li>
                            <li class="breadcrumb-item active">{{ info_cat['subcategoria2_nome'] }}</li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- Fim Title/Header -->

    <div class="section section-padding pt-0">
        <!-- Toolbar -->
        <div class="shop-toolbar border-bottom">
            <div class="container">
                <div class="row learts-mb-n20">
                    <div class="col-md col-12 align-self-center learts-mb-20">                   
                        <?php if($total == 0){
                            echo "Nenhum Item(s)";}
                            else if($total == 1){echo $total. " Item(s)";}
                            else{echo $total. " Item(s)";}
                        ?> 
                    </div>
                    <div class="col-md-auto col-12 learts-mb-20">
                        <ul class="shop-toolbar-controls">
                            <li>
                                <div class="product-sorting">                                
                                    <form id="productsSortForm" action="{{produto_url}}" method='POST' class="productsSortForm">
                                        <select id="selectPrductSort1" name='ordenar' class="nice-select" onchange="this.form.submit()">
                                            <option value="position:asc" <?= (isset($_POST['ordenar']) and $_POST['ordenar'] == 'position:asc' ) ? 'selected="selected"' : '' ?>>Ordenar por</option>
                                            <option value="price:asc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'price:asc') ? 'selected="selected"' : '' ?>>Menor Valor</option>
                                            <option value="price:desc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'price:desc') ? 'selected="selected"' : '' ?>>Maior Valor</option>
                                            <option value="name:asc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'name:asc') ? 'selected="selected"' : '' ?>>Produtos A a Z</option>
                                            <option value="name:desc" <?= (isset($_POST['ordenar']) != '' and $_POST['ordenar'] == 'name:desc') ? 'selected="selected"' : '' ?>>Produtos Z a A</option>
                                        </select>
                                    </form>
                                </div>
                            </li>
                            <li>
                                <div class="product-column-toggle d-none d-xl-flex">
                                    <button class="toggle hintT-top" data-hint="5 Colunas" data-column="5"><i class="ti-layout-grid4-alt"></i></button>
                                    <button class="toggle hintT-top" data-hint="4 Colunas" data-column="4"><i class="ti-layout-grid3-alt"></i></button>
                                    <button class="toggle active hintT-top" data-hint="3 Colunas" data-column="3"><i class="ti-layout-grid2-alt"></i></button>
                                </div>
                            </li>   
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fim Toolbar -->    

        <div class="section learts-mt-70">
            <div class="container">
                <div class="row learts-mb-n50">
                    <div class="col-lg-9 col-12 learts-mb-50 order-lg-2">                       
                        <?php if(empty($page->items)){ ?>    
                            <div class="section-title2 text-center">
                                <h2 class="title">DESCULPE</h2>
                                <p>AINDA NÃO HÁ PRODUTOS DISPONÍVEIS NESSA CATEGORIA.</p>
                                <p><i class="far fa-frown" style="font-size: 3em; color:#000;"></i></p>
                            </div>
                            <?php }else{ ?> 
                        <div id="shop-products" class="products row row-cols-xl-3 row-cols-md-3 row-cols-sm-2 row-cols-1"> 
                                <?php foreach($page->items as $key => $value){?>
                                <div class="grid-item col" data-price="{{ this.app.transform(value.variacoes[0]['valor']) }}">
                                    <?php 
                                        $existedesc = (isset($value->variacoes[0]['desconto'])) ? $value->variacoes[0]['desconto'] : '';
                                        $result = $this->app->verificaDesconto($value->variacoes[0]['valor'],$value->categoria,$existedesc);                           
                                    ?> 
                                    <div class="product">
                                        <div class="product-thumb">
                                            <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}" class="image">                                            
                                                <?php if(isset($value->imagens[0])):?>
                                                <img src="<?= $this->app->getImageThumb($value->imagens[0],array('w'=>328,'h'=> 328,'zc'=> 2))?>" alt="Product Image">
                                                <?php else:?>
                                                <img src="{{this.url.getBaseUri()}}img/nophoto.jpg" class="js-prd-img">
                                                <?php endif;?> 
                    
                                                <?php if((isset($value->imagens[1])) && (!empty($value->imagens[1]))):?>
                                                <img class="image-hover" src="<?= $this->app->getImageThumb($value->imagens[1],array('w'=>328,'h'=> 437,'zc'=> 2))?>" alt="Product Image">                          
                                                <?php endif;?> 
                                            </a>                                           
                                        </div>
                                        
                                        <div class="product-info">
                                            <h6 class="title"><a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
                                                <?php 	
                                                $nomedest = mb_convert_case($value->nome, MB_CASE_LOWER, 'UTF-8');												
                                                echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                ?>      
                                            </a></h6>                      
                                            <span class="price">
                                                <span class="old"> <?php if(isset($result['de'])){echo $result['de'];}?></span>
                                            <span class="new"> <?php if(isset($result['por'])){ echo $result['por']; }?></span>
                                            </span>
                                            <div class="product-buttons">
                                                <?php  if((count($value->variacoes == 1)) && ($value->variacoes[0]['estoque'] <= 0)){?>
                                                <a href="#" class="btn btn--add-to-cart" style="background: #ffc427;"><i class="icon-sad-face"></i> INDISPONÍVEL</a>
                                                <?php }else{?> 
                                                <a href="#quickViewModal" data-id="{{value._id}}" data-key="#quickViewModal" data-toggle="modal" class="product-button hintT-top testamodal" data-hint="Visualizar"><i class="fal fa-search"></i></a>
                                                <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}" class="product-button hintT-top" data-hint="Adicionar"><i class="fal fa-shopping-cart"></i></a>
                                                <a href="#" class="product-button hintT-top compare" data-produto="{{ value._id }}" data-hint="Comparar"><i class="fal fa-random"></i></a>
                                                <?php }?>
                                            </div>
                    
                                            <div class="rating-shelf-container">
                                                <div>
                                                    {{ this.app.calculaEstrela(value._id,'',1) }}
                                                </div>
                                            </div>                    
                                            <!-- <p class="maxdesc">{{ this.app.parcelamentosMaxCielo(result['por']) }}</p>                                        -->
                                        </div>
                                    </div>
                                </div>
                                <?php }?>                            
                        </div>                      
                        <div class="text-center learts-mt-70">                          
                            <?php 
                            $server = $_SERVER['SERVER_NAME'];
                            $endereco = $_SERVER ['REQUEST_URI'];
                            $url = "http://" . $server . $endereco;                         
                            $r = explode('&page=', $url);
                            $urlatual = $r[0].'&page='; 
                            $url = $urlatual; 
                            $number = ($page->total_pages > 4) ? 5 : $page->total_pages;

                            if ($page->total_pages > 1): ?>
                            <ul class="pagination">
                            <li class="<?= ($page->before == $page->current) ? 'disabled' : '' ?>">
                                <a href="<?php echo $urlatual;?><?= $page->before; ?>" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a>
                            </li> 
                            <?php
                            if ($page->current > 2 && $page->total_pages > 4 && $page->last > ($page->current + 2)) {
                                for($i = $page->current; $i < ($page->current + 5); $i++) {
                                    $j = $i - 2;
                                    $active = ($page->current == $j) ? ' class="active"' : '';
                                    echo '<li' . $active . '><a href="'.($url.$j).'">'.$j.'</a></li>';
                                }
                            }
                            elseif ($page->current > 2 && $page->total_pages > 4 && $page->last < ($page->total_pages + 2)) {
                                for($i = ($page->total_pages - 4); $i < ($page->total_pages + 1); $i++) {
                                    $j = $i - 2;
                                    $active = ($page->current == $i) ? ' class="active"' : '';
                                    echo '<li' . $active . '><a href="'.($url.$i).'">'.$i.'</a></li>';
                                }
                            }
                            else {
                                for($i = 1; $i < ($number + 1); $i++) {
                                    $active = ($page->current == $i) ? ' class="active"' : '';
                                    echo '<li' . $active . '><a href="'.($url.$i). '">' . $i . '</a></li>';
                                }
                            }
                        ?>
                            <li class="<?= ($page->last == $page->current) ? 'disabled' : '' ?>"> 
                                <a href="<?= ($url.$page->next); ?>" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> 
                            </li>                            
                            </ul>
                            <?php endif ?>
                        </div>
                        <?php }?>
                    </div>

                    <div class="col-lg-3 col-12 learts-mb-10 order-lg-1">
                        <!-- Inicio Busca Lateral -->
                        <div class="single-widget learts-mb-40">
                            <div class="widget-search">   
                                <form method='GET' action="{{ this.url.getBaseUri() }}paginas/busca">
                                    <input type="text" placeholder="Buscar..." name="busca">
                                    <button><i class="fal fa-search"></i></button>
                                </form>
                            </div>
                        </div>
                        <!-- Fim Busca Lateral -->
                       
                        <form id="filtramarca" method="GET" class="paddingbt80"> 
                         <!-- Inicio Categorias -->     
                        <div class="single-widget learts-mb-40">                          
                            <h3 class="widget-title product-filter-widget-title"><?= $subnome?></h3>
                            <ul class="widget-list">                                      
                                <?php
                                    $teste = $this->app->getSub2($subid);						
                                    foreach($teste as $key => $value){  
                                ?>
                                <li>
                                    <a <?php if((isset($subid)) && ($value->_id == $subid)) {echo "style=color:#B2C337;font-weight:bold;";}?> href="{{this.url.getBaseUri()}}subcategoria2/{{this.app.toURI(value.subcategoria2_nome)}}/{{value._id}}" class="title"><?= $value->subcategoria2_nome;?>
                                        (<?php echo count($this->app->getCountProd($value->_id))?>)
                                    </a>                                    
                                </li>
                                <?php }?>                                  
                            </ul>                                 
                        </div>
                        <!-- Fim Categorias -->
                       
                        <!-- Inicio Filtro Marcas -->
                        <?php if(!empty($dados_busca['marca'])){?>   
                        <div class="single-widget learts-mb-40">
                            <h3 class="widget-title product-filter-widget-title">Marcas</h3>                           
                                <div class="form-check">                                          
                                    {% for query in dados_busca['marca'] %}
                                    <?php if(isset($query['marca'][0])){?>                                                      
                                        <input type="checkbox" class="form-check-input" id="{{ this.app.getMarca(query['marca'][0]) }}" data-url="{{produto_url}}"
                                            name="buscamarca[]" value="{{query['marca'][0]}}" <?php if(isset($_GET['buscamarca'])){ $checkboxes= $_GET['buscamarca']; $count= count($checkboxes);
                                            for ($i=0;$i<$count;$i++){ if($query[ 'marca'][0]== $checkboxes[$i]){echo "checked";}else{echo "";} } }?>>
                                        <label class="form-check-label" for="{{ this.app.getMarca(query['marca'][0]) }}">{{ this.app.getMarca(query['marca'][0]) }}</label>
                                    <?php }?> {% endfor %}                                               
                                </div> 
                        </div>
                        <?php }?> 
                        <!-- Fim Filtro Marcas -->
                      </form>

                         <!-- Inicio Filtro por preço -->
                        <div class="single-widget learts-mb-40">
                            <h3 class="widget-title product-filter-widget-title">Fitrar por preço</h3>
                            <div class="widget-price-range">
                                <input class="range-slider" type="text" />
                            </div>
                        </div>
                        <!-- Fim Filtro por preço -->

                         <!-- Mais vendidos -->
                        <div class="single-widget learts-mb-40">
                            <h3 class="widget-title product-filter-widget-title">Mais vendidos</h3>
                            <ul class="widget-products">
                                <?php for($i=0;$i<count($maisvendidos);$i++){   
                                if($i < 5){             
                                foreach($maisvendidos[$i] as $key => $value){?>
                                <li class="product">
                                    <div class="thumbnail">
                                        <?php
                                            $existedesc = (isset($value->variacoes[0]['desconto'])) ? $value->variacoes[0]['desconto'] : '';
                                            $result = $this->app->verificaDesconto($value->variacoes[0]['valor'],$value->categoria,$existedesc); 
                                        ?>
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
                                            <?php if(isset($value->imagens[0])):?>
                                            <img src="<?= $this->app->getImageThumb($value->imagens[0],array('w'=>328,'h'=> 328,'zc'=> 2))?>" alt="Product Image">
                                            <?php else:?>
                                            <img src="{{this.url.getBaseUri()}}img/nophoto.jpg" class="js-prd-img">
                                            <?php endif;?> 
                
                                            <?php if((isset($value->imagens[1])) && (!empty($value->imagens[1]))):?>
                                            <img class="image-hover" src="<?= $this->app->getImageThumb($value->imagens[1],array('w'=>328,'h'=> 437,'zc'=> 2))?>" alt="Product Image">                          
                                            <?php endif;?> 
                                        </a>
                                    </div>
                                    <div class="content">
                                        <h6 class="title">
                                            <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}">
                                                <?php 	
                                                  $nomedest = mb_convert_case($value->nome, MB_CASE_LOWER, 'UTF-8');												
                                                  echo $this->app->limitaTexto2(ucfirst($nomedest),50); 
                                                ?>
                                            </a>
                                        </h6>
                                        <span class="price">
                                            <span class="old"> <?php if(isset($result['de'])){echo $result['de'];}?></span>
                                            <span class="new"> <?php if(isset($result['por'])){ echo $result['por']; }?></span>
                                        </span>
                                        <div class="rating-shelf-container">
                                            <div>
                                                {{ this.app.calculaEstrela(value._id,'',1) }}
                                            </div>
                                        </div>                                       
                                    </div>
                                </li>
                                <?php }}?>     
                                <?php }?>                              
                            </ul> 
                        </div>
                        <!-- Fim mais vendidos -->

                        <!-- Inicio Tags Categorias -->
                        <div class="single-widget learts-mb-40">
                            <h3 class="widget-title product-filter-widget-title">Tags</h3>
                            <div class="widget-tags">
                                <?php if(isset($todascategorias)){?>
                                    <?php foreach($todascategorias as $chave => $valor){?>
                                     <a href="{{this.url.getBaseUri()}}categoria/{{this.app.toURI(valor.categoria_nome)}}/?cat={{ valor._id }}"><?= $valor->categoria_nome;?></a>
                                    <?php }?>
                                <?php }?>                               
                            </div>
                        </div>
                        <!-- Fim Tags Categorias -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    


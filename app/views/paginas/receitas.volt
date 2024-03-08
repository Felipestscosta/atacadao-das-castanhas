    <!-- Breadcrumb Section Start -->
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>Dicas / Receitas</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="{{this.url.getBaseUri()}}">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Dicas / Receitas</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Start -->
    <section class="blog-section section-b-space">
        <div class="container-fluid-lg">
            <div class="row g-4">
                <div class="col-xxl-12 col-xl-12 col-lg-12 order-lg-2">
                    <div class="row g-4 ratio_65">
                        {% for blog in receitas %}
                        <div class="col-xxl-3 col-sm-6">
                            <div class="blog-box wow fadeInUp">
                                <div class="blog-image">
                                    <a href="{{this.url.getBaseUri() ~ 'receita_detalhes/' ~ blog._id}}">
                                        <img src="{{link_imagens ~ blog.imagem[0]}}"
                                            class="bg-img blur-up lazyload" alt="">
                                    </a>
                                </div>

                                <div class="blog-contain">
                                    <div class="blog-label">
                                        <span class="time"><i data-feather="clock"></i> <span><?= date('d/m/Y', strtotime($blog->created_at))?></span></span>
                                        <span class="super"><i data-feather="user"></i> <span>Atacadão das Castanhas</span></span>
                                    </div>
                                    <a href="{{this.url.getBaseUri() ~ 'receita_detalhes/' ~ blog._id}}">
                                        <h3>{{blog.nome}}</h3>
                                    </a>
                                    <button onclick="location.href = '{{this.url.getBaseUri() ~ 'receita_detalhes/' ~ blog._id}}';" class="blog-button">Ler Mais
                                        <i class="fa-solid fa-right-long"></i></button>
                                </div>
                            </div>
                        </div>
                        {% endfor %}

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
    <!-- Blog Section End -->
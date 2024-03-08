        <!-- Deal Box Modal Start -->
        <div class="modal fade theme-modal deal-modal" id="deal-box" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <div>
                            <h5 class="modal-title w-100" id="deal_today">Promoção da Semana</h5>
                            <p class="mt-1 text-content">Toda semana temos descontos especiais para você!</p>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="deal-offer-box">
                            <ul class="deal-offer-list">
                                <?php foreach($promocoes as $key => $value){?>
                                <li class="list-1">
                                    <div class="deal-offer-contain">
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}" class="deal-image">
                                            <img src="{{link_imagens ~ value.imagens[0]}}" class="blur-up lazyload"
                                                alt="{{value.nome}}">
                                        </a>
    
                                        <a href="{{this.url.getBaseUri()}}produto/{{this.app.toURI(value.nome)}}/{{value._id}}" class="deal-contain">
                                            <h5>{{value.nome}}</h5>
                                            <h6><?php if(isset($result['por'])){ echo $result['por']; }?> <del><?php if(isset($result['de'])){ echo $result['de']; }?></del></h6>
                                        </a>
                                    </div>
                                </li>
                                <?php }?>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Deal Box Modal End -->
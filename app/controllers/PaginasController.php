<?php

use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
class PaginasController extends ControllerBase
{
    function initialize(){
        $this->cart = new ShoppingCart("myShop");
        $this->view->setVar("conteudo_carrinho", $this->cart->getContent());
        $this->view->setVar("total_carrinho", $this->cart->getTotal());
        $this->view->setVar("categorias",Categorias::find(['limit'=> 6,'sort'=> array('categoria_nome' => 1)])); 
        $this->view->setVar("promocoes",Produtos::find([['lancamento' => "on"],'limit'=> 5,'sort'=> array('nome' => 1)]));
        $this->view->setVar("todascategorias",Categorias::find(['limit'=> 10,'sort'=> array('categoria_nome' => 1)])); 
        $maisvend = Produtos::comprasmensais();        
        $this->view->setVar("maisvendidos",$maisvend);
        $this->view->notificafrete = Fretes::findFirst(array("conditions" => array("status" => 'Ativo'),'limit' => 1));
        $this->view->empresa = Configuracoes::findFirst(); 
    }
    
    public function produtoAction($nome,$id)
    {     
        $this->assets->addCss('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css', false);
        $this->assets           
       ->addJs('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js', false)
       ->addJs('js/bootstrap-notify.min.js')
       ->addJs('js/scripts_produtos.js',true);
       $this->view->setTemplateAfter('_body_detalhes');
       $produto = Produtos::findbyId($id);  
       $this->view->setVar("produto", Produtos::findbyId($id));
       $this->view->setVar("destaques",Produtos::find([['produto_destaque' => "on"],'limit'=> 4]));  
       if((isset($produto->subcategoria)) && (!empty($produto->subcategoria))){
        $this->view->setVar("relacionados", Produtos::find(
            [
                'conditions' => [
                    'subcategoria' => new MongoDB\BSON\ObjectID($produto->subcategoria)
                ],
                'sort'=> array('_id' => -1),
                'limit'=> 6
            ]
        ));
    }
    else{
        $this->view->setVar("relacionados", Produtos::find(
            [
                'conditions' => [
                    'categoria' => new MongoDB\BSON\ObjectID($produto->categoria)
                ],
                'sort'=> array('_id' => -1),
                'limit'=> 6
            ]
        ));
    }
       $this->view->setVar("estoque",$produto->variacoes[0]['estoque']);
       $this->view->setVar("texturas",Textura::find());
       $this->view->setVar("tags",$produto->keywords);  
       $this->view->setVar("ultimosvistos",Produtos::insertUltimos($id));
       $this->view->setVar("nomesubcat",Subcategorias::findbyId($produto->subcategoria));
       $this->view->setVar("nomecat",Subcategorias2::findbyId($produto->subcategoria2)); 
       $this->view->setVar("subinternas",Subcategorias2::find([['subcategoria_id' => new MongoDB\BSON\ObjectID($produto->subcategoria)],'sort'=> array('subcategoria_nome' => -1)])); 
    }

    public function videoAction()
    {
        $this->view->setTemplateAfter("video");
        $this->view->setVar("destaques", Produtos::find(array("conditions" => array(
            "produto_destaque" => 'on',
            '$and' => [[
                'ativo' => 'on'
            ]]
            ),'limit'=> 8,'sort'=> array('nome' => 1))));
    }

    public function visualizacaoAction(){    
       $this->view->setVar("produto", Produtos::findbyId($_POST['id']));
    }
    
    // public function promocoesAction()
    // {
    //     $this->view->setVar("promocoes",Produtos::find([['lancamento' => "on"],'limit'=> 5,'sort'=> array('nome' => 1)]));        
    // }

    //remove filtros selecionados
     public function removeAndReturnAction()
        {
            unset($_GET['_url']);
            $url = $_GET['url'];       
            $varname = $_GET['field'];        
            list($urlpart, $qspart) = array_pad(explode('&', $url), 2, '');           
            parse_str($qspart, $qsvars);
            unset($qsvars[$varname]);
            $newqs = http_build_query($qsvars);
            return $urlpart;
            //return $urlpart . '?' . $newqs;
        }      
               
    public function categoriaAction($nome){   
       if(isset($_GET['cat'])){
           $id = $_GET['cat'];
       }            
       $this->view->setTemplateAfter('_body');
       $this->assets->addCss('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css', false);
       $this->assets           
         ->addJs('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js', false)
         ->addJs('https://code.jquery.com/ui/1.12.1/jquery-ui.js')
         ->addJs('js/scripts_produtos.js')
         ->addJs('js/bootstrap-notify.min.js');
       $this->view->setVar("todascategorias",Categorias::find(['limit'=> 11,'sort'=> array('categoria_nome' => 1)]));     
       $this->view->setVar("info_cat",Categorias::findbyId($id));
       $this->view->setVar("dados_busca",Produtos::produtosfiltro($id,'categoria')); 
       $this->view->setVar("destaques",Produtos::find([['produto_destaque' => "on"],'limit'=> 4]));
       $this->view->setVar("id",$id); 
       $this->view->setVar("produto_url", (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]");
       $this->view->setVar("nomecat",Categorias::findbyId($id)); 
       $this->view->setVar("catid",Categorias::findbyId($id));  
       unset($_GET['_url']); 
       if(isset($_POST)){
          if(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:asc')){
            $ordenacao = array('variacoes.0.valor' => 1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:asc')){
            $ordenacao = array('nome' => 1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:desc')){
            $ordenacao = array('nome' => -1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:desc')){
            $ordenacao = array('variacoes.0.valor' => -1);
          }else{
            $ordenacao = array('nome' => 1);  
          }
       } 
       else{
        $ordenacao = array('nome' => 1);
       }    

        if(isset($_GET['buscamarca'])){  
            $cols = array();
                foreach ($_GET['buscamarca'] as $key => $value) {                  
                    $cols[$key] = array('marca' => new MongoDB\BSON\ObjectID($_GET['buscamarca'][$key]));
            }                   
            $linkpaginacao = Produtos::find(array(
               "conditions" => array(
                  "categoria" => new MongoDB\BSON\ObjectID($id),
                  '$and' => array(
                      array('ativo' => 'on'),
                      array('$or' => $cols),
                      array('nome' => 1)
                  )                                                  
                ), 
                'sort' => $ordenacao
            )); 
        }
        else{            
            $linkpaginacao = Produtos::find(array(
                "conditions" => array(
                   "categoria" => new MongoDB\BSON\ObjectID($id),
                   '$and' => array(
                       array('ativo' => 'on') 
                   )                                                  
                 ), 
                 'sort' => $ordenacao
             )); 
        }             
  
       $this->view->total =count($linkpaginacao);

       if(isset($_GET["page"])){
             $currentPage = (int)$_GET["page"];        
       }
       else{
           $currentPage = '';
       }    
        $paginator = new PaginatorArray(
            [
                "data"  => $linkpaginacao,
                "limit" => 24,
                "page"  => $currentPage,
            ]
        );
        $this->view->page = $paginator->getPaginate();
    }
    
    public function subcategoriaAction($nome){   
       if(isset($_GET['cat'])){
           $id = $_GET['cat'];
       } 
       if(isset($_GET['sub'])){
           $subid = $_GET['sub'];
       }           
       $this->view->setTemplateAfter('_body');
       $nome = str_replace('-',' ',$nome);            
        $this->assets          
            ->addJs('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js', false)
            ->addJs('https://code.jquery.com/ui/1.12.1/jquery-ui.js')
            ->addJs('js/scripts_produtos.js')
            ->addJs('js/bootstrap-notify.min.js'); 
       $this->view->setVar("info_cat",Subcategorias::findbyId($subid)->toArray());
       $this->view->setVar("dados_busca",Produtos::produtosfiltro($subid,'subcategoria'));      
       $sub = Subcategorias::findbyId($subid)->toArray();      
       $cat = Categorias::findbyId((string)$sub['categoria_id'])->toArray();         
       $this->view->setVar("catid",(string)$cat['_id']); 
       $this->view->setVar("catnome",$cat['categoria_nome']); 
       $this->view->setVar("subnome",$sub['subcategoria_nome']);
       $this->view->setVar("catid",Categorias::findbyId($id));
       $this->view->setVar("id",$id); 
       $this->view->setVar("subid",$subid); 
       $this->view->setVar("destaques",Produtos::find([['produto_destaque' => "on"],'limit'=> 5]));      

       
    if(isset($_POST)){
          if(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:asc')){
            $ordenacao = array('variacoes.0.valor' => 1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:asc')){
            $ordenacao = array('nome' => 1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:desc')){
            $ordenacao = array('nome' => -1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:desc')){
            $ordenacao = array('variacoes.0.valor' => -1);
          }else{
            $ordenacao = array('nome' => 1);  
          }
       }   

       unset($_GET['_url']); 
     
      if(isset($_GET['buscamarca'])){  
            $cols = array();
                foreach ($_GET['buscamarca'] as $key => $value) {                  
                    $cols[$key] = array('marca' => new MongoDB\BSON\ObjectID($_GET['buscamarca'][$key]));
            }  
            $linkpaginacao = Produtos::find(array(
                "conditions" => array(
                   "subcategoria" => new MongoDB\BSON\ObjectID($subid),
                   '$and' => array(
                       array('ativo' => 'on'),
                       array('$or' => $cols)
                   )                                                  
                 ), 
                 'sort' => $ordenacao
             )); 
        }
        else{           
            $linkpaginacao = Produtos::find(array(
                "conditions" => array(
                   "subcategoria" => new MongoDB\BSON\ObjectID($subid),
                   '$and' => array(
                       array('ativo' => 'on')                      
                   )                                                  
                 ), 
                 'sort' => $ordenacao
             )); 
        } 

        $this->view->total =count($linkpaginacao);
        if(isset($_GET["page"])){
             $currentPage = (int)$_GET["page"];        
       }
       else{
           $currentPage = '';
       } 

        // Create a Model paginator, show 10 rows by page starting from $currentPage
        $paginator = new PaginatorArray(
            [
                "data"  => $linkpaginacao,
                "limit" => 24,
                "page"  => $currentPage,
            ]
        );
        // Get the paginated results
        $this->view->page = $paginator->getPaginate();  
    }

    public function unique_multidim_array($array, $key) { 
        $temp_array = array();     
        $key_array = array();   
        
        foreach($array as $val) {
            for($i=0;$i<count($array);$i++){                  
                if (!in_array($val[$i]->$key, $key_array)) { 
                    $key_array[$i] = $val[$i]->$key; 
                    $temp_array[$i] = $val; 
                } 
            }        
        }     
        return $temp_array; 
    }

    public function subcategoria2Action($nome,$id)
    {      
        $this->view->setTemplateAfter('_body');
        $this->assets       
            ->addJs('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js', false)
            ->addJs('https://code.jquery.com/ui/1.12.1/jquery-ui.js')
            ->addJs('js/bootstrap-notify.min.js'); 
       $this->view->setVar("info_cat",Subcategorias2::findbyId($id)->toArray());
       $this->view->setVar("dados_busca",Produtos::produtosfiltro($id,'subcategoria2')); 
       $this->view->setVar("id",$id);         
       $sub = Subcategorias2::findbyId($id)->toArray();      
       $cat = Categorias::findbyId($sub['categoria_id'])->toArray();
       $subnivel = Subcategorias::findbyId($sub['subcategoria_id'])->toArray();      
       $this->view->setVar("catid",$cat['categoria_id']->{'$id'}); 
       $this->view->setVar("catnome",$cat['categoria_nome']); 
       $this->view->setVar("subnome",$subnivel['subcategoria_nome']); 
       $this->view->setVar("subid",$sub['subcategoria_id']); 

        if(isset($_POST)){
          if(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:asc')){
            $ordenacao = array('variacoes.0.valor' => 1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:asc')){
            $ordenacao = array('nome' => 1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:desc')){
            $ordenacao = array('nome' => -1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:desc')){
            $ordenacao = array('variacoes.0.valor' => -1);
          }else{
            $ordenacao = array('_id' => -1);  
          }
       }  

        if(isset($_GET['buscamarca'])){  
            $cols = array();
                foreach ($_GET['buscamarca'] as $key => $value) {                  
                    $cols[$key] = array('marca' => new MongoDB\BSON\ObjectID($_GET['buscamarca'][$key]));
            }   
           $linkpaginacao = Produtos::find(array(
                "conditions" => array(
                "subcategoria2" => new MongoDB\BSON\ObjectID($id),
                '$and' => array(
                    array('ativo' => 'on'),
                    array('$or' => $cols)
                )                                                  
                ), 
                'sort' => $ordenacao
            )); 
       }
       else{
        $linkpaginacao = Produtos::find(array(
            "conditions" => array(
            "subcategoria2" => new MongoDB\BSON\ObjectID($id),
            '$and' => array(
                array('ativo' => 'on')               
            )                                                  
            ), 
            'sort' => $ordenacao
        )); 
       } 

       $this->view->total =count($linkpaginacao);
       if(isset($_GET["page"])){
             $currentPage = (int)$_GET["page"];        
       }
       else{
           $currentPage = '';
       }           

        // Create a Model paginator, show 10 rows by page starting from $currentPage
        $paginator = new PaginatorArray(
            [
                "data"  => $linkpaginacao,
                "limit" => 24,
                "page"  => $currentPage,
            ]
        );
        // Get the paginated results
        $this->view->page = $paginator->getPaginate();   
    }  

    public function aceitaCookie(){
        setcookie('usuario', 'Fulano');
    }

    public function marcasAction()    

    {

      

       $this->view->setTemplateAfter('_body');

        //    $this->assets

        //         ->addCss('css/blocklayered.css',true);

        //    $this->assets

        //         ->addJs('js/blocklayered.js',true);    

       $this->view->setVar("info_cat",Categorias::findbyId($categoria)->toArray());

       $this->view->setVar("dados_busca",Produtos::produtosfiltro($categoria,'categoria')); 

       $this->view->setVar("id",$categoria); 
       

         if(isset($_POST)){

          if(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:asc')){

            $ordenacao = array('variacoes.0.valor' => 1);  

          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:asc')){

            $ordenacao = array('nome' => 1);  

          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:desc')){

            $ordenacao = array('nome' => -1);  

          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:desc')){

            $ordenacao = array('variacoes.0.valor' => -1);

          }else{

            $ordenacao = array('_id' => -1);  

          }

       }  

       $this->view->setVar("produtos",Produtos::find(['categoria' => new MongoDB\BSON\ObjectID($categoria),'marca' => new MongoDB\BSON\ObjectID($id),'sort'=> $ordenacao]));

    

    }  

    public function marcaAction($id)

    {   

       if(isset($_GET['cat'])){

           $id = $_GET['cat'];

       }            
       $this->view->setTemplateAfter('_body');
       $this->assets
            ->addCss('css/filterprice.css',true)
            ->addCss('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css', false);
       $this->assets             
         ->addJs('js/scripts_home.js',true)          
         ->addJs('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js', false)
         ->addJs('https://code.jquery.com/ui/1.12.1/jquery-ui.js')
         ->addJs('js/range.js',true);
       $this->view->setVar("todascategorias",Categorias::find(['limit'=> 11,'sort'=> array('categoria_ordem' => 1)]));     
       
       $this->view->setVar("dados_busca",Produtos::produtosfiltro($id,'categoria')); 
       $this->view->idmarca = Marcas::findbyId($id);
       $this->view->marca = Marcas::find(array('conditions' => array('categoria' => new MongoDB\BSON\ObjectID($id)), 'sort' => array('variacoes.0.estoque' => -1)));
       $this->view->setVar("destaques",Produtos::find([['produto_destaque' => "on"],'limit'=> 4]));
       $this->view->setVar("id",$id); 
       $this->view->setVar("info_cat",Categorias::findbyId($id));
       $this->view->setVar("produto_url", (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]");
       $this->view->setVar("nomecat",Categorias::findbyId($id)); 
       $this->view->setVar("catid",Categorias::findbyId($id));  
         unset($_GET['_url']); 
       if(isset($_POST)){
          if(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:asc')){
            $ordenacao = array('variacoes.0.valor' => 1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:asc')){
            $ordenacao = array('nome' => 1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:desc')){
            $ordenacao = array('nome' => -1);  
          }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:desc')){
            $ordenacao = array('variacoes.0.valor' => -1);
          }else{
            $ordenacao = array('nome' => 1);
          }
       }     
        if(isset($_GET['buscamarca'])){  

            $cols = array();

                foreach ($_GET['buscamarca'] as $key => $value) {                  

                    $cols[$key] = array('marca' => new MongoDB\BSON\ObjectID($_GET['buscamarca'][$key]));

            }                   

            $linkpaginacao = Produtos::find(array(
               "conditions" => array(
                  "categoria" => new MongoDB\BSON\ObjectID($id),                  
                  '$or' => $cols                                                    
                ), 
                'sort' => $ordenacao
            )); 
        }
        else{
            $linkpaginacao = Produtos::find([['marca' => new MongoDB\BSON\ObjectID($id)],'sort'=> array('variacoes.0.estoque' => -1)]);
        }             

       $this->view->total =count($linkpaginacao);



       if(isset($_GET["page"])){

             $currentPage = (int)$_GET["page"];        

       }

       else{

           $currentPage = '';

       }    

        $paginator = new PaginatorArray(

            [

                "data"  => $linkpaginacao,

                "limit" => 21,

                "page"  => $currentPage,

            ]

        );

        $this->view->page = $paginator->getPaginate();

    }

   public function categoriasAction($nome)

{   
   if(isset($_GET['cat'])){
       $id = $_GET['cat'];
   }            
   $this->view->setTemplateAfter('_body');
   $this->assets
        ->addCss('css/filterprice.css',true)
        ->addCss('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css', false);
   $this->assets             
     ->addJs('js/scripts_home.js',true)          
     ->addJs('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js', false)
     ->addJs('https://code.jquery.com/ui/1.12.1/jquery-ui.js')
     ->addJs('js/range.js',true);

   $this->view->setVar("todascategorias",Categorias::find(['limit'=> 11,'sort'=> array('categoria_ordem' => 1)]));     

   $this->view->setVar("info_cat",Categorias::findbyId($id));

   $this->view->setVar("dados_busca",Produtos::produtosfiltro($id,'categoria')); 

   $this->view->setVar("destaques",Produtos::find([['produto_destaque' => "on"],'limit'=> 4]));

   $this->view->setVar("id",$id); 

   $this->view->setVar("produto_url", (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]");

   $this->view->setVar("nomecat",Categorias::findbyId($id)); 

   $this->view->setVar("catid",Categorias::findbyId($id));  

     unset($_GET['_url']); 

   if(isset($_POST)){

      if(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:asc')){

        $ordenacao = array('variacoes.0.valor' => 1);  

      }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:asc')){

        $ordenacao = array('nome' => 1);  

      }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'name:desc')){

        $ordenacao = array('nome' => -1);  

      }elseif(isset($_POST['ordenar']) && ($_POST['ordenar'] == 'price:desc')){

        $ordenacao = array('variacoes.0.valor' => -1);

      }else{

        $ordenacao = array('nome' => 1);  

      }

   }     



    if(isset($_GET['buscamarca'])){  

        $cols = array();

            foreach ($_GET['buscamarca'] as $key => $value) {                  

                $cols[$key] = array('marca' => new MongoDB\BSON\ObjectID($_GET['buscamarca'][$key]));

        }                   

        $linkpaginacao = Produtos::find(array(
           "conditions" => array(
              "categoria" => new MongoDB\BSON\ObjectID($id),                  
              '$or' => $cols                                                    
            ), 
            'sort' => $ordenacao
        )); 
    }
    else{

        $linkpaginacao = Produtos::find([['categoria' => new MongoDB\BSON\ObjectID($id)],'sort'=> array('variacoes.0.estoque' => -1)]);  
    }             
   $this->view->total =count($linkpaginacao);

   if(isset($_GET["page"])){

         $currentPage = (int)$_GET["page"];        
   }

   else{

       $currentPage = '';
   }    

    $paginator = new PaginatorArray(

        [

            "data"  => $linkpaginacao,

            "limit" => 21,

            "page"  => $currentPage,

        ]

    );

    $this->view->page = $paginator->getPaginate();

}


     public function buscaAction(){      
       $this->view->setTemplateAfter('_body');
       $this->assets
       ->addJs('js/scripts_busca.js',true)
       ->addJs('js/scripts_produtos.js',true)
       ->addJs('js/bootstrap-notify.min.js');
       $this->view->setVar("busca",$_GET['busca']);      
       $this->view->setVar("dados_busca",Produtos::buscafiltro($_GET['busca'])); 
       $this->view->setVar("destaques",Produtos::find([['produto_destaque' => "on"],'limit'=> 10]));  
       $this->view->setVar("busca",$_GET['busca']);       

        if((isset($_POST['ordenar'])) && (!empty($_POST['ordenar']))){
          if($_POST['ordenar'] == 'price:asc'){
            $ordenacao = array('variacoes.0.valor' => 1);  
          }elseif($_POST['ordenar'] == 'name:asc'){
            $ordenacao = array('nome' => 1);  
          }elseif($_POST['ordenar'] == 'name:desc'){
            $ordenacao = array('nome' => -1);  
          }elseif($_POST['ordenar'] == 'price:desc'){
            $ordenacao = array('variacoes.0.valor' => -1);
          }else{
            $ordenacao = array('nome' => 1);  
          }
       }
        else{
            $ordenacao = array('nome' => 1);  
        }     

        if(isset($_GET['buscamarca'])){  
            $cols = array();
                foreach ($_GET['buscamarca'] as $key => $value) {                  
                    $cols[$key] = array('marca' => new MongoDB\BSON\ObjectID($_GET['buscamarca'][$key]));
            } 
            $busca = StringUtil::accentToRegex(preg_quote($_GET['busca']));  
           
            $linkpaginacao = Produtos::find(array(
                "conditions" => array(
                "nome" => new MongoDB\BSON\Regex($busca, 'i'),  
                '$and' => array(
                    array('ativo' => 'on'),
                    array('$or' => $cols) 
                )                       
                ), 
                'sort' => $ordenacao
            )); 
       }
       else{ 
        $busca = StringUtil::accentToRegex(preg_quote($_GET['busca']));  
           
        $linkpaginacao = Produtos::find(array(
            "conditions" => array(
            "nome" => new MongoDB\BSON\Regex($busca, 'i'),  
            '$and' => array(
                array('ativo' => 'on')              
            )                                                  
            ), 
            'sort' => $ordenacao
        ));
       }     
       
       $this->view->total =count($linkpaginacao);
       $currentPage = (int) $_GET["page"];     
       $paginator = new PaginatorArray(
            [
                "data"  => $linkpaginacao,
                "limit" => 24,
                "page"  => $currentPage,
            ]
        );
        // Get the paginated results
        $this->view->page = $paginator->getPaginate();
    }
    
    public function quickviewAction() {
        $dados = new Solicitacoesestoque();
        $dados->nome             = $_POST['nome'];
        $dados->email            = $_POST['email'];
        $dados->produto          = new MongoDB\BSON\ObjectID($_POST['id_produto']);
        $dados->data_solicitacao = new MongoDate();
        $dados->save();
    }

    public function aviseAction() {
        $produto =  Produtos::findbyId($id);
        $this->view->setVar("produto", Produtos::findbyId($id));

    }   

    public function compareAction() {
        $this->view->setTemplateAfter('_body');
        $produto =  Produtos::findbyId($id);
        $this->view->setVar("produto", Produtos::findbyId($id));
        $this->view->setVar("categorias",Categorias::categoriasandsub(5));
        $this->view->setVar("categorias_mobile",Categorias::categoriasandsub());
        $this->view->setVar("categorias_mais",Categorias::categoriasmais());
    }
    
    
    public function loginAction(){
       $this->assets
            ->addCss('css/login.css',true);
       $this->assets
            ->addJs('js/scripts_login.js',true);        
       $this->view->setTemplateAfter('_body');
    }
    
    public function receitasAction(){
       $this->view->setTemplateAfter('_body');
       $this->view->setVar("receitas",Eventos::find(['sort' => array('created_at' => 1)]));

       if(isset($_GET['buscamarca'])){  
        $cols = array();
            foreach ($_GET['buscamarca'] as $key => $value) {                  
                $cols[$key] = array('marca' => new MongoDB\BSON\ObjectID($_GET['buscamarca'][$key]));
        }                   
        $linkpaginacao = Eventos::find(array(
           "conditions" => array(
              "receitas" => new MongoDB\BSON\ObjectID($id)                                                  
            ), 
            'sort' => $ordenacao
        )); 
    }
    else{            
        $linkpaginacao = Eventos::find(array(
            "conditions" => array(
               "receitas" => new MongoDB\BSON\ObjectID($id)                                                 
             ), 
             'sort' => $ordenacao
         )); 
    }             

   $this->view->total =count($linkpaginacao);

   if(isset($_GET["page"])){
         $currentPage = (int)$_GET["page"];        
   }
   else{
       $currentPage = '';
   }    
    $paginator = new PaginatorArray(
        [
            "data"  => $linkpaginacao,
            "limit" => 3,
            "page"  => $currentPage,
        ]
    );
    $this->view->page = $paginator->getPaginate();
    }

    public function receita_detalhesAction($id){
        $this->view->setTemplateAfter('_body');
        $this->view->idrec = Eventos::findById($id);
        $this->veiw->receitas = Eventos::find();
    }
    
    public function contatoAction(){   
       $this->view->setTemplateAfter('_body');
       $montaarray = Configuracoes::findFirst();
       $newarray = array(
           'endereco' => $montaarray->endereco .' nº '. $montaarray->numero,
           'cid' => $montaarray->cidade .' / '. $montaarray->estado,
           'email' => $montaarray->email,
           'telefones' => $montaarray->telefones
       );
       $this->view->info = $newarray;      
    }
       
    //////////////////////////
    // -- Ações carrinho -- //
    //////////////////////////
    public function carrinhocountAction()
    {
       echo $this->cart->getTotalItems();
    } 

    public function carrinhoindexcountAction()
    {     
        $teste = $this->cart->getContent();     
            
        if(!empty($teste))   {
            foreach($teste as $key => $value){           
            $teste2[] = array(
                'id' => $value['id'],
                'id_mongo' => $value['id_mongo'],
                'name' => $value['name'],
                'price' => $value['price'],
                'imagem' => $value['imagem'],
                'qty' => $value['qty'],
                'cor' => isset($value['options']['cor']) ? $value['options']['cor'] : '',
                'tamanho' => $value['options']['tamanho'],
                'description' => $value['description'],
                'rowId' => $value['rowId'],
                'total' => $value['total'],
                'cornome' => isset($value['options']['cor']) ? $this->app->getCor($value['options']['cor']) : ''
            );
            }
        }  
        // else{
        //     $teste2[] = array(
        //         'id' => '',
        //         'id_mongo' => '',
        //         'name' => '',
        //         'price' => '',
        //         'imagem' => '',
        //         'qty' => '',
        //         'description' => '',
        //         'rowId' => '',
        //         'total' => ''
        //     );
        // }
       
      
         $dados_valores = array(
           'itens'    => $teste2, 
           'qtd'      => $this->cart->getTotalItems(),
           'total' => $this->cart->getTotal()          
       );         
      
     // return $this->response->setJsonContent(array('itens' => $teste2),array('pedido_id' => $dados['pedido_id']);    
      $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode($dados_valores)); 
      return $this->response->send();
    }
    
    // Apos selecionar o frete salva na sessão de compra
    public function sessaofreteAction()
    {
       $_SESSION['tipo_frete'] = $_POST['tipo'];
       $numeric = $this->app->transform2($_POST['frete']);
       $this->session->set('frete',$numeric);
    }
    
    // Apos selecionar o frete salva na sessão de compra
    public function sessaocupomAction()
    {       
        if(isset($_SESSION['cupom'])){
             $data =  $this->app->transform($_SESSION['cupom']);           
             echo number_format($data,2,'.','');
       }      
    }

    public function descontoPixAction(){
        $percent = Configuracoes::findFirst()->preferencias_de_pagamentos['pix_desconto'];
        if($percent > 0){          
            $calculo = $this->app->descontoPix($percent,$this->cart->getTotal());  
            $explosao = explode(',',$calculo);  
            $descontopix =  $explosao[0].'.'.substr($explosao[1], 0, -1);       
            $tot =  ($this->cart->getTotal()) - $descontopix;            
        }    
        else{
            $tot = $this->app->transform($this->cart->getTotal()); 
        }         
              
        $frete_mais_compras               = $tot + ($_SESSION['frete']);       
        $frete_mais_compras_mais_desconto = ($frete_mais_compras) - str_replace(',','.',$_SESSION['cupom']);             
        
        $_SESSION['testecarrinho'] = (isset($_SESSION['cupom'])) ? number_format($frete_mais_compras_mais_desconto,2,'.','') : number_format($frete_mais_compras,2,'.','');
       
        $dados_valores = array(
            'total_carrinho'    => "{$this->app->transform(number_format($this->cart->getTotal(),2,'.',''))}", 
            'cupom'             => (isset($_SESSION['cupom'])) ? str_replace(',','.',$_SESSION['cupom']) : '',
            'descontopix'             => (isset($descontopix)) ? "{$this->app->transform(number_format($descontopix,2,'.',''))}"  : '',
            'descontoprog'             => (isset($possuidesconto['desconto'])) ? $possuidesconto['desconto'] : '',
            'total_frete'       => "{$_SESSION['frete']}",
            'fretemaiscompras'  => number_format($frete_mais_compras,2,'.',''),
            'fretemaiscomprasdesconto'  => (isset($_SESSION['cupom'])) ? number_format($frete_mais_compras_mais_desconto,2,'.','') : number_format($frete_mais_compras,2,'.','')
        );
        $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode($dados_valores));
        return $this->response->send();
    }
    
    // Apos selecionar o frete salva na sessão de compra
    public function atualizachechoutAction()
    {       
       $possuidesconto = self::verificaDescontos();                 
       $frete_mais_compras               = ($possuidesconto['tot']) + ($_SESSION['frete']);   
       $frete_mais_compras_mais_desconto = ($frete_mais_compras) - str_replace(',','.',$_SESSION['cupom']);             
       
       $_SESSION['testecarrinho'] = (isset($_SESSION['cupom'])) ? number_format($frete_mais_compras_mais_desconto,2,'.','') : number_format($frete_mais_compras,2,'.','');
      
       $dados_valores = array(
           'total_carrinho'    => "{$this->app->transform(number_format($this->cart->getTotal(),2,'.',''))}", 
           'cupom'             => (isset($_SESSION['cupom'])) ? str_replace(',','.',$_SESSION['cupom']) : '',
           'descontoprog'             => (isset($possuidesconto['desconto'])) ? $possuidesconto['desconto'] : '',
           'total_frete'       => "{$_SESSION['frete']}",
           'fretemaiscompras'  => number_format($frete_mais_compras,2,'.',''),
           'fretemaiscomprasdesconto'  => (isset($_SESSION['cupom'])) ? number_format($frete_mais_compras_mais_desconto,2,'.','') : number_format($frete_mais_compras,2,'.','')
       );
       $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode($dados_valores));
       return $this->response->send();
            
    }
       // Apos selecionar o frete salva na sessão de compra
    public function descontoprogressivoAction()
    {
       $possuidesconto = self::verificaDescontos();     
         
       $frete_mais_compras               = ($possuidesconto['tot']) + ($_SESSION['frete']);;
       $frete_mais_compras_mais_desconto = ($frete_mais_compras) - $_SESSION['cupom'];
              
       $dados_valores = array(
           'total_carrinho'    => "{$this->app->transform(number_format($this->cart->getTotal(),2,'.',''))}", 
           'descontoprog'             => (isset($possuidesconto['desconto'])) ? $possuidesconto['desconto'] : '',
           'cupom'             => (isset($_SESSION['cupom'])) ? $_SESSION['cupom'] : '',
           'total_frete'       => "{$_SESSION['frete']}",
           'fretemaiscompras'  => number_format($frete_mais_compras,2,'.',''),
           'fretemaiscomprasdesconto'  => (isset($_SESSION['cupom'])) ? number_format($frete_mais_compras_mais_desconto,2,'.','') : number_format($frete_mais_compras,2,'.','')
       );
       $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode($dados_valores));
       return $this->response->send();
            
    }

 
    
    public function valida_cupomAction()
    {
      $dado = Cupons::validacupom($_POST);
      $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode($dado));
      return $this->response->send();
    }
    
    public function conteudoAction()
    {
       echo $this->cart->getContent();
    }

    public function esvaziarcarrinhoAction(){  
        $this->cart->destroy();  
        $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode(true));
        return $this->response->send();
    }
    
    public function insertcartAction(){           
            $id = preg_replace('/[^0-9]/','',$_POST['produto_id']);
           
            $s = $this->app->transform2($_POST['valor']);
            if((!empty($_POST['cor']))&&(!empty($_POST['tamanho']))){
                $opcao = array(
                        'cor' =>  $_POST['cor'],
                        'tamanho' =>  $_POST['tamanho']
                        );
            }
            else if((!empty($_POST['cor']))&&(empty($_POST['tamanho']))){
                 $opcao = array(
                        'cor' =>  $_POST['cor']                       
                        );
            }
            else if((!empty($_POST['tamanho']))&&(empty($_POST['cor']))){
                 $opcao = array(
                        'tamanho' =>  $_POST['tamanho']                       
                        );
            }          
            else{
                $opcao = '';
            }
          
            $product = array(
                    "id"      =>    $id,
                    "id_mongo" =>   $_POST['produto_id'],
                    "name"    =>    $_POST['produto'],
                    "price"   =>    $s,
                    "estoque" =>    $_POST['estoque'],
                    "imagem"  =>    $_POST['produto_imagem'],
                    "qty"     =>    $_POST['qty'],
                    "cat"     =>    $_POST['cat'],
                    "options" => $opcao,                                 
                    "description"  => "Produto"
            );         

            if($this->cart->add($product) != false)
            {
                    return true;
            }
            else{
                    return false;
            }
  }
    
    public function carrinhoAction()
    {       
       $this->assets->addJs('js/scripts_carrinho.js',true);       
       $this->view->setVar("conteudo_carrinho", $this->cart->getContent());
       $this->view->setVar("total_carrinho", $this->cart->getTotal());
       $this->view->setVar("possuidesconto",Cupons::find(array("conditions" => array(
            "status" => 'Ativo',
            '$and' => [[
                'tipocupom' => 'quantidade'
            ]]
        ))));          
        $this->view->setTemplateAfter('_body');
    }
    
    public function destroycartAction(){
         $this->cart->destroy();
    }

    
    ////////////////checa cpf //////////////////////
    public function checacpfAction(){     
        $this->view->disable();
        $this->response->setContentType('application/json');
     
        $retorno = Clientes::findFirst(array(array('cpf' => $this->request->getPost('cpf'))));         
        if (!$retorno) {
            return $this->response->setContent(json_encode(array('status' => false)));              
        }      
            
       else{
        return $this->response->setContent(json_encode(array('status' => true)));              
       } 
    } 


    ////////////////checa cpf //////////////////////
    public function checaemailAction(){     
        $this->view->disable();
        $this->response->setContentType('application/json');
     
        $retorno = Clientes::findFirst(array(array('email' => $this->request->getPost('email'))));         
        if (!$retorno) {
            return $this->response->setContent(json_encode(array('status' => false)));              
        }      
            
       else{
        return $this->response->setContent(json_encode(array('status' => true)));              
       } 
    }


    public function removeprodutoAction(){         
        $this->cart->removeProduct($_POST['id']);       
        $this->response->setContentType('application/json', 'UTF-8');     
        return $this->response->setContent(json_encode(['total_cart' => $this->cart->getTotal()]));
    }

    public function removeprodutoindexAction(){
        $this->cart->removeProduct($_POST['id']);  
             
        $this->response->setContentType('application/json', 'UTF-8');
            $dados_valores = array(           
           'qtd'      => $this->cart->getTotalItems(),
           'total_cart' => $this->cart->getTotal()          
       );    
       
        return $this->response->setContent(json_encode($dados_valores));
    }

    public function fragmentAction(){
		$this->view->disable();
		$this->view->conteudo_carrinho = $this->cart;
	}

    //////////////////////////
    // -- Minha Conta -- //
    //////////////////////////
    
    public function redefinicaoAction(){     
       $this->view->setTemplateAfter('_body');
       
       $usuario = Clientes::findFirst([['email'=> $this->session->get("email_validacao")]]);
       
       $Mail = new \Email(); 
       if($Mail->redefinicaosenha(array('email'=>$usuario->email,'nome' => nome),'teste')){ 
        echo 'Enviado com Sucesso!!'; 
       } else {
        echo 'erro';
       }
       
    }
    
    public function redefinicaomodalAction(){   
       $usuario = Clientes::findFirst([['email'=> $_POST['email']]]);       
       $Mail = new \Email(); 
       if($Mail->redefinicaosenha(array('email'=> $usuario->email,'nome' => nome),'teste')){ 
        echo 'Enviado com Sucesso!!'; 
       } else {
        echo 'erro';
       }
       
    }
    
    // Ações de Login
    
    //Login secundario, dentro do checkout
    public function logincheckoutAction(){
        $dados = $_POST;
        $user = Clientes::findFirst([['email' => $dados['email']]]);
        if($user){
            if(isset($user->validado)){
                if($this->security->checkHash($this->request->getPost('senha'), $user->senha)) {
                    $usuario = $this->initSession($user);
                    $response['mensagem']          = true;
                    $response['cep_cliente'] = $user->cep;
                    $response['tipo'] = true;
                }else{
                    $response['mensagem'] = "<div class='alert alert-danger' role='alert'><b>Atenção!</b> Senha Inválida</div>";
                    $response['tipo'] = false;
                }
            }else{
                $response['mensagem'] = "<div class='alert alert-danger' role='alert'><b>Atenção!</b> Uma nova senha foi encaminhada para seu e-mail.</div>";
                $response['tipo'] = true;
            }
            
        }else{
            $response['mensagem'] = "<div class='alert alert-danger' role='alert'><b>Atenção!</b> E-mail nao encontrado.</div>";
            $response['tipo'] = false;
        }
        
        $response = $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode($response));
        return $this->response->send();
    }
    
    public function verificaloginAction(){
         $user = Clientes::findFirst([['email' => $_POST['email']]]);         
         if($user){
            $response = false;
            $response = $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode($response));
            return $this->response->send();
         }else{
            $response = true;
            $response = $this->response->setContentType('application/json', 'utf-8')->setContent(json_encode($response));
            return $this->response->send();
         }
             
    }
    
    public function loginuserAction(){
        $dados = $_POST;
        $user = Clientes::findFirst([['email' => $dados['email']]]);
        if($user){
            if(isset($user->validado)){               
                if($this->security->checkHash($this->request->getPost('senha'), $user->senha)) {                
                    $this->initSession($user);
                    if(!empty($this->cart->getContent())){
                         return $this->response->redirect('checkout');
                    }
                    else{
                         return $this->response->redirect('paginas/minhaconta');
                    }
                   
                }else{
                    $this->flashSession->error("Atenção! Senha Inválida");
                    return $this->response->redirect('paginas/login');
                }
            }else{
                $this->session->set('email_validacao',$user->email);
                return $this->response->redirect('redefinicao');
            }
            
        }else{
            $this->flashSession->error("Atenção! E-mail não encontrado.");
            return $this->response->redirect('paginas/login');
        }
    }
    
    //Inicia a Sessão
    private function initSession($user){
      if((!empty($user->sobrenome)) && (!empty($user->sobrenome))){
            $this->session->set('sobrenome',$user->sobrenome);
      }    
      $nome = explode(" ",$user->nome);     
      $this->session->set('id',$user->_id);
      $this->session->set('nome',$nome[0]);
      $this->session->set('email',$user->email);
    }
    
    public function logoutuserAction(){
      $this->session->remove("id");
      $this->session->remove("nome");
      $this->session->remove("email");        
      $this->response->redirect('index');
    }

    
    public function minhacontaAction(){
       parent::verificalogin();
       $this->assets
            ->addCss('css/tabbed.css',true) 
            ->addCss('css/blue.css',true)
            ->addCss('css/tabbed.css',true)
            ->addCss('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css', false);
       $this->assets 
            ->addJs('js/jquery.mask.min.js',true)
            ->addJs('js/scripts_minhaconta.js',true)
           ->addJs('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js', false);     
       //$this->view->setVar("minhascompras",Compras::find(array('conditions' => array('cliente' => "{$this->session->get('id')}"))));
       $this->view->setVar("minhascompras",Compras::find([ ['cliente' => $this->session->get('id') ],'sort'=> array('_id' => -1) ] ) );       
       
       $this->view->setTemplateAfter('_body');
    }
    
    public function novacontaAction(){
       $this->assets
            ->addCss('css/tabbed.css',true) 
            ->addCss('css/blue.css',true);
       $this->assets 
            ->addJs('js/jquery.mask.min.js',true)
            ->addJs('js/scripts_minhaconta.js',true); 
       $this->view->setVar("email",$_POST['email']);
       $this->view->setTemplateAfter('_body');
    }
    
  //View Recupera Senha
    public function  viewRecuperaSenhaAction(){
        $this->assets->addCss('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css', false);
        $this->assets->addJs('https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js', false);
        $this->view->pick('paginas/viewrecuperasenha');
    }

     public function  abremodalAction(){
         $this->view->disable();  
         if($_GET['id'] == 'sobre')  {
                $teste = Configuracoes::findFirst()->institucional[$_GET['id']]; 
         } 
         else{
            $teste = Configuracoes::findFirst()->informacoes[$_GET['id']]; 
         } 
     
     echo $teste;      
    }
    
    public function acaoRecuperaSenhaAction(){
        $linksite = explode("/",$this->url->getBaseUri());
        $link = $linksite[0].'//'.$linksite[2].'/icontrole/';
        $empresa = Configuracoes::findFirst();    
        $this->view->disable();
        $Mail = new Email();  
        $email = array(
            'email' => mb_strtolower($_POST['email'])
        );         
        if($Mail->redefinicaosenha($email,$link,$empresa)){
            echo true;
        }else{
            echo false;
        }
    }      
    
    ///////////////////////////////////////
    ///////////// Contato /////////////////
    ///////////////////////////////////////
    public function sendAction()
    {    
        $linksite = explode("/",$this->url->getBaseUri());
        $link = $linksite[0].'//'.$linksite[2].'/icontrole/';
        $empresa = Configuracoes::findFirst();          
        $this->response->setHeader("Content-Type", "application/json");
        $this->view->disable();
        $Email = new Email;   
             
        if ($Email->contato($_POST,$empresa,$link)) {
            return $this->response->setJsonContent(array('status' => true, 'mensagem' => 'E-mail enviado com sucesso'));
        }else{
            return $this->response->setJsonContent(array('status' => false,  'mensagem' => 'Erro ao enviar e-mail'));
        }
    }   

    public function updatecarrinhoAction(){ 
        $descontoquantidade = Cupons::find(array("conditions" => array(
            "status" => 'Ativo',
            '$and' => [[
                'tipocupom' => 'quantidade'
            ]]
        ))); 

        $rowid = $_POST['rowid'];    
        $cart = $this->cart->getContent();          
        foreach ($cart as $cart) {  
            if($rowid == $cart['rowId']){           
            $qty = $_POST['qty'];
            $cat = $_POST['cat']; 
            $estoque = $_POST['estoque'];              
            //$cor = $_POST['cor'];          
            //$tamanho = $_POST['tamanho'];
            $nome = $cart['name'];
            $descricao = $cart['description'];
            $imagem = $cart['imagem'];
            }
        }           
         if((isset($descontoquantidade) && (!empty($descontoquantidade)))){     
            if(in_array($_POST['cat'],$descontoquantidade[0]->categorias)){ 
            
                if(($qty > $descontoquantidade[0]->qtdvalor[0]) && ($qty < $descontoquantidade[0]->qtdvalor[1])){                                                                     
                            $calculo = $this->app->desconto($descontoquantidade[0]->qtdporcentagem[0],$_POST['price']);  
                            $tot = $this->app->transform($calculo);    
                } 
                else if(($qty > $descontoquantidade[0]->qtdvalor[1]) && ($qty < $descontoquantidade[0]->qtdvalor[2])){   
                            $calculo = $this->app->desconto($descontoquantidade[0]->qtdporcentagem[1],$_POST['price']);  
                            $tot = $this->app->transform($calculo);
                }
                else if($qty > $descontoquantidade[0]->qtdvalor[2]){   
                            $calculo = $this->app->desconto($descontoquantidade[0]->qtdporcentagem[2],$_POST['price']);  
                            $tot = $this->app->transform($calculo);
                }
                else{
                    $tot = $this->app->transform($_POST['price']); 
                }                                          
                
        }
        else{
                $tot = $this->app->transform($_POST['price']); 
        }
         }
      else{                
             $tot = $this->app->transform($_POST['price']); 
      } 

        if((!empty($_POST['cor']))&&(!empty($_POST['tamanho']))){
        $opcao = array(
                'cor' =>  $_POST['cor'],
                'tamanho' =>  $_POST['tamanho']
                );
        }
        else if((!empty($_POST['cor']))&&(empty($_POST['tamanho']))){
                $opcao = array(
                    'cor' =>  $_POST['cor']                       
                    );
        }
        else if((!empty($_POST['tamanho']))&&(empty($_POST['cor']))){
                $opcao = array(
                    'tamanho' =>  $_POST['tamanho']                       
                    );
        }          
        else{
            $opcao = '';
        }           

       $data = array(
                    'rowId' => $rowid,
                    'qty' => $qty,                
                    'options' => $opcao, 
                    'id_mongo' => $_POST['idmongo'],
                    'price' => $_POST['price'],
                    'comdesconto' => $tot,
                    'id' => $_POST['id'],
                    'description' => $descricao,
                    'imagem' => $imagem,
                    'name' => $nome,
                    'cat' => $cat,
                    "estoque" => $estoque,
                    'total' => $this->app->transform($tot) * $qty,
                    'total_carrinho' => $this->cart->getTotal()
                ); 

        $frete = array();
         $notificafrete = Fretes::findFirst(array("conditions" => array("status" => 'Ativo'),'limit' => 1));    
       

      
          

       if($this->cart->update($data)){                          
           $this->response->setContentType('application/json', 'UTF-8');
           if(isset($notificafrete->tipofrete) && ($notificafrete->tipofrete == 'valor')){                                          
                if ((number_format($this->cart->getTotal(),2,'.',',')) < (number_format($notificafrete->valorminimo,2,'.',','))){
                    $valor =  ((number_format($notificafrete->valorminimo,2,'.',',')) - (number_format($this->cart->getTotal(),2,'.',',')));
                    $frete = array(
                        'porcentagem' => round($this->cart->getTotal()),
                        'valorminimo' => number_format($notificafrete->valorminimo,2,',','.'),
                        'falta' => number_format($valor,2,',','.'),
                        'fretegratis' => 0,
                        'totalcarrinho' => number_format($this->cart->getTotal(),2,'.',',')                    
                    );
                
                }
                else{
                    $frete = array(
                        'porcentagem' => '',
                        'valorminimo' => number_format($notificafrete->valorminimo,2,',','.'),
                        'falta' => '',
                        'fretegratis' => 1
                    );
                
                }
            }
           return  $this->response->setContent(json_encode(['itens' => $data, 'total_cart' => $this->cart->getTotal(),'desconto'=>$tot,'frete'=>$frete]));
       }else{
           echo false;
       }
  }

  public function buscaImagemAction(){      
     $produtofoto = Produtos::findById($_POST['produtoid']);     
     foreach($produtofoto->variacoes as $key => $value){       
          if($produtofoto->variacoes[$key]['cor'] == $_POST['cor']) {              
             $this->response->setContentType('application/json', 'UTF-8');  
             $cor = Cores::findById($produtofoto->variacoes[$key]['cor']); 
             $teste[] = array(
                 'imagem' => $value['img'],
                 'estoque' => $value['estoque'],
                 'cor' => (string)$value['cor'],
                 'nome' => $cor->cor_nome
             );         
            
          }         
      }     
   
       return  $this->response->setContent(json_encode($teste)); 
      // $estoque = $produtofoto->variacoes[$key]['estoque'];     
  }


     public function buscaTamanhoAction(){      
        $produtofoto = Produtos::findById($_POST['produtoid']);         
         
        foreach($produtofoto->variacoes as $key => $value){  
            if($produtofoto->variacoes[$key]['cor']->{'$id'} == $_POST['cor']) {    
                $this->response->setContentType('application/json', 'UTF-8');
                $tam = Tamanhos::findById($produtofoto->variacoes[$key]['tamanho']->{'$id'});
                $tamanhos[] = array(
                    'tamanho' => $value['tamanho']->{'$id'},
                    'nome' => $tam->nome,
                    'estoque' => $produtofoto->variacoes[$key]['estoque']
                );              
           }         
        } 
       
        return  $this->response->setContent(json_encode($tamanhos)); 
      
        // $estoque = $produtofoto->variacoes[$key]['estoque'];     
    }

   public function sobreAction(){           
       $this->view->setTemplateAfter('_body');
       $this->view->sobre = Configuracoes::findFirst()->institucional['sobre']; 
       $this->view->depoimentos = Depoimentos::find();      
  }

    public function newsAction(){
        $user = Newsletter::findFirst([['email' => $_POST['email']]]);
        if(!$user){
            $model = new Newsletter;
            if($this->request->isPost()){
                $this->response->setContentType('application/json');
                $model->email = $this->request->getPost('email');
                if($model->save()){
                    return $this->response->setContent(json_encode(array('status' => true,'mensagem' => 'Cadastrado com sucesso')));
                }else{
                    return $this->response->setContent(json_encode(array('status' => false,'mensagem' => 'Houve um erro, entre em o administrador do site')));
                }
            }
        }
        else{
            $this->response->setContentType('application/json');
            return $this->response->setContent(json_encode(array('status' => false,'mensagem' => 'Houve um erro, e-mail já cadastrado')));
        }
       
    }


    public function informacoesAction($parametro){
        $this->view->setTemplateAfter('_body'); 
        if($parametro == 'termos_condicoes'){$titulo = 'Termos e condições';}
        else if($parametro == 'politica_privacidade'){$titulo = 'Política de privacidade';} 
        else{$titulo = $parametro; }
        $this->view->setVar("titulo",$titulo);
        $this->view->setVar("informacoes",Configuracoes::findFirst()->informacoes[$parametro]);
        
    }

    // public function depoimentosAction() 
    // {
    //     $this->view->setTemplateAfter('_body');
    //     $this->view->depoimentos = Depoimentos::find();
    // }

   

    public function avaliarProdutoAction(){
        $this->view->disable();  
        $verifica = Avaliacao::find(
          [
              [
                  'conditions' => [                     
                      'ip' => $_SERVER['REMOTE_ADDR'],
                      '$and' => [
                            [
                                "cliente" => $_POST['cliente'] 
                            ],
                            [                                
                                '$and' => [
                                    [
                                        "produto" => $_POST['produto'] 
                                    ]
                                ]
                            ]
                    ],   
                  ]
              ]
          ]
        );    
                
        if(isset($verifica) && (!empty($verifica))){
            return $this->response->setContentType('application/json')->setContent(json_encode(['status' => false,'mensagem'=>'Você já fez essa avaliação']));
        } 
        else{
            $avaliacao = new Avaliacao; 
            $avaliacao->nota = $_POST['nota'];
            $avaliacao->cliente = new MongoDB\BSON\ObjectID($_POST['cliente']);
            $avaliacao->produto = new MongoDB\BSON\ObjectID($_POST['produto']);
            $avaliacao->opiniao = $_POST['opiniao'];
            $avaliacao->nome = $_POST['nome'];
            $avaliacao->comentario = $_POST['comentario'];
            $avaliacao->ip = $_SERVER['REMOTE_ADDR'];           
           
            if($avaliacao->save())
            {
                return $this->response->setContentType('application/json')->setContent(json_encode([ 'status' => true,'mensagem'=>'Avaliação salva com sucesso!']));                
            }else{
                return $this->response->setContentType('application/json')->setContent(json_encode(['status' => false,'mensagem'=>'Erro ao salvar atualização!']));
            }
        }   
    }


    public function comparacaoAction(){
        $session = Phalcon\Di::getDefault()->get('session');
		$array = Produtos::insertComparacao($_POST);           
		if ($this->request->isAjax()) {          
		   return $this->response->setContentType('application/json')->setContent(json_encode(array('status' => true,'total' => count($session->get('comparacao')) )));
		}	
	}

    public function deleteComparacaoAction($id){
		$comparacao = $this->session->get('comparacao');
		$key = array_search($id,$comparacao);
		unset($comparacao[$key]);
		$this->session->set('comparacao',array_values($comparacao));
        return $this->response->redirect('paginas/vercomparacao');		
	}

    public function vercomparacaoAction(){
        $this->view->setTemplateAfter('_body');    
        //$this->view->setVar("todascategorias",Categoria::find(['limit'=> 32,'sort'=> array('categoria_nome' => 1)])); 	
		if(($this->session->has('comparacao'))){
			$array = array();
			for ($i=0; $i < count($this->session->get('comparacao')); $i++) { 			
				$array[] = Produtos::getOne($this->session->get('comparacao')[$i]);			
			}
			$chaves = array();
			foreach ($array[0] as $key => $value) {
				$chaves[] = $key; 
			}
			$this->view->produtos = $array;		
			$this->view->chaves = $chaves;
		}				
    }
    
    public function alteraAction(){
        $compra = Compras::find();
        foreach($compra as $key => $value){                   
               $compra[$key]->mensagem = array('0' => $value->mensagem);
             
               $compra[$key]->save();     
        }
      
    } 
    
    public function alteraprodAction(){
        $compra = Produtos::find();
        foreach($compra as $key => $value){  
            $compra[$key]->variacoes[0]['valor'] = (float)$value->produto_valor;             
            $compra[$key]->save();                     
        }     
    } 
}


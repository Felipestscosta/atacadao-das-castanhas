<?php
use MetzWeb\Instagram\Instagram;
class IndexController extends ControllerBase
{
    function initialize(){
       $this->view->empresa = Configuracoes::findFirst();        
    }
    
    
    public function indexAction()
    {
       $this->view->setTemplateAfter('_body');
       $this->assets->addJs('js/scripts_produtos.js',true);
       $this->assets->addJs('js/bootstrap-notify.min.js');
       $this->view->setVar("categorias",Categorias::find(['limit'=> 6,'sort'=> array('categoria_nome' => 1)])); 
       $this->view->setVar("todascategorias",Categorias::find(['limit'=> 10,'sort'=> array('categoria_nome' => 1)])); 
       $this->view->setVar("conteudo_carrinho", $this->cart->getContent());
       $this->view->setVar("total_carrinho", $this->cart->getTotal()); 
       $this->view->marcas = Marcas::find();
       $this->view->receitas = Eventos::find();
       $this->view->setVar("banners",Banners::find([['local'=> 'P'], 'sort'=> array('ordem' => 1)]));     
       $this->view->setVar("minibanners",Banners::find([['local'=> 'M'], 'limit'=> 5,'sort'=> array('ordem' => 1)])); 
       $this->view->setVar("info_cat",Categorias::findbyId($id));
       $this->view->setVar("promocoes",Produtos::find([['lancamento' => "on"],'limit'=> 5,'sort'=> array('_id' => -1)]));
      //  $this->view->setVar("produtos_rand1",Produtos::find([['ativo' => "on"],'limit'=> 16,'sort'=> array('created_at' => -1)]));
       $this->view->setVar('produtos_rand1', Produtos::aggregate([['$sample' => ['size' => 16]]]));
       $this->view->setVar("castanhas",Produtos::find(['conditions' => array('categoria_nome' => 'Castanhas'),'ativo' => "on", 'limit'=> 4]));
       $this->view->setVar("temperos",Produtos::find(['conditions' => array('categoria_nome' => 'Temperos'),'ativo' => "on", 'limit'=> 4]));
       $this->view->setVar("graos",Produtos::find(['conditions' => array('categoria_nome' => 'Grãos e Sementes'),'ativo' => "on", 'limit'=> 4]));
       $this->view->setVar("farinhas",Produtos::find(['conditions' => array('categoria_nome' => 'Farinhas'),'ativo' => "on", 'limit'=> 4]));
       $this->view->setVar("cat1",Produtos::find([['produto_destaque' => "on"], 'ativo' => "on", 'limit'=> 12,'sort'=> array('_id' => -1)])); 
       
       $this->view->setVar("destaques",Produtos::find(array("conditions" => array(
         "produto_destaque" => 'on',
         '$and' => [[
             'ativo' => 'on'
         ]]
         ),'limit'=> 8,'sort'=> array('nome' => 1)))); 
       $this->view->notificafrete = Fretes::findFirst(array("conditions" => array("status" => 'Ativo'),'limit' => 1));
       $maisvend = Produtos::comprasmensais();        
       $this->view->setVar("maisvendidos",$maisvend);
    }
} 
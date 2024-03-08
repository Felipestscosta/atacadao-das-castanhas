<?php
class ErrorController extends ControllerBase

{
    public function notFoundAction()
    {
        $this->view->setTemplateAfter('_body');
        $this->view->setVar("todascategorias",Categorias::find(['limit'=> 11,'sort'=> array('categoria_nome' => 1)])); 
        $this->view->setVar("categorias",Categorias::find(['limit'=> 11,'sort'=> array('categoria_nome' => 1)])); 
        $this->view->sobre = Configuracoes::findFirst()->institucional['sobre'];
        // The response is already populated with a 404 Not Found header.
    }

    public function uncaughtExceptionAction()
    {
        // You need to specify the response header, as it's not automatically set here.
        //$this->response->setStatusCode(500, 'Internal Server Error');
    }
}
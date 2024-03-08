<?php

class ContaController extends ControllerBase
{
   
    public function senhaAction() {        
        $nova_senha = $this->security->hash($_POST['senha']); // Hash de senha        
        $cliente = Clientes::findbyId($_POST['id']);
        $cliente->senha = $nova_senha;
        $cliente->save();
    }
    
    public function dadosAction() {
        $id = $_POST['id'];
        unset($_POST['id']);
        $cliente = Clientes::findbyId($id);
        foreach($_POST as $key => $value){
           $cliente->$key = $value;
        }
        unset($_POST['sobrenome_novo']);       
        $cliente->save();
    }
    
    public function insereclienteAction() {
        $existecad = Clientes::find(array("conditions" => array(
            "email" => $_POST['email'],
            '$or' => [[
                'cpf' => $_POST['cpf']
            ]]
        ))); 
        if((isset($existecad)) && (!empty($existecad))){
            return $this->response->setJsonContent(array('status' => false));
        }
        else{
            $cliente = new Clientes();
       
            foreach($_POST as $key => $value){
                 $cliente->$key = $value;
            }   
     
            // Hash de Senha
            if($this->request->getPost('senha') == true){
                 $senha = $this->request->getPost('senha');
                 $cliente->senha = $this->security->hash($senha);
            }
     
            $nome = trim($_POST['nome']);
            $sobrenome = trim($_POST['sobrenome']);
            $email = mb_strtolower($_POST['email']);
           // unset($_POST['sobrenome']);
            $cliente->nome = preg_replace("#(\s)+#", " ", $nome);
            $cliente->sobrenome = preg_replace("#(\s)+#", " ", $sobrenome);
            $cliente->email = $email;
     
            $cliente->validado = true;
            $cliente->save();
            
            $user = Clientes::findFirst([['email' => $email]]);

            if((!empty($user->sobrenome)) && (!empty($user->sobrenome))){
                $this->session->set('sobrenome',$user->sobrenome);
            } 
            
            $this->session->set('id',$user->_id);
            $this->session->set('nome',$user->nome);
            $this->session->set('email',$user->email);
            
            if(!empty($this->cart->getContent())){      
                 return $this->response->setJsonContent(array('status' => true, 'url' => 'checkout'));
             }
             else{
                 return $this->response->setJsonContent(array('status' => true, 'url' => 'paginas/minhaconta'));            
             }
        }
     
    }
    
    public function localizacaoAction() {
        $id = $_POST['id'];
        unset($_POST['id']);
        $cliente = Clientes::findbyId($id);
        foreach($_POST as $key => $value){
           $cliente->$key = $value;
        }
        $cliente->save();
    }


}
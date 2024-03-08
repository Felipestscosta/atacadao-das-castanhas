<?php
use MetzWeb\Instagram\Instagram;
use Phalcon\Mvc\Dispatcher;
class MigracaoController extends ControllerBase
    {
        function initialize(){
        
        }  

     public function exportamarcaAction(){  
        $this->view->disable();
        $xml = Migracao::xmlmarcas();        
      
        foreach ($xml->item as $value) {
             $marcas = Marcas::findFirst(array('conditions' => array('codigo' => (int)$value->codigo_m) ));
       
            if (!$marcas){                
                    $newcat = new Marcas;
                    $newcat->codigo = (int)$value->codigo_m;
                    $newcat->nome = (string)$value->ds_marca;
                    $newcat->save();                
            }  
    
            else{
               // $categoria->categoria_id = $categoria->_id;  
                $marcas->codigo = (int)$value->codigo_m;
                $marcas->nome = (string)$value->ds_marca;
                $marcas->save();  
            }  
               
        }  
            echo "<div class='alert alert-success' role='alert' style='color: #155724; background-color: #d4edda; border-color: #c3e6cb;padding: .75rem 1.25rem;
            margin-bottom: 1rem; border: 1px solid transparent;border-radius: .25rem;'>
            Marcas importados com sucesso!
            <br/><a href='{{ this.url.getBaseUri() }}icontrole/empresa#tab_3'>Voltar</a>
            </div>";           
    } 
        
    public function exportagrupoAction(){  
        
        $this->view->disable();        
        $xml = Migracao::xmlgrupo();
      
        foreach ($xml as $value) {
            $categoria = Categorias::findFirst(array('conditions' => array('codigo' => (int)$value->Grupo) ));  
               
            if (!$categoria){              
                    $newcat = new Categorias;
                    $newcat->codigo = (int)$value->Grupo;
                    $newcat->categoria_nome = (string)$value->Descricao_Do_grupo;                                     
                    $newcat->save();  
                                  
            }  
    
            else{                
                $categoria->codigo = (int)$value->Grupo;
                $categoria->categoria_nome = (string)$value->Descricao_Do_grupo;                
                $categoria->save();  
            }           
               
        }  
            echo "<div class='alert alert-success' role='alert' style='color: #155724; background-color: #d4edda; border-color: #c3e6cb;padding: .75rem 1.25rem;
            margin-bottom: 1rem; border: 1px solid transparent;border-radius: .25rem;'>
            Grupos Importados com Sucesso!           
            </div>";
           
    }    
                     

    public function exportasubgrupoAction(){
        $this->view->disable();
        $xml = Migracao::xmlsubgrupo();      
      
        foreach ($xml as $value) {               
            $categoria = Categorias::findFirst(array('conditions' => array('codigo' => (int)$value->Grupo)));           
            $subcategoria = subcategorias::findFirst(array("conditions" => array("codigosub" => (int)$value->Sub_Grupo,'$and' => [["categoria_id" => new MongoId($categoria->_id->{'$id'})]]))); 
            
            if(!($subcategoria)){   
               $novasub = new subcategorias;
               $novasub->categoria_id = new MongoId($categoria->_id->{'$id'});
               $novasub->codigosub = (int)$value->Sub_Grupo;                       
               $novasub->subcategoria_nome = (string)$value->Descricao_Sub_Grupo;
               $novasub->save();                
            }
            else{
                $subcategoria->categoria_id = new MongoId($categoria->_id->{'$id'});               
                $subcategoria->codigosub = (int)$value->Sub_Grupo;                       
                $subcategoria->subcategoria_nome = (string)$value->Descricao_Sub_Grupo;
                $subcategoria->save(); 
            }                    
        }
        echo "<div class='alert alert-success' role='alert' style='color: #155724; background-color: #d4edda; border-color: #c3e6cb;padding: .75rem 1.25rem;
            margin-bottom: 1rem; border: 1px solid transparent;border-radius: .25rem;'>
            Subgrupos importados com sucesso!           
            </div>";
    }

    public function exportaprodutoAction(){
        $this->view->disable();
        $xml = Migracao::xmlproduto();
       // $xmlvariacao = Migracao::xmlvariacao();          
      
        foreach ($xml as $value) {            
            $categoria = Categorias::findFirst(array('conditions' => array('codigo' => (int)$value->Grupo)));                      
            $subcategoria = subcategorias::findFirst(array("conditions" => array("codigosub" => (int)$value->Sub_Grupo,'$and' => [["categoria_id" => new MongoId($categoria->_id->{'$id'})]]))); 
            $produtos = Produtos::findFirst(array('conditions' => array('codigoprod' => (int)$value->CódigoProduto) ));    
           // $marca = Marcas::findFirst(array('conditions' => array('codigo' => (int)$value->cd_marca)));      
            $altura = str_replace(',','.',$value->Altura);
            $altura = ($altura * 100);
            $largura = str_replace(',','.',$value->Largura);
            $largura = ($largura * 100);
            $comprimento = str_replace(',','.',$value->Profundidade);
            $comprimento = ($comprimento * 100);

            if (!$produtos) {
                $produtos = new Produtos;  
            }   
            $peso = (trim($value->nr_peso / 1000));
            if((isset($categoria)) && (!empty($categoria))){                   
                $novo->categoria = new MongoId($categoria->_id->{'$id'});                
            }
            if((isset($subcategoria)) && (!empty($subcategoria))){                    
                $novo->subcategoria = new MongoId($subcategoria->_id->{'$id'});
            }
            
            $produtos->nome = (string)$value->Descrição;
            $produtos->descricao = (string)$value->Descrição;
            $produtos->description = (string)$value->Descrição;
            $produtos->keywords = (string)$value->Descrição;  
            // $produtos->ativo = (string)$value->cd_situacao; 
            //$produtos->marca = new MongoId($marca->_id->{'$id'});           

            $produtos->peso = (double)$peso;
            $produtos->largura = (string)$largura;
            $produtos->comprimento = (string)$comprimento;
            $produtos->altura = (string)$altura;             
            $produtos->codigoprod = (int)$value->CódigoProduto;                 

            $variacoes[] = array(
                'cor' => '',
                'tamanho' => '',
                'estoque' => (int)$value->EstoqueAtual,
                'valor' => (float)$value->PreçoAvista
            );                
                
            // $produtos->variacoes = $variacoes;
            $produtos->variacoes[0]['valor'] = (float)$value->vr_fiscal;
            
            
            $produtos->save();
           }
       
            echo "<div class='alert alert-success' role='alert' style='color: #155724; background-color: #d4edda; border-color: #c3e6cb;padding: .75rem 1.25rem;
                margin-bottom: 1rem; border: 1px solid transparent;border-radius: .25rem;'>
                Produtos importados com sucesso!           
            </div>";
    }

    
    public static function updatetesteAction(){
        $produtos = Produtos::find();
        foreach($produtos as $key => $value){             
            if((isset($value->marca)) && (!empty($value->marca))){               
                $produtos->marca = new MongoId($value->marca);  
                $produtos->save();     
            }     
                   
        }  
           
       echo "ok";
    }

}
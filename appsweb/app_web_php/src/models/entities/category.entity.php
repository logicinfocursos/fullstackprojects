<!-- src\models\entities\category.entity.php -->
<?php

class CategoryEntity 
{
    public $id;
    public $name;    
    public $created_at;
    public $updated_at;
    public $products;


    public function __construct($id='', $name='', $created_at='', $updated_at='', $products='')
    {
        $this->id = $id;
        $this->name = $name;        
        $this->created_at = $created_at;
        $this->updated_at = $updated_at;
        $this->products = $products;
    }    
}

<!-- src\models\entities\product.php -->
<?php

class ProductEntity 
{
    public $id;
    public $name;
    public $details;
    public $price;
    public $inCart;
    public $isFavorite;
    public $category_id;
    public $category;
    public $image;
    public $status;
    public $created_at;
    public $updated_at;


    public function __construct($id='', $name='', $details='', $price='', $inCart='', $isFavorite='', $category_id='', $category='', $image='', $status='', $created_at='', $updated_at='')
    {
        $this->id = $id;
        $this->name = $name;
        $this->details = $details;
        $this->price = $price;
        $this->inCart = $inCart;
        $this->isFavorite = $isFavorite;
        $this->category_id = $category_id;
        $this->category = $category;
        $this->image = $image;
        $this->status = $status;
        $this->created_at = $created_at;
        $this->updated_at = $updated_at;
    }    
}

<!-- src\models\repositories\productRepository.php -->
<?php

require_once "./src/models/repositories/base.repository.php";
require_once "./src/models/entities/product.entity.php";


class ProductRepository extends BaseRepository
{
    public function __construct()
    {
        parent::__construct('products');
    }

    protected function mapToItem($data)
    {
        //return $this->mapToProduct($data);
        return $data;
    }
    public function mapToProduct($data)
    {
        //return $data;
        return new ProductEntity(
            $data['id'],
            $data['name'],
            $data['details'],
            $data['price'],
            $data['inCart'],
            $data['isFavorite'],
            $data['category_id'],
            $data['category'],
            $data['image'],
            $data['status'],
            $data['created_at'],
            $data['updated_at']            
        );
    }
}
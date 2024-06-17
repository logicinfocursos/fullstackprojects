<!-- src\controllers\products.controller.php -->
<?php
require_once "./src/views/products/product.view.php";
require_once "./src/views/cart/cart.view.php";
require_once "./src/models/repositories/product.repository.php";
require_once "./src/models/repositories/category.repository.php";

class ProductsController
{
    private $productRepository;
    private $categoryRepository;

    public function __construct()
    {
        $this->productRepository = new ProductRepository();
        $this->categoryRepository = new CategoryRepository();

    }

    public function details()
    {
        $code = $_GET["code"];

        $product = $this->productRepository->getById(intval($code));
        $product = $product[0];

        // $relatedProducts = $this->productRepository->getByField("category_id", $product["category_id"]);
        $products = $this->productRepository->getAll();

        $relatedProducts = array_filter($products, function ($p) use ($product) {
            return $p["id"] != $product["id"];
        });

        $relatedProducts = array_slice($relatedProducts, 0, 4);      
        
        $category = $this->categoryRepository->getById($product["category_id"]);

        $data['title'] = 'detalhes do produto' . ' (' . $product["name"] . ')';
        $data['product'] = $product;
        $data['category'] = $category;
        $data['relatedProducts'] = $relatedProducts;

        productView($data);
    }


    public function cart()
    {
        $products = $this->productRepository->getAll();

        $cartList = array_filter($products, function($p) {
            return $p["inCart"] && $p["status"] == 1;
        });

        $total = 0;
        foreach($cartList as $item) {
            $total += $item["price"];
        }

        $data['title'] = 'meu carrinho' ;
        $data['cartList'] = $cartList;
        $data['total'] = $total;

        cartView($data);
    }
}

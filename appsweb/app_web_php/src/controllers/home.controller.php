<!-- src\controllers\main.controller.php -->
<?php
require_once "./src/views/home/home.view.php";
require_once "./src/models/repositories/product.repository.php";
require_once "./src/models/repositories/category.repository.php";



class HomeController {

    public function index()
    {
        $productRepository = new ProductRepository();
        $products = $productRepository->getAll();

        $categoryRepository = new CategoryRepository();
        $categories = $categoryRepository->getAll();
        
        $data['title'] = 'destaques';
        $data['subtitle'] = '(nossos campeões de vendas)';
        $data["products"] = $products;
        $data["categories"] = $categories;

        homeView($data);
    }
}
<!-- src\views\home\home.view.php -->
<?php
include_once "./src/views/products/components/productlist.component.php";
include_once './src/views/components/layout/myheader.component.php';

function homeView($data)
{
    $title = $data['title'];
    $subtitle = $data['subtitle'];
    $products = $data['products'];
    $categories = $data['categories'];
    $configurations = $_SESSION["configurations"];
    
    myheader();
    productlist($products,  $title, $subtitle);

?>
    </div>
<?php }

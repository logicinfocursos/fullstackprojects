<?php
include_once "./src/views/products/productlist.component.php";

function homeView($data)
{
    $title = $data['title'];
    $subtitle = $data['subtitle'];
    $products = $data['products'];
    $categories = $data['categories'];
    $configurations = $_SESSION["configurations"];

        productlist($products,  $title, $subtitle);

        ?>
    </div>
<?php }

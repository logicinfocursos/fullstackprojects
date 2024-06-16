<?php
include_once "./src/views/products/productcard.component.php";



function productlist($products, $title, $subtitle)
{
?>
    <header class="mt-3">
        <div class="container">
            <div class="text-center">
                <h1 class="display-5 fw-bolder"><?= $title ?></h1>
                <p class="lead fw-normal mb-0"><?= $subtitle ?></p>
            </div>
        </div>
        <section class="">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <?php foreach ($products as $product) {

                        if ($product["status"] != 1)  continue;

                        productcard($product);
                    } ?>

                </div>
            </div>
        </section>

    <?php
}

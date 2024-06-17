<!-- views\products\components\productlist.component.php -->
<?php
include_once "./src/views/products/components/productcard.component.php";



function productlist($products, $title=null, $subtitle=null)
{
?>
    <header class="mt-3">
        <div class="container">
            <div class="text-center">
                <?php if ($title) { ?>
                    <h1 class="display-5 fw-bolder"><?= $title ?></h1>
                <?php } ?>
                <?php if ($subtitle) { ?>
                    <p class="lead fw-normal mb-0"><?= $subtitle ?></p>
                <?php } ?>

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

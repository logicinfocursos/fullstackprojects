<!-- src\views\products\product.view.php -->
<?php
include_once './src/views/products/components/productlist.component.php';
include_once './src/views/components/layout/breadcrumb.component.php';



function productView($data)
{
    $product = $data['product'];
    $relatedProducts = $data['relatedProducts'];
    $category = $data['category'];
    $title = $data['title'];
?>
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">

            <?php breadcrumb("produto: " . substr($product['name'], 0, 50)); ?>

            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6">
                    <img class="card-img-top mb-5 mb-md-0" src="<?= $product['image'] ?>" alt="<?= $product['name'] ?>" title="<?= $product['name'] ?>" />
                </div>
                <div class="col-md-6">
                    <div class="small mb-1">SKU: prod<?= $product['id'] ?></div>
                    <h1 class="display-5 fw-bolder"><?= substr($product['name'], 0, 50) ?></h1>
                    <small><?= $category["name"]?></small>
                    <div class="fs-5 mb-5 mt-5">
                        <h1>R$ <?= number_format($product["price"], 2, ",", ".") ?></h1>
                    </div>
                    <p class="lead"><?= substr($product['details'], 0, 300) ?></p>
                    <div class="d-flex">
                        <button class="btn btn-outline-dark flex-shrink-0" type="button" disabled>
                            <i class="bi-cart-fill me-1"></i>
                            comprar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <?php productlist($relatedProducts, 'produtos relacionados'); ?>

<?php
}

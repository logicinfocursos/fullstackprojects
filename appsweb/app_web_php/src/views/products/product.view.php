<!-- src\views\products\product.view.php -->
<?php
include_once './src/views/products/components/productlist.component.php';



function productView($data)
{
    $product = $data['product'];
    $relatedProducts = $data['relatedProducts'];
    $category = $data['category'];
    $title = $data['title'];
    $configurations = $_SESSION["configurations"];   
?>
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="<?= $product['image'] ?>" alt="..." /></div>
                <div class="col-md-6">
                    <div class="small mb-1">SKU: prod<?= $product['id'] ?></div>
                    <h1 class="display-5 fw-bolder"><?= substr($product['name'],0,50) ?></h1>
                    <div class="fs-5 mb-5">
                        <span>R$ <?= $product['price'] ?></span>
                    </div>
                    <p class="lead"><?= substr($product['details'], 0, 300) ?></p>
                    <div class="d-flex">
                        <button class="btn btn-outline-dark flex-shrink-0" type="button">
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

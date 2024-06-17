<!-- src\views\products\components\productcard.component.php -->
<?php function productcard($product)
{ ?>

    <div class="col mb-5">
        <div class="card h-100">

            <a href="/product/<?= $product['id'] ?>"><img class="card-img-top" src="<?= $product['image'] ?>" alt="..." height="200" /></a>

            <div class="card-body p-4">
                <div class="text-center">
                    <h5 class="fw-bolder"><?= substr($product['name'], 0, 25) ?></h5>
                    R$ <?= number_format($product["price"], 2, ",", ".") ?>
                </div>
            </div>

            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/product/<?= $product['id'] ?>">comprar</a></div>
            </div>
        </div>
    </div>

<?php }

<?php function productcard($product)
{ ?>

    <div class="col mb-5">
        <div class="card h-100">

            <img class="card-img-top" src="<?= $product['image'] ?>" alt="..." height="200" />

            <div class="card-body p-4">
                <div class="text-center">

                    <h5 class="fw-bolder"><?= substr($product['name'], 0, 25) ?></h5>

                    R$ <?= $product['price'] ?>
                </div>
            </div>

            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/products/<?= $product['id'] ?>">comprar</a></div>
            </div>
        </div>
    </div>

<?php }

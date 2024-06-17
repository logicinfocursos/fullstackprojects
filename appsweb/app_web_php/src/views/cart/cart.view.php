<!-- src\views\cart\cart.view.php -->
<?php
function cartView($data){ 
    
    $products = $data['cartList'];
    $title = $data['title'];
    $total = $data['total'];

    ?>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="display-5 fw-bolder">Carrinho de Compras</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th></th>
                            <th>produto</th>
                            <th>qtd</th>
                            <th>R$</th>
                            <th>subtotal</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($products as $product) { ?>
                            <tr>
                                <td><a href="product/<?= $product['id']?>"><img src="<?= $product["image"] ?>" alt="<?= $product["name"] ?>" width="50"></a></td>
                                <td><a href="product/<?= $product['id']?>"><?= substr($product["name"],0,50) ?></a></td>
                                <td>1</td>
                                <td>R$ <?= number_format($product["price"], 2, ",", ".") ?></td>
                                <td>R$ <?= number_format($product["price"], 2, ",", ".") ?></td>
                                <td><a href="#" class="btn btn-danger">Remover</a></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3"></td>
                            <td><strong>Total</strong></td>
                            <td><strong>R$ <?= number_format($total, 2, ",", ".") ?></strong></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>

<?php }
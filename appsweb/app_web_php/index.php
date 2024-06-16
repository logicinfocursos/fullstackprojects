<?php
include './src/views/components/layout/HTMLHEADER.php';
//include 'src/routes/routes.php';
include_once './src/controllers/home.controller.php';
include_once './src/views/components/layout/navbar.component.php';
include_once './src/views/components/layout/myheader.component.php';
include_once './src/views/components/layout/footer.component.php';

if (isset($_SESSION)) {
    session_start();
}

$url = "./src/configurations/setup.json";
$json = file_get_contents($url);
$data = json_decode($json);
$_SESSION["configurations"] = $data;

$url = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
?>
<div class="page-wrapper">

    <?php

    navbar();
    myheader();
    $homeController = new HomeController();
    $homeController->index();

    // $router = new Router($data->routes);
    // $router->route($url);
    // routes($url, $data->routes);
    footer();
    ?>

</div>

<?php




?>

<?php
include './src/views/components/layout/HTMLFOOTER.php';
?>
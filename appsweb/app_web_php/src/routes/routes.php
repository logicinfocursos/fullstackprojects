<!-- src\routes\routes.php -->
<?php

require_once 'router.php';

function routes($url=null, $routesList=null)
{
    if (preg_match('/\/product\/(\d+)/', $url, $matches)) {
        $_GET["code"] = $matches[1];
    }

    $router = new Router($routesList);
    $router->route($url);
}
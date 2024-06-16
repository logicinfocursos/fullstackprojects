<?php

require_once 'router.php';

function routes($url=null, $routesList=null)
{
    if (isset($url) && str_contains($url, '/site')) {

        // se for encontrado '/site' na URL, remove para que a rota seja encontrada (no provedor sempre ocorra a inclusão de '/site' na URL)
        $url = str_replace('/site', '', $url);
    }
    
    $router = new Router($routesList);
    $router->route($url);
}
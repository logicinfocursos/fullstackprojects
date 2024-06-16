<?php

require_once 'src/controllers/home.controller.php';

class Router
{
    private $routes;

    public function __construct(array $routes)
    {
        $this->routes = $routes;
    }

    public function route($url)
    {       
        foreach ($this->routes as $route) {

            if ($route->route === $url && $route->status == 1) {

                $this->callControllerAction($route);

                return;
            }
        }

        //$errorPage = new MainController();
        //$errorPage->errorPage("404 - página não encontrada!!!");  
    }

    private function callControllerAction($route)
    {
        
        // $controllerFile = $route->controller;
        $controllerClass = ucfirst($route->controller);

        $controllerFile = 'src/controllers/' . strtolower($route->controller) . 'controller.php';

        require_once $controllerFile; 

        $controllerInstance = new $controllerClass();
        $action = $route->action;

        $controllerInstance->$action();
    }
}
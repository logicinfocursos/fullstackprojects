<!-- src\routes\router.php -->
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
            $pattern = preg_replace('(:\w+)', '(\w+)', $route->route);
            if (preg_match('@^' . $pattern . '$@', $url, $matches) && $route->status == 1) {
                array_shift($matches);
                $this->callControllerAction($route, $matches);
                return; 
            }
        }

        //$errorPage = new MainController();
        //$errorPage->errorPage("404 - página não encontrada!!!");  
    }

    private function callControllerAction($route)
    {
        $controllerClass = ucfirst($route->controller).'Controller';

        $controllerFile = './src/controllers/' . strtolower($route->controller) . '.controller.php';

        require_once $controllerFile; 

        $controllerInstance = new $controllerClass();
        $action = $route->action;

        if (isset($params[0])) {
            return $controllerInstance->$action($params[0]);
        } else {
            return $controllerInstance->$action();
        }
    }
}
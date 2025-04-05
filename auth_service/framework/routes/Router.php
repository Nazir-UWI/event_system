<?php

namespace framework\routes;
class Router{
    private $controller;
    private $method;
    private $model;

    private $routes = [
        '#^/register$#' => [ 
            'controller' => 'RegisterController',
            'model' => 'RegisterModel',
            'POST' => 'register'
        ],
        '#^/login$#' => [ 
            'controller' => 'LoginController',
            'model' => 'LoginModel',
            'POST' => 'login'
        ],
        '#^/user$#' => [ 
            'controller' => 'UserController',
            'model' => 'UserModel',
            'GET' => 'user'
        ]
    ];

    
    public function __construct(){
    }

        
    public function route($path, $httpMethod){

        foreach ($this->routes as $route => $info){                                                             
            $path = str_replace("\\", "/", $path);                  // Convert \ to /

            if (preg_match($route, $path, $matches)) {
                $this->controller = $info['controller'];
                $this->model = $info['model'];

                if (!isset($info[$httpMethod])){
                    return false;
                }

                $this->method = $info[$httpMethod];
                return true;
            }
        }
        return false;
    }
    

    public function getController(){
		return $this->controller;
	}
    public function getMethod(){
		return $this->method;
	}
    public function getModel(){
		return $this->model;
	}


}
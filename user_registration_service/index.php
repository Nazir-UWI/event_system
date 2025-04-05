<?php 

header('Content-Type: application/json');

require_once "./config/config.php";
require_once AUTOLOADER_DIR."/Psr4AutoloaderClass.php";

$loader = new \framework\autoloader\Psr4AutoloaderClass();

$loader->register();

$loader->addNamespace('app\controller', CONTROLLER_DIR);
$loader->addNamespace('app\model', MODEL_DIR);
$loader->addNamespace('app\view', VIEW_DIR);

$loader->addNamespace('framework\autoloader', AUTOLOADER_DIR);
$loader->addNamespace('framework\class_abstract', CLASSABSTRACT_DIR);
$loader->addNamespace('framework\routes', ROUTES_DIR);



$data = json_decode(file_get_contents('php://input'), true);

$request_uri = explode('/', $_SERVER['REQUEST_URI']);
$request_uri = array_slice($request_uri, 1);
$path = implode('/', $request_uri);
$path = '/'.$path;

$httpMethod = $_SERVER['REQUEST_METHOD'];


$router = new \framework\routes\Router();

if (!$router->route($path, $httpMethod)) {                                                                        // if no route is found

    echo json_encode(["error" => "404 $path Not Found"]);
    return;
} 


$controllerName = "\app\controller\\{$router->getController()}";
$methodName = $router->getMethod();
$modelName = "\app\model\\{$router->getModel()}";
$viewName = 'app\view\View';

$controller = new $controllerName();
$model = new $modelName();
$view = new $viewName();

$controller->setModel($model);
$controller->setView($view);

$controller->$methodName();

?>
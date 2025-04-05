<?php

namespace app\controller;
class LoginController extends \framework\class_abstract\Abstract_Controller {

    public function login(){
        $data = json_decode(file_get_contents('php://input'), true);

        if (!isset($data['email']) || !isset($data['password'])) {
            $this->view->setOutput("error", "Missing Fields");
            $this->view->display();
            return;
        }

        $email = $data['email'];
        $password = $data['password'];

        try{
            $api_key = $this->model->fetchApiKey($email, $password);
            $this->model->loginUser($api_key);

            $this->view->setOutput("success", "User Logged In");

        }catch(\Exception $e){
            $this->view->setOutput("error", $e->getMessage());

        }finally{
            $this->view->display();
        }
    }

}


?>
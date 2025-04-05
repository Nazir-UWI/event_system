<?php

namespace app\controller;
class RegisterController extends \framework\class_abstract\Abstract_Controller {

    public function register(){
        $data = json_decode(file_get_contents('php://input'), true);
    
        if (!isset($data['email']) || !isset($data['password'])) {
            $this->view->setOutput("error", "Missing Fields");
            $this->view->display();
            return;
        }

        if (!$this->validatePassword($data['password'])){
            $this->view->display();
            return;
        }

        $email = $data['email'];
        $password = password_hash($data['password'], PASSWORD_BCRYPT);
        $raw_key = md5(uniqid(mt_rand(), true));
        $api_key = substr($raw_key, 0, 3) . '-' . 
                    substr($raw_key, 3, 4) . '-' . 
                    substr($raw_key, 7, 3);

        try{
            $this->model->userRegister($email, $password, $api_key);
            $this->view->setOutput("success", "User Registered");
            $this->view->setOutput("api_key", $api_key);

        }catch(\Exception $e){
            $this->view->setOutput("error", $e->getMessage());

        }finally{
            $this->view->display();
        }
        
    }

    public function validatePassword($password){

        if (strlen($password) < 5){
            $this->view->setOutput("error", "Password too short");
            return false;
        }
        if (!preg_match('/[a-z]/', $password)){
            $this->view->setOutput("error", "Password Must Contain Lowercase");
            return false;
        }
        if (!preg_match('/[A-Z]/', $password)){
            $this->view->setOutput("error", "Password Must Contain Uppercase");
            return false;
        }
        if (!preg_match('/[0-9]/', $password)){
            $this->view->setOutput("error", "Password Must Contain Number");
            return false;
        }

        return true;

    }

}


?>
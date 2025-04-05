<?php

namespace app\controller;
class UserController extends \framework\class_abstract\Abstract_Controller {

    public function user(){
        $data = json_decode(file_get_contents('php://input'), true);

        if (!isset($data['email'])) {
            $this->view->setOutput("error", "Missing Fields");
            $this->view->display();
            return;
        }

        $email = $data['email'];
            
        try{
            $user_info = $this->model->getUserInfo($email);
            $this->view->setOutput("user_info", $user_info);

        }catch(\Exception $e){
            $this->view->setOutput("error", $e->getMessage());

        }finally{
            $this->view->display();
        }


    }

}


?>
<?php

namespace app\controller;
class UserRegistrationController extends \framework\class_abstract\Abstract_Controller {

    public function registerUserEvent(){
        $data = json_decode(file_get_contents('php://input'), true);
        $request_uri = explode('/', $_SERVER['REQUEST_URI']);
    
        if (!isset($data['api_key'])) {
            $this->view->setOutput("error", "Missing Fields");
            $this->view->display();
            return;
        }

        $api_key = $data['api_key'];
        $event_id = $request_uri[2];

        try{
            $user_id = $this->model->getUserId($api_key);
            $this->model->registerForEvent($user_id, $event_id);
            $this->view->setOutput("success", "User Registered for Event");

        }catch(\Exception $e){
            $this->view->setOutput("error", $e->getMessage());

        }finally{
            $this->view->display();
        }

    }


    public function listUserEvents(){
        $data = json_decode(file_get_contents('php://input'), true);
        $request_uri = explode('/', $_SERVER['REQUEST_URI']);
    
        $user_id = $request_uri[2];

        try{
            $events = $this->model->getUserEvents($user_id);
            $this->view->setOutput("events", $events);

        }catch(\Exception $e){
            $this->view->setOutput("error", $e->getMessage());

        }finally{
            $this->view->display();
        }

    }


}


?>
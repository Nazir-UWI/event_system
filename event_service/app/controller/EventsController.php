<?php

namespace app\controller;
class EventsController extends \framework\class_abstract\Abstract_Controller {

    public function listEvents(){           //GET
        try{
            $events_list = $this->model->getEvents();
            $this->view->setOutput("events_list", $events_list);
            
        }catch(\Exception $e){
            $this->view->setOutput("error", $e->getMessage());

        }finally{
            $this->view->display();
        }
    }


    public function newEvent(){             //POST
        $data = json_decode(file_get_contents('php://input'), true);
    
        if (!isset($data['api_key'])) {
            $this->view->setOutput("error", "Missing fields");
            $this->view->display();
            return;
        }

        $api_key = $data['api_key'];
        $event_name = $data['event_name'];
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $location = $data['location'];
        $price = $data['price'];

        try{
            $created_by = $this->model->findEmailByApiKey($api_key);
            $this->model->createEvent($event_name, $start_date, $end_date, $location, $price, $created_by);
            $this->view->setOutput("message", "Event Registered");

        }catch(\Exception $e){
            $this->view->setOutput("error", $e->getMessage());

        }finally{
            $this->view->display();
        }

    }


    public function getEventById(){         //GET
        // $data = json_decode(file_get_contents('php://input'), true);
        $request_uri = explode('/', $_SERVER['REQUEST_URI']);
    
        // if (!isset($data['api_key'])) {
        //     $this->view->setOutput("error", "Missing fields");
        //     $this->view->display();
        //     return;
        // }

        $event_id = $request_uri[2];

        try{
            $event_info = $this->model->getInfoByEventId($event_id);
            $this->view->setOutput("event_info", $event_info);

        }catch(\Exception $e){
            $this->view->setOutput("error", $e->getMessage());

        }finally{
            $this->view->display();
        }
    }

    
    public function updateEventById(){      //PUT
        $data = json_decode(file_get_contents('php://input'), true);
        $request_uri = explode('/', $_SERVER['REQUEST_URI']);
    
        if (!isset($data['api_key'])) {
            $this->view->setOutput("error", "Missing fields");
            $this->view->display();
            return;
        }

        $api_key = $data['api_key'];
        $event_id = $request_uri[2];
        $event_name = $data['event_name'];
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $location = $data['location'];
        $price = $data['price'];

        try{
            $created_by = $this->model->findEmailByApiKey($api_key);
            $this->model->updateEvent($event_id, $event_name, $start_date, $end_date, $location, $price, $created_by);
            $this->view->setOutput("message", "Event updated");

        }catch(\Exception $e){
            $this->view->setOutput("error", $e->getMessage());

        }finally{
            $this->view->display();
        }
    }


    public function deleteEventById(){      //DELETE
        $data = json_decode(file_get_contents('php://input'), true);
        $request_uri = explode('/', $_SERVER['REQUEST_URI']);
    
        if (!isset($data['api_key'])) {
            $this->view->setOutput("error", "Missing fields");
            $this->view->display();
            return;
        }

        $api_key = $data['api_key'];
        $event_id = $request_uri[2];

        try{
            $created_by = $this->model->findEmailByApiKey($api_key);
            $this->model->deleteEvent($event_id, $created_by);
            $this->view->setOutput("message", "Event deleted");

        }catch(\Exception $e){
            $this->view->setOutput("error", $e->getMessage());

        }finally{
            $this->view->display();
        }
    }



}


?>
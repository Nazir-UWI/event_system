<?php

namespace framework\class_abstract;
abstract class Abstract_Controller{
    
    protected $model;
    protected $view;
    
    public function __construct(){
    }

    
    public function setModel($model){
        $this->model = $model;
    }

    public function setView($view){
        $this->view = $view;
    }


}
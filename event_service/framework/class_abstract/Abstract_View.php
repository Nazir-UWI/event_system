<?php

namespace framework\class_abstract;
abstract class Abstract_View{
    
    protected $output = [];
    
    public function __construct() {
    }
    
    public function setOutput($key,$value){
		$this->output[$key] = $value;
	}

    
    public function display(){
        echo json_encode($this->output, JSON_PRETTY_PRINT);
    }
    
        
    
}
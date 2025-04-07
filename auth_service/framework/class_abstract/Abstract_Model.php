<?php

namespace framework\class_abstract;
abstract class Abstract_Model{
	
    protected $conn;
	protected $redis;

    public function __construct(){             //constructor
		// $servername = "database_service";
        // $username = "root";
        // $password = "root";
        // $dbname = "event_management";

		// $this->conn = new \mysqli($servername, $username, $password, $dbname);      //create connection to server

		$servername = "146.148.110.127";
        $username = "root";
        $password = "SecurePass123!";
        $dbname = "event_management";

		$this->conn = new \mysqli($servername, $username, $password, $dbname);      //create connection to server

		if ($this->conn->connect_error) {                                       //check connection
			die("Connection failed\n" . $this->conn->connect_error);
		}
		
		$this->redis = new \Redis();                               // Connect to Redis
		$this->redis->connect('redis', 6379);	
	}

    public function closeDatabaseConnection (){        //close connection to database
		$this->conn->close();
	} 

    
}
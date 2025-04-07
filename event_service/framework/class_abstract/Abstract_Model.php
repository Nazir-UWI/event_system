<?php

namespace framework\class_abstract;
abstract class Abstract_Model{
	
    protected $conn;
	protected $redis;

    public function __construct(){             //constructor	

		$servername = getenv('DB_HOST');
        $username 	= getenv('DB_USER');
        $password 	= getenv('DB_PASS');
        $dbname 	= getenv('DB_NAME');

		$redisHost 	= getenv('REDIS_HOST');
		$redisPort 	= getenv('REDIS_PORT');

		$this->conn = new \mysqli($servername, $username, $password, $dbname);      //create connection to server

		if ($this->conn->connect_error) {                                       //check connection
			die("Connection failed\n" . $this->conn->connect_error);
		}
		
		$this->redis = new \Redis();                               // Connect to Redis
		$this->redis->connect($redisHost, $redisPort);	
	}

    public function closeDatabaseConnection (){        //close connection to database
		$this->conn->close();
	} 

    
}
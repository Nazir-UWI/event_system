<?php

namespace app\model;
class RegisterModel extends \framework\class_abstract\Abstract_Model{

    public function userRegister($email, $password, $api_key){
        $stmt = $this->conn->prepare("SELECT email FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {                                          // Check if a user exists
            throw new \Exception("User Already Registered");
        }

        $stmt = $this->conn->prepare("INSERT INTO users (email, password, api_key) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $email, $password, $api_key);
        $stmt->execute();
    }



}


?>
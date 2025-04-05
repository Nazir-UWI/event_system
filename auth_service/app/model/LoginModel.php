<?php

namespace app\model;
class LoginModel extends \framework\class_abstract\Abstract_Model{

    public function fetchApiKey($email, $password){
        $cache_key = "auth_login_model";
        $cached_user_info = $this->redis->hGet($cache_key, $email);                      //fetch api_key from cache

        if($cached_user_info){                                                          //if api_key is cached return it
            // echo json_encode(["cache" => "data cached"]);
            $user_info = json_decode($cached_user_info, true);

            if (password_verify($password, $user_info['password_hash'])){
                return $user_info['api_key'];
            }else{
                throw new \Exception("Incorrect Password");
            }
        }
        // echo json_encode(["cache" => "data not cached"]);

        $stmt = $this->conn->prepare("SELECT password, api_key FROM users WHERE email = ?");                //query databse
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();
        $stmt->bind_result($password_hash, $api_key);
        $stmt->fetch();

        if ($stmt->num_rows > 0){                                                                           //if query returns cache user info
            $this->redis->hSet($cache_key, $email, json_encode(["password_hash" => $password_hash, "api_key" => $api_key]));
            $this->redis->expire($cache_key, 300);
        }else{
            throw new \Exception("Email Not Found");
        }

        if (!password_verify($password, $password_hash)){
            throw new \Exception("Incorrect Password");
        }

        return $api_key;
    }

    
    public function loginUser($api_key){
        $stmt = $this->conn->prepare("UPDATE users SET auth_flag = 1 WHERE api_key = ?");             //set auth flag 
        $stmt->bind_param("s", $api_key);
        $stmt->execute();
    }

}


?>
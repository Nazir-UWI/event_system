<?php

namespace app\model;
class UserModel extends \framework\class_abstract\Abstract_Model{

    public function getUserInfo($email){
        // $cache_key = "auth_user_model";
        // $cached_user_info = $this->redis->hGet($cache_key, $email);                      

        // if($cached_user_info){ 
        //     // echo json_encode(["cache" => "data cached"]);                                                         
        //     $user_info = json_decode($cached_user_info, true);
        //     return $user_info;
        // }

        // echo json_encode(["cache" => "data not cached"]);

        $stmt = $this->conn->prepare("SELECT * FROM users WHERE email = ? AND auth_flag = 1");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {                                          // Check if a user exists
            $stmt->bind_result($id, $email, $hash, $api_key, $auth_flag);
            $stmt->fetch();
                                                                                  
            $user_info = [                                                  // Store in an associative array
                "id" => $id,
                "email" => $email,
                "password_hash" => $hash,
                "api_key" => $api_key,
                "auth_flag" => $auth_flag
            ];

            // $this->redis->hSet($cache_key, $email, json_encode($user_info));
            // $this->redis->expire($cache_key, 300);

            return $user_info;
        
        }else {
            throw new \Exception("User Not Found");
        }
    }

}


?>
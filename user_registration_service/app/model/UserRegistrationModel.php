<?php

namespace app\model;
class UserRegistrationModel extends \framework\class_abstract\Abstract_Model{

    public function getUserId($api_key){
        $stmt = $this->conn->prepare("SELECT id FROM users WHERE api_key = ?");
        $stmt->bind_param("s", $api_key);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {                                          // Check if a user exists
            $stmt->bind_result($user_id);
            $stmt->fetch();

            return $user_id;
        }else {
            throw new \Exception("User Not Found");
        }
    }


    public function registerForEvent($user_id, $event_id){
        $stmt = $this->conn->prepare("SELECT * FROM events WHERE id = ?");
        $stmt->bind_param("i", $event_id);
        $stmt->execute();

        $result = $stmt->get_result();
        if ($result->num_rows == 0){									
            throw new \Exception("Event Not Found");
        }

        $stmt = $this->conn->prepare("INSERT INTO user_event_registration (user_id, event_id) VALUES (?, ?)");
        $stmt->bind_param("ii", $user_id, $event_id);
        $stmt->execute();
    }

    public function getUserEvents($user_id){
        $stmt = $this->conn->prepare("SELECT event_id FROM user_event_registration WHERE user_id = ?");
        $stmt->bind_param("s", $user_id);
        $stmt->execute();

        $result = $stmt->get_result();
        if ($result->num_rows > 0){									
			while ($row = $result->fetch_assoc() ){					
				$events[] = $row;
			}
            return $events;
		}else{
            throw new \Exception("No Events");
        }
    }

}


?>
<?php

namespace app\model;
class EventsModel extends \framework\class_abstract\Abstract_Model{

    public function findEmailByApiKey($api_key){
        // $cache_key = "event_email_api_key";
        // $email = $this->redis->hGet($cache_key, $api_key);                      //fetch api_key from cache

        // if($email){                                                          //if api_key is cached return it
        //     // echo json_encode(["cache" => "data cached"]);

        //     return $email;
        // }
        // // echo json_encode(["cache" => "data not cached"]);

        $stmt = $this->conn->prepare("SELECT email FROM users WHERE api_key = ?");
        $stmt->bind_param("s", $api_key);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {                                          // Check if a user exists
            $stmt->bind_result($email);
            $stmt->fetch();

            // $this->redis->hSet($cache_key, $api_key, $email);
            // $this->redis->expire($cache_key, 300);

            return $email;
        }else {
            throw new \Exception("Email Not Found");
        }
    }


    public function createEvent($event_name, $start_date, $end_date, $location, $price, $created_by){
        $stmt = $this->conn->prepare("INSERT INTO events (event_name, start_date, end_date, location, price, created_by) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssds", $event_name, $start_date, $end_date, $location, $price, $created_by);
        $stmt->execute();
    }


    public function getEvents(){
        // $cache_key = "event_events_list";
        // $cached_events = $this->redis->get($cache_key);                      //fetch api_key from cache

        // if($cached_events){                                                          //if api_key is cached return it
        //     // echo json_encode(["cache" => "data cached"]);

        //     return json_decode($cached_events);
        // }
        // // echo json_encode(["cache" => "data not cached"]);

        $stmt = $this->conn->prepare("SELECT event_name FROM events");
        $stmt->execute();

        $result = $stmt->get_result();
        if ($result->num_rows > 0){									
			while ($row = $result->fetch_assoc() ){					
				$events[] = $row;
			}

            // $this->redis->setex($cache_key, 300, json_encode($events));         // Store result in Redis (expires in 300 seconds)
            return $events;

		}else{
            throw new \Exception("No Events");
        }
    }


    public function getInfoByEventId($event_id){
        // $cache_key = "event_id_info";
        // $cached_event_info = $this->redis->hGet($cache_key, $event_id);                      //fetch api_key from cache

        // if($cached_event_info){                                                          //if api_key is cached return it
        //     // echo json_encode(["cache" => "data cached"]);

        //     return json_decode($cached_event_info, true);
        // }
        // // echo json_encode(["cache" => "data not cached"]);

        $stmt = $this->conn->prepare("SELECT * FROM events WHERE id = ?");
        $stmt->bind_param("i", $event_id);
        $stmt->execute();

        $result = $stmt->get_result();
        if ($result->num_rows > 0){
            $event_info = $result->fetch_assoc();

            // $this->redis->hSet($cache_key, $event_id, json_encode($event_info));
            // $this->redis->expire($cache_key, 300);
            
			return $event_info;
		}else{
            throw new \Exception("No Events");
        }
    }


    public function updateEvent($event_id, $event_name, $start_date, $end_date, $location, $price, $created_by){
        $stmt = $this->conn->prepare("UPDATE events SET event_name = ?, start_date  = ?, end_date  = ?, location  = ?, price  = ? WHERE id = ? AND created_by = ?");
        $stmt->bind_param("ssssdis", $event_name, $start_date, $end_date, $location, $price, $event_id, $created_by );
        $stmt->execute();
    }


    public function deleteEvent($event_id, $created_by){
        $stmt = $this->conn->prepare("DELETE FROM events WHERE id = ? AND created_by = ?");
        $stmt->bind_param("is", $event_id, $created_by );
        $stmt->execute();
    }   



}


?>
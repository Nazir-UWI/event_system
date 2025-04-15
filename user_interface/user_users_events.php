<?php
    require_once "./config/config.php";

    $title = "User Events"; 
    require_once "./partials/header.php";
    require_once "./partials/navbar.php";
?>

<center> <h1>User Events</h1> </center>  
  
<?php
    if (($_SERVER['REQUEST_METHOD']) === 'POST'){

        $id = !empty($_POST['id']) ? $_POST['id'] : null;

        $path = "/users/{$id}/events";
        $httpMethod = "GET";


        $data = [];
        $data['api_key'] = !empty($_POST['api_key']) ? $_POST['api_key'] : null;

        $url = "http://".SERVER_IP."{$path}";

        $options = [
            'http' => [
                'header' => "Content-type: application/json",
                'method' => $httpMethod,
                'content' => json_encode($data),
            ],
        ];

        $context = stream_context_create($options);
        $result = file_get_contents($url, false, $context);

        $_POST = array();
    }
?>

<form method = "POST">

    <label for="id">User ID:</label>
    <input type="number" name="id" required><br><br>

    <button type="submit">Submit</button>
</form>
<br>

<?php
    if (isset($result)){
        $output = json_decode($result, true);        
        echo isset($output['error']) ? $output['error'] : '';
        echo isset($output['success']) ? $output['success'] : '';
    }

    if(isset($output['events'])){
        foreach($output['events'] as $event_name){
            echo $event_name['event_id'].'<br>';
        }
        
    }
?>


</body>  
</html>     
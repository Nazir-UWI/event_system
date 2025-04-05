<?php
    $title = "View Event"; 
    require_once "./partials/header.php";
    require_once "./partials/navbar.php";
?>

<center> <h1>View Event</h1> </center>  
  
<?php
    if (($_SERVER['REQUEST_METHOD']) === 'POST'){

        $path = "/events";
        $httpMethod = "GET";

        $data = [];

        $url = "http://localhost:8080{$path}";

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

    <button type="submit">Fetch Events</button>
</form>
<br>

<?php
    if (isset($result)){
        $output = json_decode($result, true);        
        echo isset($output['error']) ? $output['error'] : '';
        echo isset($output['success']) ? $output['success'] : '';
    }

    if(isset($output['events_list'])){
        foreach($output['events_list'] as $event_name){
            echo $event_name['event_name'].'<br>';
        }
        
    }
?>


</body>  
</html> 
<?php
    $title = "View Event"; 
    require_once "./partials/header.php";
    require_once "./partials/navbar.php";
?>

<center> <h1>View Event</h1> </center>  
  
<?php
    if (($_SERVER['REQUEST_METHOD']) === 'POST'){

        $id = !empty($_POST['id']) ? $_POST['id'] : null;

        $path = "/events/{$id}";
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

    <label for="id">Event ID:</label>
    <input type="number" name="id" required><br><br>

    <button type="submit">Fetch Events</button>
</form>
<br>

<?php
    if (isset($result)){
        $output = json_decode($result, true);        
        echo isset($output['error']) ? $output['error'] : '';
        echo isset($output['success']) ? $output['success'] : '';
    }

    if(isset($output['event_info'])){
        echo $output['event_info']['id'].'<br>';
        echo $output['event_info']['event_name'].'<br>';
        echo $output['event_info']['start_date'].'<br>';
        echo $output['event_info']['end_date'].'<br>';
        echo $output['event_info']['location'].'<br>';
        echo $output['event_info']['price'].'<br>';
        echo $output['event_info']['created_by'].'<br>';
    }
?>


</body>  
</html> 
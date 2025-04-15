<?php
    require_once "./config/config.php";

    $title = "View Event"; 
    require_once "./partials/header.php";
    require_once "./partials/navbar.php";
?>

<center> <h1>View Event</h1> </center>  
  
<?php
    if (($_SERVER['REQUEST_METHOD']) === 'POST'){

        $id = !empty($_POST['id']) ? $_POST['id'] : null;

        $path = "/events/{$id}";
        $httpMethod = "DELETE";


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
    <label for="api_key">API Key:</label>
    <input type="text" name="api_key"><br><br><br><br>


    <label for="id">Event ID:</label>
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
?>


</body>  
</html> 
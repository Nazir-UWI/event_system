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
        $httpMethod = "PUT";


        $data = [];
        $data['api_key'] = !empty($_POST['api_key']) ? $_POST['api_key'] : null;
        $data['event_name'] = !empty($_POST['event_name']) ? $_POST['event_name'] : null;
        $data['start_date'] = !empty($_POST['start_date']) ? $_POST['start_date'] : null;
        $data['end_date'] = !empty($_POST['end_date']) ? $_POST['end_date'] : null;
        $data['location'] = !empty($_POST['location']) ? $_POST['location'] : null;
        $data['price'] = !empty($_POST['price']) ? $_POST['price'] : null;


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

    <label for="event_name">Event Name:</label>
    <input type="text" name="event_name"><br><br>

    <label for="start_date">Start Date:</label>
    <input type="date" name="start_date"><br><br>

    <label for="end_date">Start Date:</label>
    <input type="date" name="end_date"><br><br>

    <label for="location">Location:</label>
    <input type="text" name="location"><br><br>

    <label for="price">Price $:</label>
    <input type="number" name="price" step=".01"><br><br>

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
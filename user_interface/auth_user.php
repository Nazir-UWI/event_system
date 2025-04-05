<?php
    $title = "User"; 
    require_once "./partials/header.php";
    require_once "./partials/navbar.php";
?>

<center> <h1>User</h1> </center>  
  
<?php
    if (($_SERVER['REQUEST_METHOD']) === 'POST'){

        $path = "/user";
        $httpMethod = "GET";

        $data = [];
        $data['email'] = !empty($_POST['email']) ? $_POST['email'] : null;

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
    <label for="email">Email:</label>
    <input type="text" name="email"><br><br>

    <button type="submit">Submit</button>
</form>
<br>

<?php
    if (isset($result)){
        $output = json_decode($result, true);        
        echo isset($output['error']) ? $output['error'] : '';
        echo isset($output['success']) ? $output['success'] : '';
    }

    if(isset($output['user_info'])){
        $user_info = $output['user_info'];
        echo "id: ".$user_info['id'].'<br>';
        echo "email: ".$user_info['email'].'<br>';
        echo "password_hash: ".$user_info['password_hash'].'<br>';
        echo "api_key ".$user_info['api_key'].'<br>';
        echo "auth_key: ".$user_info['auth_flag'].'<br>';
        
    }
?>


</body>  
</html> 
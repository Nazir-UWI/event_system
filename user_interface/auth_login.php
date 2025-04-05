<?php
    $title = "Login"; 
    require_once "./partials/header.php";
    require_once "./partials/navbar.php";
?>

<center> <h1>Login</h1> </center>  
  
<?php
    if (($_SERVER['REQUEST_METHOD']) === 'POST'){

        $path = "/login";
        $httpMethod = "POST";

        $data = [];
        $data['email'] = !empty($_POST['email']) ? $_POST['email'] : null;
        $data['password'] = !empty($_POST['password']) ? $_POST['email'] : null;

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

<form method="POST">
    <label for="email">Email:</label>
    <input type="text" name="email"><br><br>

    <label for="password">Password:</label>
    <input type="text" name="password"><br><br>

    <button type="submit">Login</button>    
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
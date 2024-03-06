<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "expense_management";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);

if (!empty($_POST["category"])) {
    $category = ucfirst($_POST["category"]); // Capitalize first letter
    $uid = $_POST["uid"];

    $category = mysqli_real_escape_string($connection, $category);

    $sql = "INSERT INTO add_category (category, uid) VALUES ('" . $category . "','" . $uid . "')";

    if (mysqli_query($connection, $sql)) {
        $result["error"] = false;
        $result["message"] = "Registration success";
        echo json_encode($result);
        mysqli_close($connection);
    }
}
?>

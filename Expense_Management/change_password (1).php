<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "expense_management";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);

if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

if (!empty($_POST["username"]) && !empty($_POST["current_password"]) && !empty($_POST["new_password"])) {

    $username = $_POST["username"];
    $current_password = $_POST["current_password"];
    $new_password = $_POST["new_password"];

    $username = mysqli_real_escape_string($connection, $username);
    $current_password = mysqli_real_escape_string($connection, $current_password);
    $new_password = mysqli_real_escape_string($connection, $new_password);

    $find_user = "SELECT * FROM user_registraion WHERE username='".$username."' AND password='".$current_password."'";
    $result = mysqli_query($connection, $find_user);

    if (mysqli_num_rows($result) > 0) {
        $update_password = "UPDATE user_registraion SET password='".$new_password."' WHERE username='".$username."'";
        if (mysqli_query($connection, $update_password)) {
            $response["error"] = false;
            $response["message"] = "Password updated successfully";
        } else {
            $response["error"] = true;
            $response["message"] = "Error updating password: " . mysqli_error($connection);
        }
    } else {
        $response["error"] = true;
        $response["message"] = "Incorrect current password";
    }
} else {
    $response["error"] = true;
    $response["message"] = "Please provide username, current password, and new password";
}

echo json_encode($response);

mysqli_close($connection);
?>

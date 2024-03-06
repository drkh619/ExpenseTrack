<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "expense_management";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);

if (
    !empty($_POST["amount"]) and !empty($_POST["type"]) and !empty($_POST["note"]) and
    !empty($_POST["date"]) and !empty($_POST["category"]) and !empty($_POST["budget_limit_value_send"]) and
    !empty($_POST["uid"]) and !empty($_POST["monthyear"])
) {
    $amount = $_POST["amount"];
    $type = $_POST["type"];
    $uid = $_POST["uid"];
    $note = $_POST["note"];
    $date = $_POST["date"];
    $category = $_POST["category"];
    $monthyear = $_POST["monthyear"];
    $budget_limit_value_send = $_POST["budget_limit_value_send"];

    $amount = mysqli_real_escape_string($connection, $amount);
    $type = mysqli_real_escape_string($connection, $type);
    $note = mysqli_real_escape_string($connection, $note);
    $date = mysqli_real_escape_string($connection, $date);
    $category = mysqli_real_escape_string($connection, $category);
    $budget_limit_value_send = mysqli_real_escape_string($connection, $budget_limit_value_send);

    // Check if category exists for uid in transaction table
    $check_sql = "SELECT * FROM transaction WHERE category = '".$category."' AND uid = '".$uid."' AND DATE_FORMAT(date, '%Y-%m') = '".$monthyear."'";
    $check_result = mysqli_query($connection, $check_sql);

    if (mysqli_num_rows($check_result) > 0) {
        // Update existing record
        $update_sql = "UPDATE transaction SET amount = amount + '".$amount."' WHERE category = '".$category."' AND uid = '".$uid."' AND DATE_FORMAT(date, '%Y-%m') = '".$monthyear."'";
        mysqli_query($connection, $update_sql);
    } else {
        // Insert new record
        $sql = "INSERT INTO transaction (amount,type,note,date,category,budget_limit_value_send,uid) VALUES (
            '".$amount."','".$type."','".$note."','".$date."','".$category."','".$budget_limit_value_send."','".$uid."')";
        mysqli_query($connection, $sql);
    }

    $result["error"] = false;
    $result["message"] = "Registration success";
    echo json_encode($result);
    mysqli_close($connection);
}

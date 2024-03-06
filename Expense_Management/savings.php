<?php

// Connect to MySQL
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "expense_management";

$conn = new mysqli($servername, $username, $password, $database);
//$uid = isset($_GET['user_id']) ? intval($_GET['user_id']) : 0;
//$uid = $_POST["uid"];

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Set headers to allow cross-origin requests
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Retrieve goals
$uid = isset($_GET['uid']) ? intval($_GET['uid']) : 0;
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $sql = "SELECT * FROM goals WHERE uid=$uid";  //WHERE uid=$user_id";";
    $result = $conn->query($sql);

    $goals = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $goals[] = $row;
        }
    }

    echo json_encode($goals);
}

// Add new goal
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    $goal_amount = $data['goal_amount'];
    $goal_category = $data['goal_category'];
    $deadline = $data['deadline'];
	$uid = $data["uid"];

    $sql = "INSERT INTO goals (goal_amount, goal_category, deadline,uid) VALUES ('$goal_amount', '$goal_category', '$deadline','$uid')";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Goal added successfully"]);
    } else {
        echo json_encode(["error" => "Error: " . $sql . "<br>" . $conn->error]);
    }
}
$conn->close();

?>

<?php

// Database connection settings
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "expense_management";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handling feedback submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $feedback = $_POST['feedback'] ?? '';
    $uid = $_POST['uid'] ?? '';
    $user = $_POST['user'] ?? '';

    // Insert feedback into the database
    $sql = "INSERT INTO feedback (feedback,uid,user) VALUES ('$feedback', '$uid', '$user')";

    if ($conn->query($sql) === TRUE) {
        echo "Feedback submitted successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close the database connection
$conn->close();

?>

<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "expense_management";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);
   
// Check connection
if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}
 
$id = $_GET['id'];
 
$connection->query("DELETE FROM goals WHERE id=".$id);

$result = array("success" => 'Successfully Deleted');
echo json_encode($result);
?>

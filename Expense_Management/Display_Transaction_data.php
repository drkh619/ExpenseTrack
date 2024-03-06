<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "expense_management";

// Create connection
$connection = new mysqli($servername, $username, $password, $database);

// Check connection
if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}

// Sanitize input
$uid = isset($_GET['uid']) ? intval($_GET['uid']) : 0; // Assuming uid is an integer
    
$sql = "SELECT * FROM `transaction` WHERE uid = $uid";

$result = mysqli_query($connection, $sql) or die("Error in Selecting " . mysqli_error($connection));

$response = array();
if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
        array_push($response,$row);
    }
}
$connection->close();
header('Content-Type: application/json');
echo json_encode($response);
?>

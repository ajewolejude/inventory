<?php 	

require_once 'core.php';


$valid['success'] = array('success' => false, 'messages' => array());

$itemId = $_POST['itemId'];

if($itemId) { 

 $sql = "UPDATE  item SET active = 2, status = 2 WHERE item_id = {$itemId}";

 if($connect->query($sql) === TRUE) {
 	$valid['success'] = true;
	$valid['messages'] = "Successfully Removed";		
 } else {
 	$valid['success'] = false;
 	$valid['messages'] = "Error while removing";
 }
 
 $connect->close();

 echo json_encode($valid);
 
} // /if $_POST
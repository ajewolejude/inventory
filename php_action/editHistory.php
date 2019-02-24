<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {	
	$orderId = $_POST['orderId'];
  
	
	$readyToUpdateOrderItem = false;
	

	// remove the order item data from order item table
	for($x = 0; $x < count($_POST['productHistory']); $x++) {			
		$removeOrderSql = "DELETE FROM hist WHERE item_id = {$orderId}";
		$connect->query($removeOrderSql);	
	} // /for quantity

			// insert the order item data 
		for($x = 0; $x < count($_POST['productHistory']); $x++) {			
			
				$reqItemSql = "INSERT INTO hist (item_id,history,date) 
				VALUES ({$orderId}, '".$_POST['productHistory'][$x]."','".$_POST['orderDate'][$x]."')";
				$connect->query($reqItemSql);		
			
		} // /for quantity


	

	$valid['success'] = true;
	$valid['messages'] = "Successfully Updated";		
	
	$connect->close();

	echo json_encode($valid);
 
} // /if $_POST
// echo json_encode($valid);
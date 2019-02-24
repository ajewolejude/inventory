<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {	
	$orderId = $_POST['orderId'];

	$orderDate 						= date('Y-m-d', strtotime($_POST['orderDate']));
  $clientName 					= $_POST['clientName'];
  $reqNo 				= $_POST['reqNo'];
  $grandTotal			= $_POST['grandTotalValue'];
  $paymentStatus 				= $_POST['paymentStatus'];

				
	$sql = "UPDATE req SET req_no = '$reqNo', total_price = '$grandTotal', owner = '$clientName',  date = '$orderDate',status = '$paymentStatus' WHERE id = {$orderId}";	
	$connect->query($sql);
	
	$readyToUpdateOrderItem = false;
	

	// remove the order item data from order item table
	for($x = 0; $x < count($_POST['productName']); $x++) {			
		$removeOrderSql = "DELETE FROM req_item WHERE req_id = {$orderId}";
		$connect->query($removeOrderSql);	
	} // /for quantity

			// insert the order item data 
		for($x = 0; $x < count($_POST['productName']); $x++) {			
			
				$reqItemSql = "INSERT INTO req_item (req_id, req_name, price, quantity,total_price) 
				VALUES ({$orderId}, '".$_POST['productName'][$x]."', '".$_POST['rate'][$x]."', '".$_POST['quantity'][$x]."', '".$_POST['total'][$x]."')";
				$connect->query($reqItemSql);		
			
		} // /for quantity


	

	$valid['success'] = true;
	$valid['messages'] = "Successfully Updated";		
	
	$connect->close();

	echo json_encode($valid);
 
} // /if $_POST
// echo json_encode($valid);
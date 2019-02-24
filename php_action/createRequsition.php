<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array(), 'order_id' => '');
// print_r($valid);
if($_POST) {	

	$orderDate 						= date('Y-m-d', strtotime($_POST['orderDate']));	
  $clientName 					= $_POST['clientName'];
  $reqNo				= $_POST['reqNo'];
  $grandTotalValue 			= $_POST['grandTotalValue'];

				
	$sql = "INSERT INTO req (req_no, total_price, owner, date, status) VALUES ('$reqNo', '$grandTotalValue', '$clientName', '$orderDate', 0)";
	
	
	$order_id;
	//$orderStatus = false;
	if($connect->query($sql) === true) {
		$order_id = $connect->insert_id;
		$valid['order_id'] = $order_id;	

		//$orderStatus = true;
	}

		
	// echo $_POST['productName'];
	$orderItemStatus = false;

	for($x = 0; $x < count($_POST['productName']); $x++) {			
		
		
			//$updateQuantity[$x] = $updateProductQuantityResult[0] - $_POST['quantity'][$x];							
				
				// add into req_item
				$reqItemSql = "INSERT INTO req_item (req_id, req_name, price, quantity,total_price) 
				VALUES ('$order_id', '".$_POST['productName'][$x]."', '".$_POST['rate'][$x]."', '".$_POST['quantity'][$x]."', '".$_POST['total'][$x]."')";

				$connect->query($reqItemSql);		

					
		
	} // /for quantity

	$valid['success'] = true;
	$valid['messages'] = "Successfully Added";		
	
	$connect->close();

	echo json_encode($valid);
 
} // /if $_POST
// echo json_encode($valid);
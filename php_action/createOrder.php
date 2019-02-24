<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array(), 'request_id' => '');
 print_r($valid);
if($_POST) {	

	$returnDate 						= date('Y-m-d', strtotime($_POST['returnDate']));
	$issueDate 						= date('Y-m-d', strtotime($_POST['issueDate']));	
  $itemName 					= $_POST['item_name'];
  $userName 				= $_POST['userName'];
  $userDept 				= $_POST['userDept'];
  $service_tag				=$_POST['service_tag'];
  $Status 				= $_POST['Status'];
  $Expression			=$_POST['Expression'];
  $employee_email		=$_POST['userEmail'];

  $item_id				=$_POST['itemId'];

				
	$sql = "INSERT INTO requests (item_id, employee_name, employee_dept, employee_email, issued_date, returned_date, returned, expression,status) VALUES ('$item_id', '$userName', '$userDept', '$employee_email', '$issueDate', '$returnDate', '2',$Expression,$Status)";
	
	
	$order_id;
	$orderStatus = false;
	if($connect->query($sql) === true) {
		$order_id = $connect->insert_id;
		$valid['request_id'] = $order_id;
		$sql2 = "UPDATE item SET active ='0'  WHERE item_id = $item_id";
		if($connect->query($sql2) === true){
			
		$sql3 = "INSERT INTO file (request_id, name, file) VALUES ($order_id, '', '')";
		if($connect->query($sql3) === true){
				
				
			$valid['success'] = true;
	$valid['messages'] = "Successfully Added";	
		}
		else{

		$valid['success'] = false;
	$valid['messages'] = "Fail input";	
	}

		} else{

		$valid['success'] = false;
	$valid['messages'] = "Fail input";	
	}

		
		//$orderStatus = true;
		
	}
	else{

		$valid['success'] = false;
	$valid['messages'] = "Fail input";	
	}

		
	// echo $_POST['productName'];
	//$orderItemStatus = false;



		
	
	$connect->close();
 
	//echo json_encode($valid);
 
} // /if $_POST
// echo json_encode($valid);
/* 	for($x = 0; $x < count($_POST['productName']); $x++) {			
		$updateProductQuantitySql = "SELECT product.quantity FROM product WHERE product.product_id = ".$_POST['productName'][$x]."";
		$updateProductQuantityData = $connect->query($updateProductQuantitySql);
		
		
		while ($updateProductQuantityResult = $updateProductQuantityData->fetch_row()) {
			$updateQuantity[$x] = $updateProductQuantityResult[0] - $_POST['quantity'][$x];							
				// update product table
				$updateProductTable = "UPDATE product SET quantity = '".$updateQuantity[$x]."' WHERE product_id = ".$_POST['productName'][$x]."";
				$connect->query($updateProductTable);

				// add into order_item
				$orderItemSql = "INSERT INTO order_item (order_id, product_id, quantity, rate, total, order_item_status) 
				VALUES ('$order_id', '".$_POST['productName'][$x]."', '".$_POST['quantity'][$x]."', '".$_POST['rateValue'][$x]."', '".$_POST['totalValue'][$x]."', 1)";

				$connect->query($orderItemSql);		

				if($x == count($_POST['productName'])) {
					$orderItemStatus = true;
				}		
		} // while	
	} // /for quantity*/
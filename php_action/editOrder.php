<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());


if(ISSET($_POST['editBtn'])) {	
	

	$orderId = $_POST['orderId'];
	$returnDate 						= date('Y-m-d', strtotime($_POST['returnDate']));
	$issueDate 						= date('Y-m-d', strtotime($_POST['issueDate']));	
 // $itemName 					= $_POST['item_name'];
  $userName 				= $_POST['userName'];
  $userDept 				= $_POST['userDept'];
 // $service_tag				=$_POST['service_tag'];
  $Status 				= $_POST['Status'];
  $Expression			=$_POST['Expression'];

  $item_id				=$_POST['itemId'];
  $returned 			=$_POST['returned'];

  $employee_email		=$_POST['userEmail'];

  if($returnDate==""){
  	$returnDate=null;
  }


  if($returned == 1){
$sql = "UPDATE requests SET item_id = '$item_id', employee_name = '$userName', employee_dept = '$userDept', employee_email = '$employee_email', issued_date = '$issueDate', returned_date = '$returnDate', returned = '1', expression = '$Expression',status = '$Status'WHERE request_id = {$orderId}";	

$sql2 = "UPDATE item SET active = '1' WHERE item_id = $item_id ";
$connect->query($sql2);	
  }
  else{
  	$sql = "UPDATE requests SET item_id = '$item_id', employee_name = '$userName', employee_dept = '$userDept', employee_email = '$employee_email', issued_date = '$issueDate', returned_date = '$returnDate', expression = '$Expression',status = '$Status'WHERE request_id = {$orderId}";	
  	$sql2 = "UPDATE item SET active = '0' WHERE item_id = $item_id ";
$connect->query($sql2);	

$sql3 = "UPDATE requests SET returned_date = null, returned = '2' WHERE request_id = {$orderId}";
$connect->query($sql3);	
  }

				
	
	$connect->query($sql);
	

	
if($connect->query($sql) === TRUE) {
		$valid['success'] = true;
		$valid['messages'] = "Successfully Update";	
		
		//echo 'yes';
	} else {
		$valid['success'] = false;
		$valid['messages'] = "Error while updating product info";
		//echo 'no';
	}		
	
	
 $connect->close();
header("Location:http://192.168.1.4/invent/orders.php?o=manord"); 
	
} // /if $_POST
// echo json_encode($valid);

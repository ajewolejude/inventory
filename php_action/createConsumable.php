<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {	

	$consumable 		= $_POST['consumable'];
  $price					= $_POST['price'];
  $service_tag					= $_POST['service_tag'];
  $item_id				= $_POST['itemId'];
  $userName		= $_POST['userName'];
  $userDept =	$_POST['userDept'];
  $userTag = $_POST['userTag'];
  $expr =$_POST['expr'];
  $item_name = $_POST['consumer'];
  //$status 	= $_POST['consumableStatus'];
  $type   = $_POST['consumableType'];
  $vendor 			= $_POST['vendor'];
  $purchase_date 	= date('Y-m-d', strtotime($_POST['purchaseDate']));
  $issue_date 	= date('Y-m-d', strtotime($_POST['issueDate']));
  
  if($userTag ==""){
	  $status ='1';
  }else{
	  $status ='2';
  }

	
	
				

				$sql = "INSERT IGNORE INTO consumables (consumable, service_tagC, price, item_id, consumer, consumer_tag, consumer_user, consumer_dept, expression_name,purchase_date, issue_date, vendor,status,type ) 
				VALUES ('$consumable', '$service_tag','$price','$item_id','$item_name', '$userTag','$userName', '$userDept', '$expr', '$purchase_date', '$issue_date', '$vendor', '$status','$type')";
				if ($connect->query($sql) === false) {
        die("Database error:".$connect->error);
    }

// Check for success
    if ($connect->affected_rows == 0) {
      $valid['success'] = false;
					$valid['messages'] = "Error while adding the members, the service tag already exist";
    } else {

//Success and return new id
        $valid['success'] = true;
					$valid['messages'] = "Successfully Added";	
    }


				

					

	$connect->close();

	echo json_encode($valid);
 
} // /if $_POST
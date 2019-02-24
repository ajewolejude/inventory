<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {
		$consumable 		= $_POST['editConsumable'];
  $price					= $_POST['editPrice'];
  $service_tag					= $_POST['editServiceTag'];
  $item_id				= $_POST['itemIds'];
  $con_id				= $_POST['conId'];
  //$status 	= $_POST['editConsumableStatus'];
  $type     = $_POST['editConsumableType'];
  $vendor 			= $_POST['editVendor'];
  $purchase_date 	= date('Y-m-d', strtotime($_POST['editPurchaseDate']));
  $issue_date 	= date('Y-m-d', strtotime($_POST['editIssueDate']));
  $consumer_user = $_POST['editUserName'];
  $consumer_dept = $_POST['editUserDept'];
  $consumer_tag	=	$_POST['editUserTag'];
  $consumer  	= $_POST['editConsumer'];
  $expr			=$_POST['editExpr'];
  
  if($consumer_tag ==""){
	  $status ='1';
  }else{
	  $status ='2';
  }




	$sql = "UPDATE consumables SET consumable = '$consumable', service_tagC = '$service_tag', price = '$price', item_id = '$item_id', consumer = '$consumer', consumer_tag = '$consumer_tag', consumer_user = '$consumer_user', consumer_dept = '$consumer_dept', expression_name = '$expr', purchase_date = '$purchase_date', issue_date = '$issue_date', vendor = '$vendor', status = '$status', type = '$type' WHERE consumables_id = $con_id ";
	
	if($connect->query($sql) === TRUE) {
		$valid['success'] = true;
		$valid['messages'] = "Successfully Update".$service_tag.$type.$consumable;	
		header("Location:http://192.168.1.4/invent/consumables.php");
	} else {
		$valid['success'] = false;
		$valid['messages'] = "Error while updating product infos".$service_tag.$type.$consumable ;
	}

} // /$_POST
	 
$connect->close();

echo json_encode($valid);


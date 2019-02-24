<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {
	$productId = $_POST['itemId'];
	$productName 		= $_POST['editProductName']; 
  $quantity 			= "1";
  $price 					= $_POST['editRate'];
  $brandName 			= $_POST['editBrandName'];
  $categoryName 	= $_POST['editCategoryName'];

  $itemId = $_POST['itemId'];
	$itemName 		= $_POST['editProductName']; 
  $itemStatus 	= $_POST['editProductStatus'];
  $vendor		= $_POST['editVendor'];
  $computer_name= $_POST['editComputer'];
  $service_tag  = $_POST['editService'];
  $exp			= $_POST['editExpName'];
  $purchase_date= date('Y-m-d', strtotime($_POST['editPDate']));



	$sql = "UPDATE item SET item_name = '$itemName', expression_name = '$exp', brand_id = '$brandName', categories_id = '$categoryName', quantity = '$quantity', computer_name = '$computer_name', price = '$price', active = '$itemStatus', service_tag = '$service_tag', vendor = '$vendor', purchase_date = '$purchase_date', status = 1 WHERE item_id = $itemId ";
	
	if($connect->query($sql) === TRUE) {
		$valid['success'] = true;
		$valid['messages'] = "Successfully Update";	
	} else {
		$valid['success'] = false;
		$valid['messages'] = "Error while updating product info";
	}

} // /$_POST
	 
$connect->close();

echo json_encode($valid);


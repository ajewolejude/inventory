<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {	

	$productName 		= $_POST['productName'];
  // $productImage 	= $_POST['productImage'];
  $quantity 			= "1";
  $price					= $_POST['price'];
  $computer_name					= $_POST['computer_name'];
  $service_tag					= $_POST['service_tag'];
  $exp					= $_POST['exp'];
  $brandName 			= $_POST['brandName'];
  $categoryName 	= $_POST['categoryName'];
  $productStatus 	= $_POST['productStatus'];
  $vendor 			= $_POST['vendor'];
  $purchase_date 	= date('Y-m-d', strtotime($_POST['purchaseDate']));
$sql = "INSERT IGNORE INTO  item (item_name, expression_name, item_image, brand_id, categories_id, quantity, computer_name, price , active, status, service_tag, vendor, purchase_date) 
				VALUES ('$productName', '$exp','../assests/images/invent/213655af98c9d1bf4f.jpg', '$brandName', '$categoryName', '$quantity', '$computer_name', '$price', 1, '$productStatus', '$service_tag', '$vendor', '$purchase_date')";


	
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

	$type = explode('.', $_FILES['productImage']['name']);
	$type = $type[count($type)-1];		
	$url = '../assests/images/invent/'.uniqid(rand()).'.'.$type;
	if(in_array($type, array('gif', 'jpg', 'jpeg', 'png', 'JPG', 'GIF', 'JPEG', 'PNG'))) {
		if(is_uploaded_file($_FILES['productImage']['tmp_name'])) {			
			if(move_uploaded_file($_FILES['productImage']['tmp_name'], $url)) {
				
				$sql = "INSERT IGNORE INTO  item (item_name, expression_name, item_image, brand_id, categories_id, quantity, computer_name, price , active, status, service_tag, vendor, purchase_date) 
				VALUES ('$productName', '$exp','$url', '$brandName', '$categoryName', '$quantity', '$computer_name', '$price', 1, '$productStatus', '$service_tag', '$vendor', '$purchase_date')";



				
	






				

			}	
		} // if
	} // if in_array 		

	$connect->close();

	echo json_encode($valid);
 
} // /if $_POST
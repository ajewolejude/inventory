<?php 	

require_once 'core.php';

$itemId = $_POST['itemId'];

$sql = "SELECT item_id, consumer,  price, consumable, consumer, service_tagC, item_id, consumer, consumer_tag, consumer, expression_name, vendor, consumer_user, consumer_dept, issue_date, purchase_date, status,type FROM consumables WHERE consumables_id = $itemId";

$result = $connect->query($sql);

if($result->num_rows > 0) { 
 $row = $result->fetch_array();
} // if num_rows

$connect->close();

echo json_encode($row);

/*<?php 	

require_once 'core.php';

$itemId = $_POST['itemId'];

$sql = "SELECT item_id, item_name, expression_name, item_image, brand_id, categories_id, quantity, computer_name, price , active, status, service_tag, vendor,purchase_date FROM item WHERE item_id = $itemId";
$result = $connect->query($sql);

if($result->num_rows > 0) { 
 $row = $result->fetch_array();
} // if num_rows

$connect->close();

echo json_encode($row);*/
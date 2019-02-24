<?php 	

require_once 'core.php';

$itemId = $_POST['itemId'];

$sql = "SELECT item.item_id, item.item_name, item.expression_name, item.item_image, item.brand_id, item.categories_id, item.quantity, item.computer_name, item.price , item.active, item.status, item.service_tag, item.vendor,item.purchase_date,categories.categories_name,requests.employee_name, requests.employee_dept FROM item 
 INNER JOIN categories ON item.categories_id = categories.categories_id 
INNER JOIN requests ON item.item_id = requests.item_id
  WHERE item.item_id = $itemId  AND requests.returned = 2";
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
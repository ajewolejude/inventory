<?php 	

require_once 'core.php';

$itemId = $_GET['i'];

$sql = "SELECT item_image FROM item WHERE item_id = {$itemId}";
$data = $connect->query($sql);
$result = $data->fetch_row();

$connect->close();

echo "invent/" . $result[0];

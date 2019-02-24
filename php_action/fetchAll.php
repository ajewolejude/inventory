<?php 	



require_once 'core.php';

$sql = "SELECT item.item_id, item.item_name,  consumables.price,consumables.consumable, item.item_name, consumables.service_tagC, item.item_id, item.computer_name, item.service_tag, item.item_name, item.expression_name, consumables.vendor, requests.employee_name, requests.employee_dept,consumables.issue_date, consumables.purchase_date, consumables.status, consumables.consumables_id FROM item
		INNER JOIN consumables ON item.item_id = consumables.item_id
		INNER JOIN requests ON item.item_id = requests.item_id
		
		  
		WHERE consumables.status = 1";

$result = $connect->query($sql);

$output = array('data' => array());

if($result->num_rows > 0) { 

 // $row = $result->fetch_array();
 $active = ""; 

 while($row = $result->fetch_array()) {
 	$itemId = $row[0];
 	$consumablesId = $row[17];
 	// active 
 	if($row[16] == 1) {
 		// activate member
 		$active = "<label class='label label-success'>Good</label>";
 	} else if($row[16] == 2) { 		
 		
 		$active = "<label class='label label-danger'>Bad</label>";
 	} else if($row[16] == 3){ 		
 		$active = "<label class='label label-warning'>Medium</label>";
 		
 	} // /else


 	$button = '<!-- Single button -->
	<div class="btn-group">
	  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    Action <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu">
	    <li><a type="button" data-toggle="modal" id="editProductModalBtn" data-target="#editProductModal" onclick="editProduct('.$consumablesId.')"> <i class="glyphicon glyphicon-edit"></i> Edit</a></li>
	    <li><a type="button" data-toggle="modal" data-target="#removeProductModal" id="removeProductModalBtn" onclick="removeProduct('.$consumablesId.')"> <i class="glyphicon glyphicon-trash"></i> Remove</a></li>       
	  </ul>
	</div>';

	// $brandId = $row[3];
	// $brandSql = "SELECT * FROM brands WHERE brand_id = $brandId";
	// $brandData = $connect->query($sql);
	// $brand = "";
	// while($row = $brandData->fetch_assoc()) {
	// 	$brand = $row['brand_name'];
	// }

	$brand = $row[9];
	$category = $row[10];

	$imageUrl = substr($row[2], 3);
	$exp = "";
	$itemImage = "<img class='img-round' src='".$imageUrl."' style='height:30px; width:50px;'  />";

	if($row[10]==1){
		$exp = "The Holy Trinity";
	}
	elseif ($row[10]==2) {
		$exp = "The House of Freeedom";
	}else if($row[10]==3){
 		$exp = "This Present House";
 	}
 	else if($row[10]==4){
 		$exp = "The Water Brook";
 	}
 	else if($row[10]==5){
 		$exp = "God Bless Nigeria";
 	}
 	else if($row[10]==6){
 		$exp = "Mount Zion";
 	}
 	else if($row[10]==7){
 		$exp = "Green House";
 	}
 	else if($row[10]==8){
 		$exp = "Freedom Foundation";
 	}
 	else if($row[10]==9){
 		$exp = "PT's Residence";
 	}

 	$output['data'][] = array( 		
 		
 		// item
 		$row[4], 
 		// rate
 		$row[2],
 		// service tag 
 		$row[5], 		 	
 		
 		// consumer user 		
 		$row[12], 
 		
 		//consumer dept
 		$row[13],
 		//issue_ date
 		$row[14],
 		//return_date
 		$row[14],
 		//exp
 		$exp,
 		// expression
 		$active,
 		// status
 		$button 
 			

 		); 	
 } // /while 

}// if num_rows

$connect->close();

echo json_encode($output);
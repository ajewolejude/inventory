<?php 	



require_once 'core.php';

$sql = "SELECT item_id, consumer,  price, consumable, consumer, service_tagC, item_id, consumer, consumer_tag, consumer, expression_name, vendor, consumer_user, consumer_dept, issue_date, purchase_date, status, consumables_id FROM consumables";

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
 		$active = "<label class='label label-success'>Available</label>";
 	} else {
 		// deactivate member
 		$active = "<label class='label label-danger'>Not Available</label>";
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
 		
 		// consumables name
 		$row[3], 
 		// rate
 		$row[2],
 		// service tag 
 		$row[5], 		 	
 		// consumer
 		$row[4], 
 		//consumer service tag
 		$row[8],
 		// consumer user 		
 		$row[12], 
 		
 		//consumer dept
 		$row[13],
 		//vendor
 		$row[11],
 		//purchase date
 		$row[15],
 		//issue_ date
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
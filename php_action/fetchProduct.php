<?php 	



require_once 'core.php';

$sql = "SELECT item.item_id, item.item_name, item.item_image, item.brand_id,
 		item.categories_id, item.quantity, item.price, item.active, item.status, 
 		brands.brand_name, categories.categories_name, item.computer_name, item.service_tag, item.expression_name, item.vendor, item.purchase_date FROM item 
		INNER JOIN brands ON item.brand_id = brands.brand_id 
		INNER JOIN categories ON item.categories_id = categories.categories_id  
		WHERE item.status = 1";

$result = $connect->query($sql);

$output = array('data' => array());

if($result->num_rows > 0) { 

 // $row = $result->fetch_array();
 $active = ""; 

 while($row = $result->fetch_array()) {
 	$itemId = $row[0];
 	// active 
 	if($row[7] == 1) {
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
	    <li><a type="button" data-toggle="modal" id="editProductModalBtn" data-target="#editProductModal" onclick="editProduct('.$itemId.')"> <i class="glyphicon glyphicon-edit"></i> Edit</a></li>
	    <li><a type="button" data-toggle="modal" data-target="#removeProductModal" id="removeProductModalBtn" onclick="removeProduct('.$itemId.')"> <i class="glyphicon glyphicon-trash"></i> Remove</a></li>
		 <li><a type="button" href="history.php?i='.$itemId.'" data-toggle="modal" id="addHistoryModalBtn"> <i class="glyphicon glyphicon-save"></i> History</a></li>
 
		
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
	$itemImage = "<img class='img-round' src='".$imageUrl."' style='height:20px; width:25px;'  />";

	if($row[13]==1){
		$exp = "The Holy Trinity";
	}
	elseif ($row[13]==2) {
		$exp = "The House of Freeedom";
	}else if($row[13]==3){
 		$exp = "This Present House";
 	}
 	else if($row[13]==4){
 		$exp = "The Water Brook";
 	}
 	else if($row[13]==5){
 		$exp = "God Bless Nigeria";
 	}
 	else if($row[13]==6){
 		$exp = "Mount Zion";
 	}
 	else if($row[13]==7){
 		$exp = "Green House";
 	}
 	else if($row[13]==8){
 		$exp = "Freedom Foundation";
 	}
 	else if($row[13]==9){
 		$exp = "PT's Residence";
 	}

 	$output['data'][] = array( 		
 		// image
 		$itemImage,
 		// item name
 		$row[1], 
 		// rate
 		$row[6],
 		// quantity 
 		$row[5], 		 	
 		// brand
 		$brand,
 		// category 		
 		$category,
 		
 		//computer name  
 		$row[11],
 		//service tag
 		$row[12],
 		//vendor
 		$row[14],
 		//purchase_ date
 		$row[15],
 		//expression
 		$exp,
 		// active
 		$active,
 		// button
 		$button 
 			

 		); 	
 } // /while 

}// if num_rows

$connect->close();

echo json_encode($output);
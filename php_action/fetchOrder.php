<?php 	

require_once 'core.php';

$sql = "SELECT requests.request_id, item.item_name, requests.issued_date, requests.returned_date, requests.employee_name, requests.employee_dept,requests.status, item.computer_name, categories.categories_name, item.service_tag, item.vendor,requests.expression, requests.returned,requests.item_id  FROM item 
INNER JOIN categories ON item.categories_id = categories.categories_id
INNER JOIN requests ON item.item_id = requests.item_id
 WHERE item.status=1";

$result = $connect->query($sql);



$output = array('data' => array());

if($result->num_rows > 0) { 
 
 $paymentStatus = ""; 
 $x = 1;

 while($row = $result->fetch_array()) {
 	$requestId = $row[0];
	
	$itemId = $row[13];


 	// active 
 	if($row[6] == 1) { 		
 		$Status = "<label class='label label-success'>Good</label>";
 	} else if($row[6] == 2) { 		
 		
 		$Status = "<label class='label label-danger'>Bad</label>";
 	} else if($row[6] == 3){ 		
 		$Status = "<label class='label label-warning'>Medium</label>";
 		
 	} // /else


 	if($row[12] == 1) { 		
 		$returned = "<label class='label label-success'>Yes</label>";
 	} else if($row[12] == 2) { 		
 		
 		$returned = "<label class='label label-warning'>No</label>";
 	} 

 	//expression

 	if($row[11]==1){
 		$exp = "The Holy Trinity";

 	}else if($row[11]==2){
 		$exp = "The House of Freedom";
 	}
 	else if($row[11]==3){
 		$exp = "This Present House";
 	}
 	else if($row[11]==4){
 		$exp = "The Water Brook";
 	}
 	else if($row[11]==5){
 		$exp = "God Bless Nigeria";
 	}
 	else if($row[11]==6){
 		$exp = "Mount Zion";
 	}
 	else if($row[11]==7){
 		$exp = "Green House";
 	}
 	else if($row[11]==8){
 		$exp = "Freedom Foundation";
 	}
 	else if($row[11]==9){
 		$exp = "PT's Residence";
 	}

 	$button = '<!-- Single button -->
	<div class="btn-group">
	  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    Action <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu">
	    <li><a href="orders.php?o=editOrd&i='.$requestId.'" id="editOrderModalBtn"> <i class="glyphicon glyphicon-edit"></i> Edit</a></li>
	    
	    <li><a type="button" data-toggle="modal" id="paymentOrderModalBtn" data-target="#paymentOrderModal" onclick="mailOrder('.$requestId.')"> <i class="glyphicon glyphicon-save"></i> Mail</a></li>

	    <li><a type="button" onclick="printOrder('.$requestId.')"> <i class="glyphicon glyphicon-print"></i> Print </a></li>
	    <li><a type="button" href="history.php?i='.$itemId.'" data-toggle="modal" id="addHistoryModalBtn"> <i class="glyphicon glyphicon-save"></i> History</a></li>
	    <li><a type="button" data-toggle="modal" data-target="#removeOrderModal" id="removeOrderModalBtn" onclick="removeOrder('.$requestId.')"> <i class="glyphicon glyphicon-trash"></i> Remove</a></li> 
		
	  </ul>
	</div>';		


	if($row[3]=="1970-01-01"){
		$returnD="";
	}else{
		$returnD = $row[3];
	}
 	$output['data'][] = array( 		
 		// image
 		$x,
 		// item name
 		$row[1],
 		//name
 		$row[4],
 		//dept
 		$row[5],
 		//category
 		$row[8],
 		//service tag
 		$row[9],
 	 //workstation name
 		$row[7],
 		//
 		// issue date
 		$row[2], 
 		//return date
 		$returnD,
 		//returned
 		$returned,
 		//vendor
 		$row[10],
 		//expression
 		$exp,
 		//status	
 		$Status,

 		//$itemCountRow, 		 	
 		//$paymentStatus,
 		//$itemCountRow, 		 	
 		//$paymentStatus,
 		// button
 		$button 		
 		); 	
 	$x++;
 } // /while 

}// if num_rows

$connect->close();

echo json_encode($output);
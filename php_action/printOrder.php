<?php 	

require_once 'core.php';

$orderId = $_POST['orderId'];

$sql = "SELECT requests.request_id, item.item_name, requests.issued_date, requests.returned_date, requests.employee_name, requests.employee_dept,requests.status, item.computer_name, categories.categories_name, item.service_tag, item.vendor,requests.expression, requests.returned,item.price,requests.employee_email  FROM item 
INNER JOIN categories ON item.categories_id = categories.categories_id
INNER JOIN requests ON item.item_id = requests.item_id
 WHERE requests.request_id = {$orderId}";

$orderResult = $connect->query($sql);
$orderData = $orderResult->fetch_array();


$itemName = $orderData[1];
$issueDate = $orderData[2];
$returnDate = $orderData[3];
$userName =$orderData[4];
$userDept = $orderData[5];
$status =$orderData[6];
$computer_name = $orderData[7];
$categories_name = $orderData[8];
$service_tag =$orderData[9];
$vendor = $orderData[10];
$expression = $orderData[11];
$returned = $orderData[12];
$price   = $orderData[13];
$email   = $orderData[14];


if($status == 1) { 		
 		$status = "<label class='label label-success'>Good</label>";
 	} else if($status == 2) { 		
 		
 		$status = "<label class='label label-danger'>Bad</label>";
 	} else if($status == 3){ 		
 		$status = "<label class='label label-warning'>Medium</label>";
 		
 	} // /else


 	if($returned == 1) { 		
 		$returned = "<label class='label label-success'>Yes</label>";
 	} else if($returned == 2) { 		
 		
 		$returned = "<label class='label label-warning'>No</label>";
 	} 

 	//expression

 	if($expression==1){
 		$exp = "The Holy Trinity";

 	}else if($expression==2){
 		$exp = "The House of Freedom";
 	}
 	else if($expression==3){
 		$exp = "This Present House";
 	}
 	else if($expression==4){
 		$exp = "The Water Brook";
 	}
 	else if($expression==5){
 		$exp = "God Bless Nigeria";
 	}
 	else if($expression==6){
 		$exp = "Mount Zion";
 	}
 	else if($expression==7){
 		$exp = "Green House";
 	}
 	else if($expression==8){
 		$exp = "Freedom Foundation";
 	}
 	else if($expression==9){
 		$exp = "PT's Residence";
 	}

 	if($returnDate=="1970-01-01"){
		$returnDate="";
	}else{
		$returnDate = $orderData[3];
	}


 $table = '
 <table border="1" cellspacing="0" cellpadding="20" width="100%">
 <img src = "./assests/images/tph.png" height="80px" width="80px" alt ="logo"/>
	<thead>
		<tr >
			<th colspan="5">

			<center>

				This Present House - User Request Slip
				<center>User Name : '.$userName.'</center>
				User Dept. : '.$userDept.'
				<br>User Email : '.$email.'
			</center>		
			</th>
				
		</tr>		
	</thead>
</table>
<table border="0" width="100%;" cellpadding="5" style="border:1px solid black;border-top-style:1px solid black;border-bottom-style:1px solid black;">

	<tbody>
		<tr>
			<th>Item</th>
			<th>Service Tag</th>
			
			<th>Price</th>
			<th>Category</th>
			<th>Computer Name</th>
			
		</tr>';
		$table .= '<tr>
				<th>'.$itemName.'</th>
				<th>'.$service_tag.'</th>
				<th>'.$price.'</th>
				<th>'.$categories_name.'</th>
				<th>'.$computer_name.'</th>
			</tr>
			';
		
		$table .= '<tr>
			<th></th>
		</tr>

		<tr>
			<th></th>
		</tr>

		<tr>
			<th>issue Date</th>
			<th>'.$issueDate.'</th>			
		</tr>

		<tr>
			<th>Returned?</th>
			<th>'.$returned.'</th>			
		</tr>

		<tr>
			<th>Returned Date</th>
			<th>'.$returnDate.'</th>			
		</tr>	

		<tr>
			<th>Expression</th>
			<th>'.$exp.'</th>			
		</tr>

		<tr>
			<th>Status</th>
			<th>'.$status.'</th>			
		</tr>

	</tbody>
</table>
<br><br><br>
-----------------------------------<br> Signature & Date
 ';


$connect->close();

echo $table;
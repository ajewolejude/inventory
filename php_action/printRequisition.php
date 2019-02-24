<?php 	

require_once 'core.php';

$orderId = $_POST['orderId'];

$sql ="SELECT id, req_no, total_price, owner, status,date FROM req WHERE id = $orderId";

$orderResult = $connect->query($sql);
$orderData = $orderResult->fetch_array();

$orderDate = $orderData[5];
$clientName = $orderData[3];
$reqNo = $orderData[1]; 
$grandTotal = $orderData[2];
$status = $orderData[4];

	if($status == 0) { 		
 		$status = "<label class='label label-info'>Pending</label>";
 	} else if($status == 1) { 		
 		$status = "<label class='label label-success'>Completed</label>";
 	} else if ($status == 2) { 		
 		$status = "<label class='label label-danger'>Cancelled</label>";
 	} // /else


$orderItemSql = "SELECT req_item.req_name, req_item.price, req_item.quantity, req_item.total_price FROM req_item WHERE req_item.req_id = $orderId";
$orderItemResult = $connect->query($orderItemSql);

 $table = '
 <table border="1" cellspacing="0" cellpadding="20" width="100%">
 <img src = "./assests/images/tph.png" height="80px" width="80px" alt ="logo"/>
	<thead>
		<tr >
			<th colspan="5">

			<center>
			This Present House - User Request Slip<br>
				Order Date : '.$orderDate.'
				<center>Owner/Req. Dept. : '.$clientName.'</center>
				Requisition No. : '.$reqNo.'
			</center>		
			</th>
				
		</tr>		
	</thead>
</table>
<table border="0" width="100%;" cellpadding="5" style="border:1px solid black;border-top-style:1px solid black;border-bottom-style:1px solid black;">

	<tbody>
		<tr>
		<th>S/N</th>
			<th>Item</th>
			<th>Rate</th>
			<th>Quantity</th>
			<th>Total</th>
			
		</tr>';

		$x = 1;
		while($row = $orderItemResult->fetch_array()) {			
						
			$table .= '<tr>
				<th>'.$x.'</th>
				<th>'.$row[0].'</th>
				<th>'.$row[1].'</th>
				<th>'.$row[2].'</th>
				<th>'.$row[3].'</th>
			</tr>
			';
		$x++;
		} // /while

		$table .= '<tr>
			<th></th>
		</tr>

		<tr>
			<th></th>
		</tr>

		

		<tr>
			<th>Grand Total</th>
			<th>'."₦".$grandTotal.'</th>			
		</tr>
		<tr>
			<th>Status</th>
			<th>'.$status.'</th>			
		</tr>

	
	</tbody>
</table>
 ';


$connect->close();

echo $table;
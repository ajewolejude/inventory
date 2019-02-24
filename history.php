<?php 
require_once 'php_action/db_connect.php'; 
require_once 'includes/header.php'; 



?>

<ol class="breadcrumb">
  <li><a href="dashboard.php">Home</a></li>
  <li>Item</li>
  <li class ="active">History</li>
 
</ol>





<div class="panel panel-default">
	
	<div class="panel-body">
	
			
			<div class="success-messages"></div> <!--/success-messages-->

  		<form class="form-horizontal" method="POST" action="php_action/editHistory.php" id="editOrderForm">

  			<?php $orderId = $_GET['i'];

			$sql = "SELECT item.item_id, item.item_name, item.item_image, item.brand_id, item.categories_id, item.quantity, item.price, item.active, item.status, item.computer_name, item.service_tag FROM item WHERE item.item_id = {$orderId}";

				$result = $connect->query($sql);
				$data = $result->fetch_row();				
  			?>

			<div class="form-group">
			    <label for="orderDate" class="col-sm-2 control-label">Item name</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="itemName" value="<?php echo $data[1] ?>" disabled name="itemName" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->
			  <div class="form-group">
			    <label for="clientName" class="col-sm-2 control-label">Service Tag</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="serviceTag" name="serviceTag" disabled value="<?php echo $data[10] ?>" placeholder="Service Tag" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->
					  

			 <table class="table" id="productTable">
			  	<thead>
			  		<tr>	
						<th style="width:10%;">#</th>
			  			<th style="width:70%;">History</th>	
						<th style="width:10%;">Date</th>							
			  			<th style="width:10%;"></th>
			  		</tr>
			  	</thead>
			  	
				<tbody>
			  		<?php

			  		$orderItemSql = "SELECT hist.history, hist.date FROM hist WHERE hist.item_id = {$orderId}";
						$orderItemResult = $connect->query($orderItemSql);
						// $orderItemData = $orderItemResult->fetch_all();						
						
						// print_r($orderItemData);
			  		$arrayNumber = 0;
			  		// for($x = 1; $x <= count($orderItemData); $x++) {
			  		$x = 1;
			  		while($orderItemData = $orderItemResult->fetch_array()) { 
			  			// print_r($orderItemData); ?>
			  			<tr id="row<?php echo $x; ?>" class="<?php echo $arrayNumber; ?>">
							<td>
							<?php echo $x; ?>
							</td>
		  				
			  				<td style="margin-left:10px;margin-right:20px;">
			  					<div class="form-group">

			  					<textarea rows="4" cols="50" type="text" name="productHistory[]" id="productHistory<?php echo $x; ?>" autocomplete="off" required value="<?php echo $orderItemData['history']; ?>" class="form-control"><?php echo $orderItemData['history']; ?></textarea>
			  					</div>
			  				</td>
							<td >
			  					<div class="form-group" style="margin-left:10px;margin-right:20px;">
								<input type="date" name="orderDate[]" id="orderDate<?php echo $x; ?>" autocomplete="off" required value="<?php echo $orderItemData['date']; ?>" class="form-control" />
			  					</div>
			  				</td>
							
			  				<td>

			  					<button class="btn btn-default removeProductRowBtn" type="button" id="removeProductRowBtn" onclick="removeProductRow(<?php echo $x; ?>)"><i class="glyphicon glyphicon-trash"></i></button>
			  				</td>
			  			</tr>
		  			<?php
		  			$arrayNumber++;
		  			$x++;
			  		} // /for
			  		?>
			  	</tbody>
			  </table>	

			  
			  <div class="form-group editButtonFooter">
			    <div class="col-sm-offset-2 col-sm-10">
			    <button type="button" class="btn btn-default" onclick="addRow()" id="addRowBtn" data-loading-text="Loading..."> <i class="glyphicon glyphicon-plus-sign"></i> Add Row </button>

			    <input type="hidden" name="orderId" id="orderId" value="<?php echo $_GET['i']; ?>" />

			    <button type="submit" id="editOrderBtn" data-loading-text="Loading..." class="btn btn-success"><i class="glyphicon glyphicon-ok-sign"></i> Save Changes</button>
			      
			    </div>
			  </div>
			</form>



	</div> <!--/panel-->	
</div> <!--/panel-->	


<script src="custom/js/history.js"></script>

<?php require_once 'includes/footer.php'; ?>


	
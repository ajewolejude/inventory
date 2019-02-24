<?php 
require_once 'php_action/db_connect.php'; 
require_once 'includes/header.php'; 


if($_GET['o'] == 'add') { 
// add order
	echo "<div class='div-request div-hide'>add</div>";
} else if($_GET['o'] == 'manord') { 
	echo "<div class='div-request div-hide'>manord</div>";
} else if($_GET['o'] == 'editOrd') { 
	echo "<div class='div-request div-hide'>editOrd</div>";
} // /else manage order


?>

<div class="row container">
	<div class="col-md-12">
<ol class="breadcrumb">
  <li><a href="dashboard.php">Home</a></li>
  <li>Requests</li>
  <li class="active">
  	<?php if($_GET['o'] == 'add') { ?>
  		Add Request
		<?php } else if($_GET['o'] == 'manord') { ?>
			Manage Request
		<?php } // /else manage order ?>
  </li>
</ol>


<h4>
	<i class='glyphicon glyphicon-circle-arrow-right'></i>
	<?php if($_GET['o'] == 'add') {
		echo "Add Request";
	} else if($_GET['o'] == 'manord') { 
		echo "Manage Request";
	} else if($_GET['o'] == 'editOrd') { 
		echo "Edit Request";
	}
	?>	
</h4>




<div class="panel panel-default">
	<div class="panel-heading">

		<?php if($_GET['o'] == 'add') { ?>
  		<i class="glyphicon glyphicon-plus-sign"></i>	Add Request
		<?php } else if($_GET['o'] == 'manord') { ?>
			<i class="glyphicon glyphicon-edit"></i> Manage Request
		<?php } else if($_GET['o'] == 'editOrd') { ?>
			<i class="glyphicon glyphicon-edit"></i> Edit Request
		<?php } ?>

	</div> <!--/panel-->	
	<div class="panel-body">
			
		<?php if($_GET['o'] == 'add') { 
			// add order
			?>			

			


  		<form class="form-horizontal" method="POST" action="php_action/createOrder.php" id="createOrderForm" >

  			<br>
  			<br>

			  
			  <div class="form-group">
			    <label for="userName" class="col-sm-2 control-label">User Name</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userName" name="userName" placeholder="User Name" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->

			   <div class="form-group">
			    <label for="userDept" class="col-sm-2 control-label">User Department</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userDept" name="userDept" placeholder="User Department" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->

			  <div class="form-group">
			    <label for="userEmail" class="col-sm-2 control-label">User Email</label>
			    <div class="col-sm-10">
			      <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="User Email" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->

			<!--  <div class="form-group">
			    <label for="vendor" class="col-sm-2 control-label">Vendor</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="vendor" name="vendor" placeholder="Vendor" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->			  

			  <div class="form-group" id = "itemIdDiv">
			   
			    <div class="col-sm-10">
			      <input type="hidden" class="form-control" id="itemId" name="itemId" placeholder="Id" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->	
			  <br>

			  <table class="table " id="productTable">
			  	<thead>
			  		<tr>		
			  		<th style="width:20%;">Service Tag</th>	  			
			  			<th style="width:25%;">Item</th>
			  			<th style="width:25%;">Category</th>
			  			<th style="width:10%;">Price</th>
			  			<th style="width:20%;">Computer Name</th>			  					  			
			  		</tr>
			  	</thead>
			  	<tbody>
			  		
			  			<tr id="" class="">	

			  				<td style="margin-left :20px;">			

			  				<div class="form-group">

			  					<select class="form-control" name="serviceTag" id="serviceTag" onchange="getProductServiceData()">
			  						<option value="">~~SELECT~~</option>
			  						<?php
			  							$productSql = "SELECT * FROM item WHERE active = 1 AND status = 1";
			  							$productData = $connect->query($productSql);


			  							while($row = $productData->fetch_array()) {									 		
			  								echo "<option value='".$row['item_id']."'>".$row['service_tag']."</option>";
										 	} // /while 
										 	


			  						?>
		  						</select>
			  					</div>

			  							  					
			  				</td>		  				
			  				<td style="padding-left:20px;">
			  					<input type="text" name="item_name[]" id="item_name" autocomplete="off" disabled="true" class="form-control" />			  					
			  					<input type="hidden" name="item_nameValue[]" id="item_nameValue" autocomplete="off" class="form-control" />	
			  				</td>

			  				<td style="padding-left:20px;">
			  					<input type="text" name="category[]" id="category" autocomplete="off" disabled="true" class="form-control" />			  					
			  					<input type="hidden" name="categoryValue[]" id="categoryValue" autocomplete="off" class="form-control" />	
			  				</td>

			  				<td style="padding-left:20px;">			  					
			  					<input type="text" name="rate[]" id="rate" autocomplete="off" disabled="true" class="form-control" />			  					
			  					<input type="hidden" name="rateValue[]" id="rateValue" autocomplete="off" class="form-control" />			  					
			  				</td>
			  				<td style="padding-left:20px;">
			  					<div class="form-group">
			  				
			  					<input type="text" name="Computer[]" id="Computer" autocomplete="off" class="form-control" disabled="true" />			  					
			  					<input type="hidden" name="ComputerValue[]" id="ComputerValue" autocomplete="off" class="form-control" />	

			  					</div>
			  				</td>
			  				
			  			
			  			</tr>
		  			
			  	</tbody>			  	
			  </table>

			  <div class="col-md-6">
			  	
			  	  <div class="form-group">
			    <label for="issueDate" class="col-sm-2 control-label">Issue Date</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="issueDate" name="issueDate" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->

			  	  <div class="form-group">
			    <label for="returnDate" class="col-sm-2 control-label">Return Date</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="returnDate" name="returnDate" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->


			  </div> <!--/col-md-6-->

			  <div class="col-md-6">
			  			  
				 <div class="form-group">
				    <label for="Expression" class="col-sm-3 control-label">Expression</label>
				    <div class="col-sm-9">
				      <select class="form-control" name="Expression" id="Expression">
				      	<option value="">~~SELECT~~</option>
				      	<option value="1">The Holy Trinity</option>
				      	<option value="2">The House of Freedom</option>

				      	<option value="3">This Present House</option>
				      	<option value="4">The Water Brook</option>
				      	<option value="5">God Bless Nigeria</option>
				      	<option value="6" >Mount Zion</option>
				      <option value="7" >Green House</option>
				      <option value="8" >Freedom Foundation</option>
				      <option value="9" >PT's Residence</option>
				      </select>
				    </div>
				  </div> <!--/form-group-->		

				  <div class="form-group">
				    <label for="Status" class="col-sm-3 control-label">Status</label>
				    <div class="col-sm-9">
				      <select class="form-control" name="Status" id="Status">
				      	<option value="">~~SELECT~~</option>
				      	<option value="1">Good</option>
				      	<option value="2">Bad</option>
				      	<option value="3">Medium</option>
				      </select>
				    </div>
				  </div> <!--/form-group-->							  
			  </div> <!--/col-md-6-->
 


			  <div class="form-group submitButtonFooter">
			    <div class="col-sm-offset-2 col-sm-10">
			       <button type="submit" id="createOrderBtn" data-loading-text="Loading..." class="btn btn-success"><i class="glyphicon glyphicon-ok-sign"></i> Save Changes</button>

			    </div>
			  </div>
			</form>
		<?php } else if($_GET['o'] == 'manord') { 
			// manage order
			?>

			
			<table class="table table-striped" id="manageOrderTable">
				<thead>
					<tr>
						<th>#</th>
						<th>Item Name</th>
						<th>User Name</th>
						<th>User Dept.</th>
						<th>Category</th>
						<th>Service Tag</th>
						<th>PC Name</th>
						<th>Issue Date</th>
						<th>Return Date</th>
						<th>Returned</th>
						<th>Vendor</th>
						<th>Expression</th>
						<th>Status</th>
						<?php if($_SESSION['role']=="admin"){
								echo '<th>Options</th>';
							} ?>
					</tr>
				</thead>
			</table>

		<?php 
		// /else manage order
		} else if($_GET['o'] == 'editOrd') {
			// get order
			?>
			
			<div class="success-messages"></div> <!--/success-messages-->

  		<form class="form-horizontal" method="POST" action="php_action/editOrder.php" id="editOrderForm">

  			<?php $orderId = $_GET['i'];

  			$sql = "SELECT request_id, issued_date,returned_date, employee_name, employee_dept, expression, status, item_id,returned, employee_email FROM requests 	
					WHERE request_id = {$orderId}";

				$result= $connect->query($sql);
				//$data = $row->fetch_array()	

				$row = $result->fetch_array();
				
  			?>



<br>
  			<div class="success-messages"></div> <!--/success-messages-->
  			<br>

			  <div class="form-group">
			    <label for="userName" class="col-sm-2 control-label">User Name</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userName" name="userName" value="<?php echo $row[3]; ?>" required placeholder="User Name" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->

			   <div class="form-group">
			    <label for="userDept" class="col-sm-2 control-label">User Department</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userDept" name="userDept" placeholder="User Department" required value="<?php echo $row[4] ?>" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->

			   <div class="form-group">
			    <label for="userEmail" class="col-sm-2 control-label">User Email</label>
			    <div class="col-sm-10">
			      <input type="email" class="form-control" id="userEmail" name="userEmail"  value = "<?php echo $row[9] ?>" required placeholder="User Email" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->
			    <div class="form-group" id = "itemIdDiv">
			   
			    <div class="col-sm-10">
			      <input type="hidden" class="form-control" id="itemId" value = "<?php echo $row[7] ?>" name="itemId" placeholder="Id" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->	
			  <br>

			  <table class="table" id="productTable">
			  	<thead>
			  		<tr>			  			
			  			<th style="width:20%;">Service Tag</th>	  			
			  			<th style="width:25%;">Item</th>
			  			<th style="width:25%;">Category</th>
			  			<th style="width:10%;">Price</th>
			  			<th style="width:20%;">Computer Name</th>	
			  		</tr>
			  	</thead>
			  	<tbody>
			  		<tr id="" class="">	

			  			<?php 
			  			$orderId = $_GET['i'];

						$sql2 = 		"SELECT item.item_id, item.item_name,  item.price, item.status, 
 						categories.categories_name, item.computer_name, item.service_tag FROM item 
						INNER JOIN requests ON item.item_id = requests.item_id 
						INNER JOIN categories ON item.categories_id = categories.categories_id WHERE requests.request_id ={$orderId}";



				$result2= $connect->query($sql2);
			  if ($result2->num_rows > 0) {
    // output data of each row
   				 while($row2 = $result2->fetch_array()) {
      				  //echo "id: " . $row2[0]. " - Name: " . $row[2]. " " . $row2[3]. "<br>";
      				  echo '<td style="margin-left :20px;">';			

			  			echo	'<div class="form-group">';

			  			echo		'<select class="form-control" name="serviceTag" id="serviceTag" onchange="getProductServiceData()">';
			  			echo			'<option value="">~~SELECT~~</option>';
			  				$sql3 = "SELECT * FROM item WHERE active = 1 AND status = 1";
			  				$result3 = $connect->query($sql3);
			  				if($result3->num_rows > 0){
			  				while($row3=$result3->fetch_array()) {	
			  								$itemID = $row3['item_id'];
			  								$sTag  	= $row3['service_tag'];		
			  								if($row2[6]== $sTag){
			  									echo '<option  value="'.$itemID.'" selected="selected" >';
			  									echo $sTag.'</option>';
			  								} else{
			  									echo '<option value="'.$itemID.'">'.$sTag.'</option>';
			  								}		
			  								
			  							};

			  						}
						
						echo '</select>';
			  				echo '</div>';
			  				echo '</td>';


      				  echo '<td style="padding-left:20px;">
			  					<input type="text" name="item_name[]" id="item_name" autocomplete="off" value ="'.$row2[1].'" disabled="true" class="form-control" />			  					
			  					<input type="hidden"  name="item_nameValue[]" id="item_nameValue" autocomplete="off" class="form-control" />	
			  				</td>';


			  				echo '<td style="padding-left:20px;">
			  					<input type="text" name="category[]" id="category" value ="'.$row2[4].'" autocomplete="off" disabled="true" class="form-control" />			  					
			  					<input type="hidden" name="categoryValue[]" id="categoryValue" autocomplete="off" class="form-control" />	
			  				</td>';

			  				echo '<td style="padding-left:20px;">			  					
			  					<input type="text" name="rate[]" id="rate" autocomplete="off" disabled="true" value="'. $row2[2].'" class="form-control" />			  					
			  					<input type="hidden" name="rateValue[]" id="rateValue" autocomplete="off" class="form-control" />			  					
			  				</td>';

			  				echo '<td style="padding-left:20px;">
			  					<div class="form-group">
			  				
			  					<input type="text" name="Computer[]" id="Computer" value = "'.$row2[5].'" autocomplete="off" class="form-control" disabled="true" />			  					
			  					<input type="hidden" name="ComputerValue[]" id="ComputerValue" autocomplete="off" class="form-control" />	

			  					</div>
			  				</td>';
   						 }
				} else {
 			   echo "0 results";
				}			  			?>
			  						  				
			  				

			  				

			  				
			  				
			  				
			  			
			  			</tr>
			  	</tbody>			  	
			  </table>

			  <div class="col-md-6">
			  	
			  	  <div class="form-group">
			    <label for="issueDate" class="col-sm-2 control-label">Issue Date</label>
			    <div class="col-sm-10">
			      <input type="text" value="<?php echo $row[1] ?>"  class="form-control" required id="issueDate" name="issueDate" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->

			  <div class="form-group">
				    <label for="returned" class="col-sm-2 control-label">Returned</label>
				    <div class="col-sm-10">
				      <select class="form-control" name="returned" id="returned" required>
				      	
				      	<option value="1" <?php if ($row[8] == 1 ) echo 'selected' ; ?> >Yes</option>
				      	<option value="2" <?php if ($row[8] == 2 ) echo 'selected' ; ?> >No</option>
				      </select>
				    </div>
				  </div> <!--/form-group-->	


			  	  <div class="form-group rtd">
			    <label for="returnDate" class="col-sm-2 control-label">Return Date</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" value="<?php if($row[2]==("1970-01-01")){echo " ";} else echo $row[2]; ?>" id="returnDate" name="returnDate" autocomplete="off" />
			    </div>
			  </div> <!--/form-group-->


			  </div> <!--/col-md-6-->

			  <div class="col-md-6">
			  	

			  			  
				 				<div class="form-group">
				    <label for="Expression" class="col-sm-3 control-label">Expression</label>
				    <div class="col-sm-9">
				      <select class="form-control"  name="Expression" id="Expression" required>

				      	<option value="" >~~SELECT~~</option>
				      	<option value="1" <?php if ($row[5] == 1 ) echo 'selected' ; ?> >The Holy Trinity</option>
				      	<option value="2" <?php if ($row[5] == 2 ) echo 'selected' ; ?>  >The House of Freedom</option>
				      	<option value="3" <?php if ($row[5] == 3 ) echo 'selected' ; ?> >This Present House</option>
				      	<option value="4" <?php if ($row[5] == 4 ) echo 'selected' ; ?> >The Water Brook</option>
				      	<option value="5" <?php if ($row[5] == 5 ) echo 'selected' ; ?> >God Bless Nigeria</option>
				      	<option value="6" <?php if ($row[5] == 6 ) echo 'selected' ; ?> >Mount Zion</option>
				      
				      <option value="7" <?php if ($row[5] == 7 ) echo 'selected' ; ?> >Green House</option>
				      <option value="8" <?php if ($row[5] == 8 ) echo 'selected' ; ?> >Freedom Foundation</option>
				      <option value="9" <?php if ($row[5] == 9 ) echo 'selected' ; ?> >PT's Residence</option>
				      </select>
				    </div>
				  </div> <!--/form-group-->	


				  <div class="form-group">
				    <label for="Status" class="col-sm-3 control-label">Status</label>
				    <div class="col-sm-9">
				      <select class="form-control"  name="Status" id="Status" required>

				      	<option value="" >~~SELECT~~</option>
				      	<option value="1"<?=$row[6] == 1 ? ' selected="selected"' : '';?>>Good</option>
				      	<option value="2" <?=$row[6] == 2 ? ' selected="selected"' : '';?>>Bad</option>
				      	<option value="3" <?=$row[6] == 3 ? ' selected="selected"' : '';?>>Medium</option>
				      </select>
				    </div>
				  </div> <!--/form-group-->							  
			  </div> <!--/col-md-6-->
			 
	    


			  <div class="form-group editButtonFooter">
			    <div class="col-sm-offset-2 col-sm-10">
			    
			    <input type="hidden" name="orderId" id="orderId" value="<?php echo $_GET['i']; ?>" />

			    <button type="submit" id="editOrderBtn" data-loading-text="Loading..." name="editBtn" class="btn btn-success"><i class="glyphicon glyphicon-ok-sign"></i> Save Changes</button>
			      
			    </div>
			  </div>
			</form>

			 <div class="col-md-6">
	<div class="col-md-12 well ">
		<h4 class="text-primary">Non Repudiation</h4>
		<hr style="border-top:1px dottec #ccc;">
		<form class="form-inline" method="POST" action="php_action/upload.php" enctype="multipart/form-data">
			<input class="form-control" type="file" name="upload"/>
			<input type="hidden" name="orderId" id="orderId" value="<?php echo $_GET['i']; ?>" />

			<button type="submit" class="btn btn-success form-control" name="submit"><span class="glyphicon glyphicon-upload"></span> Upload</button>
		</form>
		<br /><br />
		<table class="table table-bordered">
			<thead class="alert-warning">
				<tr>
					<th>Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody class="alert-success">
				<?php
				$orderId = $_GET['i'];

					$row = $connect->query("SELECT * FROM file WHERE request_id = {$orderId}") or die(mysqli_error());
					while($fetch = $row->fetch_array()){
				?>
					<tr>
						<?php 
							$name = explode('/', $fetch['file']);
						?>
						<td><?php echo $fetch['name']?></td>
						<td><a href="php_action/download.php?file=<?php echo $name[1]?>" class="btn btn-primary"><span class="glyphicon glyphicon-download"></span> Download</a></td>
					</tr>
				<?php
					}
				?>
			</tbody>
		</table>
	</div>  
	    </div>
			<?php
		} // /get order else  ?>


	</div> <!--/panel-->	
</div> <!--/panel-->	
</div>

</div>



<!-- remove order -->
<div class="modal fade" tabindex="-1" role="dialog" id="removeOrderModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="glyphicon glyphicon-trash"></i> Remove Order</h4>
      </div>
      <div class="modal-body">

      	<div class="removeOrderMessages"></div>

        <p>Do you really want to remove ?</p>
      </div>
      <div class="modal-footer removeProductFooter">
        <button type="button" class="btn btn-default" data-dismiss="modal"> <i class="glyphicon glyphicon-remove-sign"></i> Close</button>
        <button type="button" class="btn btn-primary" id="removeOrderBtn" data-loading-text="Loading..."> <i class="glyphicon glyphicon-ok-sign"></i> Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- /remove order-->


<script src="custom/js/order.js"></script>

<?php require_once 'includes/footer.php'; ?>


	
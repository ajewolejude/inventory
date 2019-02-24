<?php require_once 'php_action/db_connect.php' ?>
<?php require_once 'includes/header.php'; ?>

<div class="row container"  >
	<div class="col-md-12">

		<ol class="breadcrumb">
		  <li><a href="dashboard.php">Home</a></li>		  
		  <li class="active">Consumables</li>
		</ol>

		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="page-heading"> <i class="glyphicon glyphicon-edit"></i> Manage Consumables</div>
			</div> <!-- /panel-heading -->
			<div class="panel-body">

				<div class="remove-messages"></div>

				<div class="div-action pull pull-right" style="padding-bottom:20px;">
					 <?php if($_SESSION['role']=="admin"){
								echo '<button class="btn btn-default button1" data-toggle="modal" id="addProductModalBtn" data-target="#addProductModal"> <i class="glyphicon glyphicon-plus-sign"></i> Add Consumables </button>';
							} ?>

					
				</div> <!-- /div-action -->				
				
				<table class="table table-striped " id="manageProductTable">
					<thead>
						<tr>						
							<th>Consumable</th>
							
							<th>Price(₦)</th>							
							<th>Service Tag</th>
							<th>Consumer</th>
							<th>Consumer Tag</th>
							<th>Consumer User</th>

							<th>Comsumer Dept</th>
							
							<th>Vendor</th>

							<th>Purchase Date</th>
							<th>Issue Date</th>
							<th>Expression</th>
							<th>Status</th>
							<?php if($_SESSION['role']=="admin"){
								echo '<th style="width:15%;">Options</th>';
							} ?>
						</tr>
					</thead>
				</table>
				<!-- /table -->

			</div> <!-- /panel-body -->
		</div> <!-- /panel -->		
	</div> <!-- /col-md-12 -->
</div> <!-- /row -->


<!-- add product -->
<div class="modal fade" id="addProductModal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">

    	<form class="form-horizontal" id="submitProductForm" action="php_action/createConsumable.php" method="POST" enctype="multipart/form-data">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title"><i class="fa fa-plus"></i> Add Consumable</h4>
	      </div>

	      <div class="modal-body" style="max-height:450px; overflow:auto;">

	      	<div id="add-product-messages"></div>
	           	       

	        <div class="form-group">
	        	<label for="consumable" class="col-sm-3 control-label">Consumable Name: </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="consumable" placeholder="Consumable Name" name="consumable" autocomplete="off">
				    </div>
	        </div> <!-- /form-group-->	

	                <div class="form-group">
	        	<label for="vendor" class="col-sm-3 control-label">Vendor: </label>
	        	<label class="col-sm-1 control-label"> : </label><div class="col-sm-8">
				      <input type="text" class="form-control" id="vendor" placeholder="Vendor" name="vendor" autocomplete="off">
				    </div>
	        </div> <!-- /form-group--> 

	        <div class="form-group">
	        	<label for="consumableType" class="col-sm-3 control-label">Type : </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <select class="form-control" id="consumableType" name="consumableType" onchange="getConServiceData()">
			  						<option value="">~~SELECT~~</option>
			  						<?php
			  							$productSql = "SELECT * FROM categories  WHERE type = 2 AND categories_status = 1";
			  							$productData = $connect->query($productSql);


			  							while($row = $productData->fetch_array()) {									 		
			  								echo "<option value='".$row['value']."'>".$row['categories_name']."</option>";
										 	} // /while 
										 	


			  						?>
		  						</select>
				    </div>
	        </div> <!-- /form-group-->   



	        <div class="form-group">
	        	<label for="service_tag" class="col-sm-3 control-label">Service Tag: </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="service_tag" placeholder="Service Tag" name="service_tag" autocomplete="off">
				    </div>
	        </div> <!-- /form-group-->	        	 

	        <div class="form-group">
	        	<label for="price" class="col-sm-3 control-label">Price(₦): </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="price" placeholder="Price" name="price" autocomplete="off">
				    </div>
	        </div> <!-- /form-group-->	 	     	        

	   

	             <div class="form-group">
	        	<label for="serviceTagItem" class="col-sm-3 control-label">Consumer Tag: </label>
	        	<label class="col-sm-1 control-label"> : </label><div class="col-sm-8">
				         <select class="form-control" name="serviceTagItem" id="serviceTagItem" onchange="getProductServiceData()">
			  						<option value="">~~SELECT~~</option>
			  						<?php
			  							$productSql = "SELECT * FROM item  WHERE active = 0 AND status = 1";
			  							$productData = $connect->query($productSql);


			  							while($row = $productData->fetch_array()) {									 		
			  								echo "<option value='".$row['item_id']."'>".$row['service_tag']."</option>";
										 	} // /while 
										 	


			  						?>
		  						</select>
				    </div>
	        </div> <!-- /form-group-->	 




	       

	             <div class="form-group">
	        	<label for="item_name" class="col-sm-3 control-label">Consumer Name: </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				     <input type="text" name="item_name[]" id="item_name" autocomplete="off" disabled="true" class="form-control" />			  					
			  					<input type="hidden" name="item_nameValue[]" id="item_nameValue" autocomplete="off" class="form-control" />	
				    </div>
	        </div> <!-- /form-group-->	

	

	        <div class="form-group">
	        	<label for="purchaseDate" class="col-sm-3 control-label">Purchase Date</label>
	        	<label class="col-sm-1 control-label"> : </label><div class="col-sm-8">
			      <input type="text" class="form-control" id="purchaseDate" name="purchaseDate" autocomplete="off" />
				    </div>
	        </div> <!-- /form-group-->

	        <div class="form-group">
	        	<label for="issueDate" class="col-sm-3 control-label">Issue Date</label>
	        	<label class="col-sm-1 control-label"> : </label><div class="col-sm-8">
			      <input type="text" class="form-control" id="issueDate" name="issueDate" autocomplete="off" />
				    </div>
	        </div> <!-- /form-group-->

	        <div class="form-group">
	        	<label for="consumableStatus" class="col-sm-3 control-label">Status: </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <select class="form-control" id="consumableStatus" name="consumableStatus">
				      	<option value="">~~SELECT~~</option>
				      	<option value="1">Available</option>
				      	<option value="2">Not Available</option>
				      </select>
				    </div>
	        </div> <!-- /form-group-->	 
	        

	       <div class="form-group" id = "itemIdDiv">
			   
			    <div class="col-sm-2">
			      <input type="hidden" class="form-control" id="itemId" name="itemId" placeholder="Id" autocomplete="off" />
			    </div>
			</div>
			  
			  <div class="form-group">
			  <div class="col-sm-2">
			      <input type="hidden" class="form-control" id="userName" name="userName" placeholder="userName" autocomplete="off" />
			    </div>
			</div>

			<div class="form-group">
			  <div class="col-sm-2">
			      <input type="hidden" class="form-control" id="userDept" name="userDept" placeholder="userDept" autocomplete="off" />
			    </div>
			</div>

			<div class="form-group">
			  <div class="col-sm-3">
			      <input type="hidden" class="form-control" id="userTag" name="userTag" placeholder="userTag" autocomplete="off" />
			    </div>
			</div>

			<div class="form-group">
			  <div class="col-sm-3">
			      <input type="hidden" class="form-control" id="expr" name="expr" placeholder="expr" autocomplete="off" />
			    </div>

			  </div> <!--/form-group-->	

			  <div class="form-group">
			  <div class="col-sm-3">
			      <input type="hidden" class="form-control" id="consumer" name="consumer" placeholder="consumer" autocomplete="off" />
			    </div>
			    
			  </div> <!--/form-group-->	

	      </div> <!-- /modal-body -->
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal"> <i class="glyphicon glyphicon-remove-sign"></i> Close</button>
	        
	        <button type="submit" class="btn btn-primary" id="createProductBtn" data-loading-text="Loading..." autocomplete="off"> <i class="glyphicon glyphicon-ok-sign"></i> Save Changes</button>
	      </div> <!-- /modal-footer -->	      
     	</form> <!-- /.form -->	     
    </div> <!-- /modal-content -->    
  </div> <!-- /modal-dailog -->
</div> 
<!-- /add categories -->


<!-- edit categories brand -->
<div class="modal fade" id="editProductModal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
    	    	
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title"><i class="fa fa-edit"></i> Edit Consumable</h4>
	      </div>
	      <div class="modal-body" style="max-height:450px; overflow:auto;">

	      	<div class="div-loading">
	      		<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
						<span class="sr-only">Loading...</span>
	      	</div>

	      	<div class="div-result">

				 
				  <!-- Tab panes -->
				  <div class="tab-content">

				    <div role="tabpanel" class="tab-pane active" id="productInfo">
				    	<form class="form-horizontal" id="editProductForm" action="php_action/editConsumable.php" method="POST">				    
				    	<br />


				    	<div id="edit-product-messages"></div>

				    	 <div class="form-group">
	        	<label for="editConsumable" class="col-sm-3 control-label">Consumable Name: </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="editConsumable" placeholder="Consumable Name" name="editConsumable" autocomplete="off">
				    </div>
	        </div> <!-- /form-group-->	

	        <div class="form-group">
	        	<label for="editVendor" class="col-sm-3 control-label">Vendor: </label>
	        	<label class="col-sm-1 control-label"> : </label><div class="col-sm-8">
				      <input type="text" class="form-control" id="editVendor" placeholder="Vendor" name="editVendor" autocomplete="off">
				    </div>
	        </div> <!-- /form-group-->    


	          <div class="form-group">
	        	<label for="editConsumableType" class="col-sm-3 control-label">Type : </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <select class="form-control" id="editConsumableType" name="editConsumableType" onchange="getEditConServiceData()">
			  						<option value="">~~SELECT~~</option>
			  						<?php
			  							$productSql = "SELECT * FROM categories  WHERE type = 2 AND categories_status = 1";
			  							$productData = $connect->query($productSql);


			  							while($row = $productData->fetch_array()) {									 		
			  								echo "<option value='".$row['value']."'>".$row['categories_name']."</option>";
										 	} // /while 
										 	


			  						?>
		  						</select>
				    </div>
	        </div> <!-- /form-group-->   



	        <div class="form-group">
	        	<label for="editServiceTag" class="col-sm-3 control-label">Service Tag: </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="editServiceTag" placeholder="Service Tag" name="editServiceTag" autocomplete="off">
				    </div>
	        </div> <!-- /form-group-->	        	 

	        <div class="form-group">
	        	<label for="editPrice" class="col-sm-3 control-label">Price(₦): </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="editPrice" placeholder="Price" name="editPrice" autocomplete="off">
				    </div>
	        </div> <!-- /form-group-->	 	     	        

	   

	             <div class="form-group">
	        	<label for="serviceTagItems" class="col-sm-3 control-label">Consumer Tag: </label>
	        	<label class="col-sm-1 control-label"> : </label><div class="col-sm-8"><div class="id_100">
				         <select class="form-control" name="serviceTagItems" id="serviceTagItems" onchange="getConsumableServiceData()">
			  						<option value="">~~SELECT~~</option>
			  						<?php
			  							$productSql = "SELECT * FROM item WHERE active = 0 AND status = 1";
			  							$productData = $connect->query($productSql);


			  							while($row = $productData->fetch_array()) {									 		
			  								echo "<option value='".$row['item_id']."'>".$row['service_tag']."</option>";
										 	} // /while 
										 	


			  						?>
		  						</select>
		  					</div>
				    </div>
	        </div> <!-- /form-group-->	 




	       

	             <div class="form-group">
	        	<label for="item_names" class="col-sm-3 control-label">Consumer Name: </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				     <input type="text" name="Item_names[]" id="item_names" autocomplete="off" disabled="true" class="form-control" />			  					
			  					<input type="hidden" name="item_namesValue[]" id="item_namesValue" autocomplete="off" class="form-control" />	
				    </div>
	        </div> <!-- /form-group-->	

	        

	        <div class="form-group">
	        	<label for="editPurchaseDate" class="col-sm-3 control-label">Purchase Date</label>
	        	<label class="col-sm-1 control-label"> : </label><div class="col-sm-8">
			      <input type="text" class="form-control" id="editPurchaseDate" name="editPurchaseDate" autocomplete="off" />
				    </div>
	        </div> <!-- /form-group-->

	        <div class="form-group">
	        	<label for="editIssueDate" class="col-sm-3 control-label">Issue Date</label>
	        	<label class="col-sm-1 control-label"> : </label><div class="col-sm-8">
			      <input type="text" class="form-control" id="editIssueDate" name="editIssueDate" autocomplete="off" />
				    </div>
	        </div> <!-- /form-group-->

	        <div class="form-group">
	        	<label for="editConsumableStatus" class="col-sm-3 control-label">Status: </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <select class="form-control" id="editConsumableStatus" name="editConsumableStatus">
				      	<option value="">~~SELECT~~</option>
				      	<option value="1">Available</option>
				      	<option value="2">Not Available</option>
				      </select>
				    </div>
	        </div> <!-- /form-group-->	 

	             <div class="form-group" >
			   
			    <div class="col-sm-10">
			<input type="hidden" class="form-control" id="conId"  name="conId" placeholder="Id" autocomplete="off" />

			      
			    </div>
			  </div> <!--/form-group-->	
	        
    <div class="form-group" id = "itemIdDiv">
			   
			    <div class="col-sm-10">
			      <input type="hidden" class="form-control" id="itemIds"  name="itemIds" placeholder="Id" autocomplete="off" />

			    </div>
			  </div> <!--/form-group-->


			  
			  <div class="form-group">
			  <div class="col-sm-2">
			      <input type="hidden" class="form-control" id="editUserName" name="editUserName" placeholder="userName" autocomplete="off" />
			    </div>
			</div>

			<div class="form-group">
			  <div class="col-sm-2">
			      <input type="hidden" class="form-control" id="editUserDept" name="editUserDept" placeholder="userDept" autocomplete="off" />
			    </div>
			</div>

			<div class="form-group">
			  <div class="col-sm-3">
			      <input type="hidden" class="form-control" id="editUserTag" name="editUserTag" placeholder="userTag" autocomplete="off" />
			    </div>
			</div>

			<div class="form-group">
			  <div class="col-sm-3">
			      <input type="hidden" class="form-control" id="editExpr" name="editExpr" placeholder="expr" autocomplete="off" />
			    </div>

			  </div> <!--/form-group-->	

			  <div class="form-group">
			  <div class="col-sm-3">
			      <input type="hidden" class="form-control" id="editConsumer" name="editConsumer" placeholder="consumer" autocomplete="off" />
			    </div>
			    
			  </div> <!--/form-group-->		
	    
			        <div class="modal-footer editProductFooter">
				        <button type="button" class="btn btn-default" data-dismiss="modal"> <i class="glyphicon glyphicon-remove-sign"></i> Close</button>
				        
				        <button type="submit" class="btn btn-success" id="editProductBtn" data-loading-text="Loading..."> <i class="glyphicon glyphicon-ok-sign"></i> Save Changes</button>
				      </div> <!-- /modal-footer -->				     
			        </form> <!-- /.form -->				     	
				    </div>    
				    <!-- /product info -->
				  </div>

				</div>
	      	
	      </div> <!-- /modal-body -->
	      	      
     	
    </div>
    <!-- /modal-content -->
  </div>
  <!-- /modal-dailog -->
</div>
<!-- /categories brand -->

<!-- categories brand -->
<div class="modal fade" tabindex="-1" role="dialog" id="removeProductModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="glyphicon glyphicon-trash"></i> Remove Product</h4>
      </div>
      <div class="modal-body">

      	<div class="removeProductMessages"></div>

        <p>Do you really want to remove ?</p>
      </div>
      <div class="modal-footer removeProductFooter">
        <button type="button" class="btn btn-default" data-dismiss="modal"> <i class="glyphicon glyphicon-remove-sign"></i> Close</button>
        <button type="button" class="btn btn-primary" id="removeProductBtn" data-loading-text="Loading..."> <i class="glyphicon glyphicon-ok-sign"></i> Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- /categories brand -->


<script src="custom/js/Consumables.js"></script>

<?php require_once 'includes/footer.php'; ?>
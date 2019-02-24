var manageProductTable;

$(document).ready(function() {
	// top nav bar 
	$('#navAll').addClass('active');
	// manage product data table
	manageProductTable = $('#manageProductTable').DataTable({
		'ajax': 'php_action/fetchAll.php',
		'order': []
	});

	$("#purchaseDate").datepicker();
	$("#issueDate").datepicker();

	// add product modal btn clicked
	$("#addProductModalBtn").unbind('click').bind('click', function() {
		// // product form reset
		$("#submitProductForm")[0].reset();	
		//$("#purchaseDate").datepicker();


		// remove text-error 
		$(".text-danger").remove();
		// remove from-group error
		$(".form-group").removeClass('has-error').removeClass('has-success');

		// submit product form
		$("#submitProductForm").unbind('submit').bind('submit', function() {

			// form validation
			var consumable = $("#consumable").val();
			var rate = $("#price").val();
			var service_tag = $("#service_tag").val();
			var service_tag_item = $("#serviceTagItem").val();
			var consumableStatus = $("#consumableStatus").val();
			var vendor = $('#vendor').val();

			var purchaseDate = $("#purchaseDate").val();
			var issueDate = $("#issueDate").val();	
			var item_id = $("#itemId").val();

			// form validation 
		
	
		 	if(consumable == "") {
				$("#consumable").after('<p class="text-danger">Consumable Name field is required</p>');
				$('#consumable').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#consumable").find('.text-danger').remove();
				// success out for form 
				$("#consumable").closest('.form-group').addClass('has-success');	  	
			}	// /else

			


			if(rate == "") {
				$("#price").after('<p class="text-danger">Price field is required</p>');
				$('#price').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#price").find('.text-danger').remove();
				// success out for form 
				$("#price").closest('.form-group').addClass('has-success');	  	
			}	// /else

			
			if(service_tag == "") {
				$("#service_tag").after('<p class="text-danger">Service Tag field is required</p>');
				$('#service_tag').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#service_tag").find('.text-danger').remove();
				// success out for form 
				$("#service_tag").closest('.form-group').addClass('has-success');	  	
			}	// /else

			if(vendor == "") {
				$("#vendor").after('<p class="text-danger">Vendor field is required</p>');
				$('#vendor').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#vendor").find('.text-danger').remove();
				// success out for form 
				$("#vendor").closest('.form-group').addClass('has-success');	  	
			}	// /else

				if(purchaseDate == "") {
				$("#purchaseDate").after('<p class="text-danger"> The Purchase Date field is required </p>');
				$('#purchaseDate').closest('.form-group').addClass('has-error');
			} else {
				$('#purchaseDate').closest('.form-group').addClass('has-success');
			} // /else
			



			
			if(consumableStatus == "") {
				$("#consumableStatus").after('<p class="text-danger">Consumable Status field is required</p>');
				$('#consumableStatus').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#consumableStatus").find('.text-danger').remove();
				// success out for form 
				$("#consumableStatus").closest('.form-group').addClass('has-success');	  	
			}	// /else

			if(consumable && service_tag &&rate  && vendor&& purchaseDate && consumableStatus) {
				// submit loading button
				$("#createProductBtn").button('loading');
				//alert('error' +exp +computer_name+service_tag);

				var form = $(this);
				var formData = new FormData(this);
		
				$.ajax({
					url : form.attr('action'),
					type: form.attr('method'),
					data: formData,
					dataType: 'json',
					cache: false,
					contentType: false,
					processData: false,
					success:function(response) {
alert(consumable+rate+service_tag+service_tag_item+consumableStatus+vendor+purchaseDate+issueDate+item_id);
		
						if(response.success == true) {
							alert(consumable+rate+service_tag+service_tag_item+consumableStatus+vendor+purchaseDate+issueDate+item_id);
		
							// submit loading button
							$("#createProductBtn").button('reset');
							
							$//("#submitProductForm")[0].reset();
							$("#service_tag").val("");

							$("html, body, div.modal, div.modal-content, div.modal-body").animate({scrollTop: '0'}, 100);
																	
							// shows a successful message after operation
							$('#add-product-messages').html('<div class="alert alert-success">'+
		            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
		            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
		          '</div>');

							// remove the mesages
		          $(".alert-success").delay(500).show(10, function() {
								$(this).delay(3000).hide(10, function() {
									$(this).remove();
								});
							}); // /.alert

		          // reload the manage student table
							manageProductTable.ajax.reload(null, true);

							// remove text-error 
							$(".text-danger").remove();
							// remove from-group error
							$(".form-group").removeClass('has-error').removeClass('has-success');

						} // /if response.success
						
					} // /success function
				}); // /ajax function
			}	 // /if validation is ok 					

			return false;
		}); // /submit product form

	}); // /add product modal btn clicked
	

	// remove product 	

}); // document.ready fucntion



function editProduct(itemId = null) {
	//alert(itemId);


	if(itemId) {
		$("#itemId").remove();		
		// remove text-error 
		$(".text-danger").remove();
		// remove from-group error
		$(".form-group").removeClass('has-error').removeClass('has-success');
		// modal spinner
		$('.div-loading').removeClass('div-hide');
		// modal div
		$('.div-result').addClass('div-hide');

		$.ajax({
			url: 'php_action/fetchSelectedConsumable.php',
			type: 'post',
			data: {itemId: itemId},
			dataType: 'json',
			success:function(response) {		
			// alert(response.product_image);
				// modal spinner
				$('.div-loading').addClass('div-hide');
				// modal div
				$('.div-result').removeClass('div-hide');				

					$("#editProductImage").fileinput({		      
				});  
				$("#editPurchaseDate").datepicker();
				$("#editIssueDate").datepicker();

				// $("#editProductImage").fileinput({
		  //     overwriteInitial: true,
			 //    maxFileSize: 2500,
			 //    showClose: false,
			 //    showCaption: false,
			 //    browseLabel: '',
			 //    removeLabel: '',
			 //    browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
			 //    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
			 //    removeTitle: 'Cancel or reset changes',
			 //    elErrorContainer: '#kv-avatar-errors-1',
			 //    msgErrorClass: 'alert alert-block alert-danger',
			 //    defaultPreviewContent: '<img src="stock/'+response.product_image+'" alt="Profile Image" style="width:100%;">',
			 //    layoutTemplates: {main2: '{preview} {remove} {browse}'},								    
		  // 		allowedFileExtensions: ["jpg", "png", "gif", "JPG", "PNG", "GIF"]
				// });  

				// product id 
				$(".editProductFooter").append('<input type="hidden" name="itemId" id="itemId" value="'+response.consumables_id+'" />');				
				$(".editProductPhotoFooter").append('<input type="hidden" name="itemId" id="itemId" value="'+response.consumables_id+'" />');				
				
				
				$("#editConsumable").val(response.consumable);
				// quantity
				$("#editServiceTag").val(response.service_tagC);
				// rate
				$("#editPrice").val(response.price);
				// brand name

				$("#editPurchaseDate").val(response.purchase_date);
				// brand name

				$("#editIssueDate").val(response.issue_date);
				// category name
				

				$("div.id_100 select").val(response.item_id);
				//$("div.ids select").val("1");
				// status
				$("#item_names").val(response.item_name);
				// computer name 
				$('#editVendor').val(response.vendor);
				//Service TAG
				$('#editConsumableStatus').val(response.status);
				$('#itemIds').val(response.item_id);
				$('#conId').val(itemId);


				// update the product data function
				$("#editProductForm").unbind('submit').bind('submit', function() {

					// form validation
					var editConsumable = $("#editConsumable").val();
					var editServiceTag = $("#editServiceTag").val();
					var editPrice = $("#editPrice").val();
					var editPurchaseDate = $("#editPurchaseDate").val();
					var editIssueDate = $("#editIssueDate").val();
					var service_tagC = $("#serviceTagItems").val();
					var item_name = $("#item_names").val();
					var editVendor = $('#editVendor').val();
					var editConsumableStatus= $("#editConsumableStatus").val();
								

					if(editConsumable== "") {
						$("#editConsumable").after('<p class="text-danger">Consumable field is required</p>');
						$('#editConsumable').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editConsumable").find('.text-danger').remove();
						// success out for form 
						$("#editConsumable").closest('.form-group').addClass('has-success');	  	
					}	// /else

					

					if(editPrice == "") {
						$("#editPrice").after('<p class="text-danger">Price field is required</p>');
						$('#editPrice').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editPrice").find('.text-danger').remove();
						// success out for form 
						$("#editPrice").closest('.form-group').addClass('has-success');	  	
					}	// /else

					

					if(editServiceTag == "") {
						$("#editServiceTag").after('<p class="text-danger">Service Tag field is required</p>');
						$('#editServiceTag').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editServiceTag").find('.text-danger').remove();
						// success out for form 
						$("#editServiceTag").closest('.form-group').addClass('has-success');	  	
					}	// /else

					/*if(service_tagC == "") {
						$("#serviceTagItems").after('<p class="text-danger">Consumer Service Tag field is required</p>');
						$('#serviceTagItems').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#serviceTagItems").find('.text-danger').remove();
						// success out for form 
						$("#serviceTagItems").closest('.form-group').addClass('has-success');	  	
					}	// /else*/

						if(editVendor == "") {
						$("#editVendor").after('<p class="text-danger">Vendor field is required</p>');
						$('#editVendor').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editVendor").find('.text-danger').remove();
						// success out for form 
						$("#editVendor").closest('.form-group').addClass('has-success');	  	
					}	// /else

					if(editPurchaseDate == "") {
						$("#editPurchaseDate").after('<p class="text-danger">Purchase Date field is required</p>');
						$('#editPurchaseDate').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editPurchaseDate").find('.text-danger').remove();
						// success out for form 
						$("#editPurchaseDate").closest('.form-group').addClass('has-success');	  	
					}	// /else

					/*if(issueDate == "") {
						$("#editIssueDate").after('<p class="text-danger">Issue Date field is required</p>');
						$('#editIssueDate').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editIssueDate").find('.text-danger').remove();
						// success out for form 
						$("#editIssueDate").closest('.form-group').addClass('has-success');	  	
					}	// /else
					*/



					
					if(editConsumableStatus == "") {
						$("#editConsumableStatus").after('<p class="text-danger">Status field is required</p>');
						$('#editConsumableStatus').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editConsumableStatus").find('.text-danger').remove();
						// success out for form 
						$("#editConsumableStatus").closest('.form-group').addClass('has-success');	  	
					}	// /else				

					

					if(editConsumable && editServiceTag && editPrice && editPurchaseDate && editConsumableStatus  && editVendor) {
						// submit loading button
						$("#editProductBtn").button('loading');

						var form = $(this);
						var formData = new FormData(this);

						$.ajax({
							url : form.attr('action'),
							type: form.attr('method'),
							data: formData,
							dataType: 'json',
							cache: false,
							contentType: false,
							processData: false,
							success:function(response) {
								console.log(response);
								//alert(yes);
								if(response.success == true) {
									//alert(yes);

									// submit loading button
									$("#editProductBtn").button('reset');																		

									$("html, body, div.modal, div.modal-content, div.modal-body").animate({scrollTop: '0'}, 100);
																			
									// shows a successful message after operation
									$('#edit-product-messages').html('<div class="alert alert-success">'+
				            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
				            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
				          '</div>');
									

									// remove the mesages
				          $(".alert-success").delay(500).show(10, function() {
										$(this).delay(3000).hide(10, function() {
											$(this).remove();

										});
									}); // /.alert

				          // reload the manage student table
									manageProductTable.ajax.reload(null, true);

									// remove text-error 
									$(".text-danger").remove();
									// remove from-group error
									$(".form-group").removeClass('has-error').removeClass('has-success');

								} // /if response.success
								
							} // /success function
						}); // /ajax function
					} // /if validation is ok 					

					return false;
				}); // update the item data function

				// update the product image				
			

			} // /success function
		}); // /ajax to fetch product image

				
	} else {
		alert('error please refresh the page');
	}
} // /edit product function


// remove product 
function removeProduct(productId = null) {
	if(productId) {
		// remove product button clicked
		$("#removeProductBtn").unbind('click').bind('click', function() {
			// loading remove button
			$("#removeProductBtn").button('loading');
			$.ajax({
				url: 'php_action/removeProduct.php',
				type: 'post',
				data: {productId: productId},
				dataType: 'json',
				success:function(response) {
					// loading remove button
					$("#removeProductBtn").button('reset');
					if(response.success == true) {
						// remove product modal
						$("#removeProductModal").modal('hide');

						// update the product table
						manageProductTable.ajax.reload(null, false);

						// remove success messages
						$(".remove-messages").html('<div class="alert alert-success">'+
		            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
		            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
		          '</div>');

						// remove the mesages
	          $(".alert-success").delay(500).show(10, function() {
							$(this).delay(3000).hide(10, function() {
								$(this).remove();
							});
						}); // /.alert
					} else {

						// remove success messages
						$(".removeProductMessages").html('<div class="alert alert-success">'+
		            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
		            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
		          '</div>');

						// remove the mesages
	          $(".alert-success").delay(500).show(10, function() {
							$(this).delay(3000).hide(10, function() {
								$(this).remove();
							});
						}); // /.alert

					} // /error
				} // /success function
			}); // /ajax fucntion to remove the product
			return false;
		}); // /remove product btn clicked
	} // /if productid
} // /remove product function

function getProductServiceData() {
	
		var itemId = $("#serviceTagItem").val();			
		
		if(itemId == "") {
			$("#item_name").val("");


		} else {
			$.ajax({
				url: 'php_action/fetchSelectedProduct.php',
				type: 'post',
				data: {itemId : itemId},
				dataType: 'json',
				success:function(response) {
					// setting the rate value into the rate input field
					

					$("#item_name").val(response.item_name);


					$('#itemId').val(itemId);
					

				} // /success
			}); // /ajax function to fetch the product data	
		}
				
	
} // /select on product data

function getConsumableServiceData() {
	
		var itemId = $("#serviceTagItems").val();		
		
		if(itemId == "") {
			$("#item_names").val("");


		} else {
			$.ajax({
				url: 'php_action/fetchSelectedProduct.php',
				type: 'post',
				data: {itemId : itemId},
				dataType: 'json',
				success:function(response) {
					// setting the rate value into the rate input field
					

					$("#item_names").val(response.item_name);


					$('#itemIds').val(itemId);
					

				} // /success
			}); // /ajax function to fetch the product data	
		}
				
	
} // /select on product data

function clearForm(oForm) {
	// var frm_elements = oForm.elements;									
	// console.log(frm_elements);
	// 	for(i=0;i<frm_elements.length;i++) {
	// 		field_type = frm_elements[i].type.toLowerCase();									
	// 		switch (field_type) {
	// 	    case "text":
	// 	    case "password":
	// 	    case "textarea":
	// 	    case "hidden":
	// 	    case "select-one":	    
	// 	      frm_elements[i].value = "";
	// 	      break;
	// 	    case "radio":
	// 	    case "checkbox":	    
	// 	      if (frm_elements[i].checked)
	// 	      {
	// 	          frm_elements[i].checked = false;
	// 	      }
	// 	      break;
	// 	    case "file": 
	// 	    	if(frm_elements[i].options) {
	// 	    		frm_elements[i].options= false;
	// 	    	}
	// 	    default:
	// 	        break;
	//     } // /switch
	// 	} // for
}
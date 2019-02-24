var manageProductTable;

$(document).ready(function() {
	// top nav bar 
	$('#navProduct').addClass('active');
	// manage product data table
	manageProductTable = $('#manageProductTable').DataTable({
		'ajax': 'php_action/fetchProduct.php',
		'order': []
	});

	$("#purchaseDate").datepicker();

	// add product modal btn clicked
	$("#addProductModalBtn").unbind('click').bind('click', function() {
		// // product form reset
		$("#submitProductForm")[0].reset();	
		//$("#purchaseDate").datepicker();


		// remove text-error 
		$(".text-danger").remove();
		// remove from-group error
		$(".form-group").removeClass('has-error').removeClass('has-success');

		$("#productImage").fileinput({
	      overwriteInitial: true,
		    maxFileSize: 2500,
		    showClose: false,
		    showCaption: false,
		    browseLabel: '',
		    removeLabel: '',
		    browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
		    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
		    removeTitle: 'Cancel or reset changes',
		    elErrorContainer: '#kv-avatar-errors-1',
		    msgErrorClass: 'alert alert-block alert-danger',
		    defaultPreviewContent: '<img src="assests/images/photo_default.png" alt="Profile Image" style="width:100%;">',
		    layoutTemplates: {main2: '{preview} {remove} {browse}'},								    
	  		allowedFileExtensions: ["jpg", "png", "gif", "JPG", "PNG", "GIF"]
			});   

		// submit product form
		$("#submitProductForm").unbind('submit').bind('submit', function() {

			// form validation
			var productImage = $("#productImage").val();
			var productName = $("#productName").val();
			var quantity = $("#quantity").val();
			var rate = $("#price").val();
			var brandName = $("#brandName").val();
			var service_tag = $("#service_tag").val();
			var computer_name = $("#computer_name").val();
			var exp = $("#exp").val();
			var categoryName = $("#categoryName").val();
			var productStatus = $("#productStatus").val();
			var vendor = $('#vendor').val();

			var purchaseDate = $("#purchaseDate").val();		

			// form validation 
		
	
			if(productImage == "") {
				$("#productImage").closest('.center-block').after('<p class="text-danger">Item Image field is required</p>');
				$('#productImage').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#productImage").find('.text-danger').remove();
				// success out for form 
				$("#productImage").closest('.form-group').addClass('has-success');	  	
			}	// /else

			if(productName == "") {
				$("#productName").after('<p class="text-danger">Item Name field is required</p>');
				$('#productName').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#productName").find('.text-danger').remove();
				// success out for form 
				$("#productName").closest('.form-group').addClass('has-success');	  	
			}	// /else

			if(quantity == "") {
				$("#quantity").after('<p class="text-danger">Quantity field is required</p>');
				$('#quantity').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#quantity").find('.text-danger').remove();
				// success out for form 
				$("#quantity").closest('.form-group').addClass('has-success');	  	
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

			if(computer_name == "") {
				$("#computer_name").after('<p class="text-danger">Computer name field is required</p>');
				$('#computer_name').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#computer_name").find('.text-danger').remove();
				// success out for form 
				$("#computer_name").closest('.form-group').addClass('has-success');	  	
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



			if(brandName == "") {
				$("#brandName").after('<p class="text-danger">Brand Name field is required</p>');
				$('#brandName').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#brandName").find('.text-danger').remove();
				// success out for form 
				$("#brandName").closest('.form-group').addClass('has-success');	  	
			}	// /else

			if(exp == "") {
				$("#exp").after('<p class="text-danger">Expression field is required</p>');
				$('#exp').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#exp").find('.text-danger').remove();
				// success out for form 
				$("#exp").closest('.form-group').addClass('has-success');	  	
			}	// /else


			if(categoryName == "") {
				$("#categoryName").after('<p class="text-danger">Category Name field is required</p>');
				$('#categoryName').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#categoryName").find('.text-danger').remove();
				// success out for form 
				$("#categoryName").closest('.form-group').addClass('has-success');	  	
			}	// /else

			if(productStatus == "") {
				$("#productStatus").after('<p class="text-danger">Product Status field is required</p>');
				$('#productStatus').closest('.form-group').addClass('has-error');
			}	else {
				// remov error text field
				$("#productStatus").find('.text-danger').remove();
				// success out for form 
				$("#productStatus").closest('.form-group').addClass('has-success');	  	
			}	// /else

			if(productImage && productName && quantity && rate && brandName && categoryName && productStatus && exp &&computer_name && service_tag && vendor && purchaseDate) {
				// submit loading button
				
				alert('error' + productImage + productName + quantity + rate + brandName + categoryName + productStatus  + exp + computer_name + service_tag + vendor + purchaseDate);
				$("#createProductBtn").button('loading');
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

						if(response.success == true) {
							// submit loading button
							$("#createProductBtn").button('reset');
							
							$("#submitProductForm")[0].reset();

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

						} else{
							$("#createProductBtn").button('reset');
							
							$("html, body, div.modal, div.modal-content, div.modal-body").animate({scrollTop: '0'}, 100);
							$('#add-product-messages').html('<div class="alert alert-danger">'+
		            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
		            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
		          '</div>');
							 $(".alert-danger").delay(500).show(10, function() {
								$(this).delay(3000).hide(10, function() {
									$(this).remove();
								});
							}); // /.alert
						}
						
					} // /success function
				}); // /ajax function
			}	 // /if validation is ok 					

			return false;
		}); // /submit product form

	}); // /add product modal btn clicked
	

	// remove product 	

}); // document.ready fucntion

function editProduct(itemId = null) {

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
			url: 'php_action/fetchSelectedProduct.php',
			type: 'post',
			data: {itemId: itemId},
			dataType: 'json',
			success:function(response) {		
			// alert(response.product_image);
				// modal spinner
				$('.div-loading').addClass('div-hide');
				// modal div
				$('.div-result').removeClass('div-hide');				

				$("#getProductImage").attr('src', 'invent/'+response.item_image);

				$("#editProductImage").fileinput({		      
				});  
				$("#editPDate").datepicker();

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
				$(".editProductFooter").append('<input type="hidden" name="itemId" id="itemId" value="'+response.item_id+'" />');				
				$(".editProductPhotoFooter").append('<input type="hidden" name="itemId" id="itemId" value="'+response.item_id+'" />');				
				
				// product name
				$("#editProductName").val(response.item_name);
				// quantity
				$("#editQuantity").val(response.quantity);
				// rate
				$("#editRate").val(response.price);
				// brand name

				$("#editPDate").val(response.purchase_date);
				// brand name

				$("#editBrandName").val(response.brand_id);
				// category name
				$("#editCategoryName").val(response.categories_id);
				// status
				$("#editProductStatus").val(response.active);
				// computer name 
				$('#editComputer').val(response.computer_name);
				//Service TAG
				$('#editService').val(response.service_tag);
				//vendor
				$('#editVendor').val(response.vendor);

				//editExpression
				$('#editExpName').val(response.expression_name)

				// update the product data function
				$("#editProductForm").unbind('submit').bind('submit', function() {

					// form validation
					var itemImage = $("#editProductImage").val();
					var itemName = $("#editProductName").val();
					var quantity = $("#editQuantity").val();
					var price = $("#editRate").val();
					var brandName = $("#editBrandName").val();
					var categoryName = $("#editCategoryName").val();
					var itemStatus = $("#editProductStatus").val();
					var computer_name = $('#editComputer').val();
					var service_tag = $('#editService').val();
					var vendor = $('#editVendor').val();
					var exp = $('#editExpName').val();
					var purchaseDate = $("#editPDate").val();
								

					if(itemName == "") {
						$("#editProductName").after('<p class="text-danger">Item Name field is required</p>');
						$('#editProductName').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editProductName").find('.text-danger').remove();
						// success out for form 
						$("#editProductName").closest('.form-group').addClass('has-success');	  	
					}	// /else

					if(quantity == "") {
						$("#editQuantity").after('<p class="text-danger">Quantity field is required</p>');
						$('#editQuantity').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editQuantity").find('.text-danger').remove();
						// success out for form 
						$("#editQuantity").closest('.form-group').addClass('has-success');	  	
					}	// /else

					if(price == "") {
						$("#editRate").after('<p class="text-danger">Price field is required</p>');
						$('#editRate').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editRate").find('.text-danger').remove();
						// success out for form 
						$("#editRate").closest('.form-group').addClass('has-success');	  	
					}	// /else

					if(computer_name == "") {
						$("#editComputer").after('<p class="text-danger">Computer Name field is required</p>');
						$('#editComputer').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editComputer").find('.text-danger').remove();
						// success out for form 
						$("#editComputer").closest('.form-group').addClass('has-success');	  	
					}	// /else

					if(service_tag == "") {
						$("#editService").after('<p class="text-danger">Service Tag field is required</p>');
						$('#editService').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editService").find('.text-danger').remove();
						// success out for form 
						$("#editService").closest('.form-group').addClass('has-success');	  	
					}	// /else

						if(vendor == "") {
						$("#editVendor").after('<p class="text-danger">Vendor field is required</p>');
						$('#editVendor').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editVendor").find('.text-danger').remove();
						// success out for form 
						$("#editVendor").closest('.form-group').addClass('has-success');	  	
					}	// /else

					if(purchaseDate == "") {
						$("#editPDate").after('<p class="text-danger">Purchase Date field is required</p>');
						$('#editPDate').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editPDate").find('.text-danger').remove();
						// success out for form 
						$("#editPDate").closest('.form-group').addClass('has-success');	  	
					}	// /else


					if(brandName == "") {
						$("#editBrandName").after('<p class="text-danger">Brand field is required</p>');
						$('#editBrandName').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editBrandName").find('.text-danger').remove();
						// success out for form 
						$("#editBrandName").closest('.form-group').addClass('has-success');	  	
					}	// /else

					if(categoryName == "") {
						$("#editCategoryName").after('<p class="text-danger">Category field is required</p>');
						$('#editCategoryName').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editCategoryName").find('.text-danger').remove();
						// success out for form 
						$("#editCategoryName").closest('.form-group').addClass('has-success');	  	
					}	// /else

					if(itemStatus == "") {
						$("#editProductStatus").after('<p class="text-danger">Status field is required</p>');
						$('#editProductStatus').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editProductStatus").find('.text-danger').remove();
						// success out for form 
						$("#editProductStatus").closest('.form-group').addClass('has-success');	  	
					}	// /else					

					if(exp == "") {
						$("#editExpName").after('<p class="text-danger">Expression field is required</p>');
						$('#editExpName').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editExpName").find('.text-danger').remove();
						// success out for form 
						$("#editExpName").closest('.form-group').addClass('has-success');	  	
					}	// /else

					if(itemName && quantity && price && brandName && categoryName && itemStatus && computer_name && service_tag && vendor && purchaseDate) {
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
								if(response.success == true) {

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

								}// /if response.success
								
							} // /success function
						}); // /ajax function
					} 	 // /if validation is ok 					

					return false;
				}); // update the item data function

				// update the product image				
				$("#updateProductImageForm").unbind('submit').bind('submit', function() {					
					// form validation
					var productImage = $("#editProductImage").val();					
					
					if(productImage == "") {
						$("#editProductImage").closest('.center-block').after('<p class="text-danger">Product Image field is required</p>');
						$('#editProductImage').closest('.form-group').addClass('has-error');
					}	else {
						// remov error text field
						$("#editProductImage").find('.text-danger').remove();
						// success out for form 
						$("#editProductImage").closest('.form-group').addClass('has-success');	  	
					}	// /else

					if(productImage) {
						// submit loading button
						$("#editProductImageBtn").button('loading');

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
								
								if(response.success == true) {
									// submit loading button
									$("#editProductImageBtn").button('reset');																		

									$("html, body, div.modal, div.modal-content, div.modal-body").animate({scrollTop: '0'}, 100);
																			
									// shows a successful message after operation
									$('#edit-productPhoto-messages').html('<div class="alert alert-success">'+
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

									$(".fileinput-remove-button").click();

									$.ajax({
										url: 'php_action/fetchProductImageUrl.php?i='+itemId,
										type: 'post',
										success:function(response) {
										$("#getProductImage").attr('src', response);		
										}
									});																		

									// remove text-error 
									$(".text-danger").remove();
									// remove from-group error
									$(".form-group").removeClass('has-error').removeClass('has-success');

								} // /if response.success
								
							} // /success function
						}); // /ajax function
					}	 // /if validation is ok 					

					return false;
				}); // /update the product image

			} // /success function
		}); // /ajax to fetch product image

				
	} else {
		alert('error please refresh the page');
	}
} // /edit product function

// remove product 
function removeProduct(itemId = null) {
	if(itemId) {
		// remove product button clicked
		//alert(itemId+"hi");
		$("#removeProductBtn").unbind('click').bind('click', function() {
			// loading remove button
			$("#removeProductBtn").button('loading');
//alert(itemId+"hi");
			$.ajax({
				url: 'php_action/removeProduct.php',
				type: 'post',
				data: {itemId: itemId},
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
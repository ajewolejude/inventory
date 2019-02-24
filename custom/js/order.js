var manageOrderTable;

$(document).ready(function() {

	//$('#itemIdDiv').hide();

	var divRequest = $(".div-request").text();

	// top nav bar 
	$("#navOrder").addClass('active');
	


	if(divRequest == 'add')  {
		// add order	
		// top nav child bar 
		$('#topNavAddOrder').addClass('active');	

		// order date picker
		$("#issueDate").datepicker();
		$("#returnDate").datepicker();

		// create order form function
		$("#createOrderForm").unbind('submit').bind('submit', function() {
			var form = $(this);

			$('.form-group').removeClass('has-error').removeClass('has-success');
			$('.text-danger').remove();

				
			var issueDate = $("#issueDate").val();
			var userName = $("#userName").val();
			var userDept = $("#userDept").val();
			var userEmail = $("#userEmail").val();
			var Status = $("#Status").val();	
			var Expression = $("#Expression").val();	
			var serviceTag = $('#serviceTag').val();
			


			if(userName == "") {
				$("#userName").after('<p class="text-danger"> The User Name field is required </p>');
				$('#userName').closest('.form-group').addClass('has-error');
			} else {
				$('#userName').closest('.form-group').addClass('has-success');
			} // /else
			if(userDept == "") {
				$("#userDept").after('<p class="text-danger"> The User Department field is required </p>');
				$('#userDept').closest('.form-group').addClass('has-error');
			} else {
				$('#userDept').closest('.form-group').addClass('has-success');
			} // /

			if(userEmail == "") {
				$("#userEmail").after('<p class="text-danger"> The User Email field is required </p>');
				$('#userEmail').closest('.form-group').addClass('has-error');

			} else {
				 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(userEmail)){

				 }else{
				 	$('#userEmail').closest('.form-group').addClass('has-success');
				 }
				
			} // /else

		

			

			if(issueDate == "") {
				$("#issueDate").after('<p class="text-danger"> The Issue Date field is required </p>');
				$('#issueDate').closest('.form-group').addClass('has-error');
			} else {
				$('#issueDate').closest('.form-group').addClass('has-success');
			} // /else


			

			if(Status == "") {
				$("#Status").after('<p class="text-danger"> The Status field is required </p>');
				$('#Status').closest('.form-group').addClass('has-error');
			} else {
				$('#Status').closest('.form-group').addClass('has-success');
			} // /else

			if(Expression == "") {
				$("#Expression").after('<p class="text-danger"> The Expression field is required </p>');
				$('#Expression').closest('.form-group').addClass('has-error');
			} else {
				$('#Expression').closest('.form-group').addClass('has-success');
			} // /else

			if(serviceTag == "") {
				$("#serviceTag").after('<p class="text-danger"> The Service Tag field is required </p>');
				$('#serviceTag').closest('.form-group').addClass('has-error');
			} else {
				$('#serviceTag').closest('.form-group').addClass('has-success');
			} // /else


			// array validation
			   		   	
	   	
	       	
	   	

			if(issueDate && userName  && userDept && Status && serviceTag && Expression && userEmail) {
					var form = $(this);

					// create order button
					// $("#createOrderBtn").button('loading');


					 window.location = "http://192.168.1.4/invent/orders.php?o=manord";
							
					$.ajax({
						url : form.attr('action'),
						type: form.attr('method'),
						data: form.serialize(),					
						dataType: 'json',
						success:function(response) {
							console.log(response);
							$("#createOrderBtn").button('reset');
							// reset button
						
							
							$(".text-danger").remove();
							$('.form-group').removeClass('has-error').removeClass('has-success');

							if(response.success == true) {

								
								// create order button
								$(".success-messages").html('<div class="alert alert-success">'+
	            	'<button type="button" class="close" data-dismiss="alert">&times;</button>'+
	            	'<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +	            		            		            	
	   		       '</div>');
								
							$("html, body, div.panel, div.pane-body").animate({scrollTop: '0px'}, 100);


							// disabled te modal footer button
							//$(".editButtonFooter").addClass('div-hide');
							// remove the product row
							//$(".removeProductRowBtn").addClass('div-hide');
							window.location = "http://192.168.1.4/invent/orders.php?o=manord";
								
							} else {
								//alert("hi");
								alert(response.messages);								
							}
							window.location = "http://192.168.1.4/invent/orders.php?o=manord";
						} // /response
					}); // /ajax
			
}// /if field validate is true
			

			return false;
		}); // /create order form function	
	
	} else if(divRequest == 'manord') {
		// top nav child bar 
		$('#topNavManageOrder').addClass('active');

		manageOrderTable = $("#manageOrderTable").DataTable({
			'ajax': 'php_action/fetchOrder.php',
			'order': []
		});		
					
	} else if(divRequest == 'editOrd') {
		$("#issueDate").datepicker();
		$("#returnDate").datepicker();
		//$("#returned").val("2");
		$(".rtd").hide();
		//f($("#returnDate").val() =="0000-00-00") $("#returnDate").val("");	

		//$("#Status").val()=;

		// edit order form function


		if($("#returned").val()==1){
			$(".rtd").show();
			$("#serviceTag").prop("disabled", false);
		} else {
			$(".rtd").hide();
			$("#returnDate").val("");
			$("#serviceTag").prop("disabled", true);

		}
		$('select[name="returned"]').change(function(){
			
			if ($(this).val() == "1"){
$(".rtd").show();
}else {
	 $(".rtd").hide();

	 //$("#returnDate").val("");
}
    

});

		$("#editOrderForm").unbind('submit').bind('submit', function() {
			// alert('ok');
			var form = $(this);

			$('.form-group').removeClass('has-error').removeClass('has-success');
			$('.text-danger').remove();
				
			var issueDate = $("#issueDate").val();

			var returnDate = $("#returnDate").val();
			var itemId = $("#itemId").val();
			var userDept = $("#userDept").val();
			var userName = $("#userName").val();
			var Expression = $("#Expression").val();
			var Status = $("#Status").val();
			var returned = ("#returned").val();	

			var userEmail = $("#userEmail").val();

			if(issueDate == "") {
				$("#issueDate").after('<p class="text-danger"> The Issue Date field is required </p>');
				$('#issueDate').closest('.form-group').addClass('has-error');
			} else {
				$('#issueDate').closest('.form-group').addClass('has-success');
			} // /else
		

			if(userName == "") {
				$("#userName").after('<p class="text-danger"> The User Name field is required </p>');
				$('#userName').closest('.form-group').addClass('has-error');
			} else {
				$('#userName').closest('.form-group').addClass('has-success');
			} // /else

				if(userDept == "") {
				$("#userDept").after('<p class="text-danger"> The User Department field is required </p>');
				$('#userDept').closest('.form-group').addClass('has-error');
			} else {
				$('#userDept').closest('.form-group').addClass('has-success');
			} // /else

			if(Status == "") {
				$("#Status").after('<p class="text-danger"> The Status field is required </p>');
				$('#Status').closest('.form-group').addClass('has-error');
			} else {
				$('#Status').closest('.form-group').addClass('has-success');
			} // /else

			if(Expression == "") {
				$("#Expression").after('<p class="text-danger"> The Expression field is required </p>');
				$('#Expression').closest('.form-group').addClass('has-error');
			} else {
				$('#Expression').closest('.form-group').addClass('has-success');
			} // /else

			if(serviceTag == "") {
				$("#serviceTag").after('<p class="text-danger"> The Service Tag field is required </p>');
				$('#serviceTag').closest('.form-group').addClass('has-error');
			} else {
				$('#serviceTag').closest('.form-group').addClass('has-success');
			} // /else

			if($("#returned").val()==1){
			if(returnDate == "") {
				$("#returnDate").after('<p class="text-danger"> The Return Date field is required </p>');
				$('#returnDate').closest('.form-group').addClass('has-error');
				return false;
			} else {
				$('#returnDate').closest('.form-group').addClass('has-success');
			} // /else
		} 
			if(userEmail == "") {
				$("#userEmail").after('<p class="text-danger"> The User Email field is required </p>');
				$('#userEmail').closest('.form-group').addClass('has-error');

			} else {
				 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(userEmail)){
				 		
				 }else{
				 	$('#userEmail').closest('.form-group').addClass('has-success');
				 }
				
			} // /else
			/*if(returned == ""){
				$("#returned").after('<p class="text-danger"> The Returned field is required </p>');
				$('#returned').closest('.form-group').addClass('has-error');
			} else {
				$('#returned').closest('.form-group').addClass('has-success');
			} // /else*/


			

			userName="";
			if(issueDate && userName  && userDept && Status && serviceTag && Expression && userEmail) {
				
					// create order button
					 $("#createOrderBtn").button('loading');


					$.ajax({
						url : form.attr('action'),
						type: form.attr('method'),
						data: form.serialize(),					
						dataType: 'json',
						success:function(response) {
							console.log(response);

							// reset button
							$("#editOrderBtn").button('reset');
							
							$(".text-danger").remove();
							$('.form-group').removeClass('has-error').removeClass('has-success');

							if(response.success == true) {

								
								// create order button
								$(".success-messages").html('<div class="alert alert-success">'+
	            	'<button type="button" class="close" data-dismiss="alert">&times;</button>'+
	            	'<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +	            		            		            	
	   		       '</div>');
								
							$("html, body, div.panel, div.pane-body").animate({scrollTop: '0px'}, 100);


							// disabled te modal footer button
							$(".editButtonFooter").addClass('div-hide');
							// remove the product row
							$(".removeProductRowBtn").addClass('div-hide');
							window.location = "http://192.168.1.4/invent/orders.php?o=manord";
								
							} else {
								//alert("hi");
								alert(response.messages);								
							}
							window.location = "http://192.168.1.4/invent/orders.php?o=manord";
						} // /response
					}); // /ajax
			} // /if field validate is true
			

			return false;
		}); // /edit order form function	
	} 	

}); // /documernt


// print order function
function printOrder(orderId = null) {
	if(orderId) {		
			
		$.ajax({
			url: 'php_action/printOrder.php',
			type: 'post',
			data: {orderId: orderId},
			dataType: 'text',
			success:function(response) {
				
				var mywindow = window.open('', 'Inventory Management System', 'height=400,width=600');
        mywindow.document.write('<html><head><title>User Request Slip</title>');        
        mywindow.document.write('</head><body>');
        mywindow.document.write(response);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10

        mywindow.print();
        mywindow.close();
				
			}// /success function
		}); // /ajax function to fetch the printable order
	} // /if orderId
} // /print order function


function mailOrder(orderId = null) {
	if(orderId) {		
			
		$.ajax({
			url: 'php_action/mailOrder.php',
			type: 'post',
			data: {orderId: orderId},
			dataType: 'text',
			success:function(response) {
				
				alert('mail sent');
				
			}// /success function
		}); // /ajax function to fetch the printable order
	} // /if orderId
} // /print order function



function getProductServiceData() {
	
		var itemId = $("#serviceTag").val();		
		
		if(itemId == "") {
			$("#rate").val("");
			$("#item_name").val("")

			$("#Computer").val("");						
			$("#total").val("");
			$("#category").val("");

			// remove check if product name is selected
			// var tableProductLength = $("#productTable tbody tr").length;			
			// for(x = 0; x < tableProductLength; x++) {
			// 	var tr = $("#productTable tbody tr")[x];
			// 	var count = $(tr).attr('id');
			// 	count = count.substring(3);

			// 	var productValue = $("#productName"+row).val()

			// 	if($("#productName"+count).val() == "") {					
			// 		$("#productName"+count).find("#changeProduct"+productId).removeClass('div-hide');	
			// 		console.log("#changeProduct"+count);
			// 	}											
			// } // /for

		} else {
			$.ajax({
				url: 'php_action/fetchSelectedProduct.php',
				type: 'post',
				data: {itemId : itemId},
				dataType: 'json',
				success:function(response) {
					// setting the rate value into the rate input field
					
					$("#rate").val(response.price);
					$("#rateValue").val(response.price);
					$("#item_name").val(response.item_name);
					$("#item_nameValue").val(response.item_name);

					$("#category").val(response.categories_name);
					$("#categoryValue").val(response.categories_name);



					$("#Computer").val(response.computer_name);
					$("#ComputerValue").val(response.computer_name);

					$('#itemId').val(itemId);

					
					// check if product name is selected
					// var tableProductLength = $("#productTable tbody tr").length;					
					// for(x = 0; x < tableProductLength; x++) {
					// 	var tr = $("#productTable tbody tr")[x];
					// 	var count = $(tr).attr('id');
					// 	count = count.substring(3);

					// 	var productValue = $("#productName"+row).val()

					// 	if($("#productName"+count).val() != productValue) {
					// 		// $("#productName"+count+" #changeProduct"+count).addClass('div-hide');	
					// 		$("#productName"+count).find("#changeProduct"+productId).addClass('div-hide');								
					// 		console.log("#changeProduct"+count);
					// 	}											
					// } // /for
			
				} // /success
			}); // /ajax function to fetch the product data	
		}
				
	
} // /select on product data




function resetOrderForm() {
	// reset the input field
	$("#createOrderForm")[0].reset();
	// remove remove text danger
	$(".text-danger").remove();
	// remove form group error 
	$(".form-group").removeClass('has-success').removeClass('has-error');
} // /reset order form


// remove order from server
function removeOrder(orderId = null) {
	if(orderId) {
		$("#removeOrderBtn").unbind('click').bind('click', function() {
			$("#removeOrderBtn").button('loading');

			$.ajax({
				url: 'php_action/removeOrder.php',
				type: 'post',
				data: {orderId : orderId},
				dataType: 'json',
				success:function(response) {
					$("#removeOrderBtn").button('reset');

					if(response.success == true) {

						manageOrderTable.ajax.reload(null, false);
						// hide modal
						$("#removeOrderModal").modal('hide');
						// success messages
						$("#success-messages").html('<div class="alert alert-success">'+
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
						// error messages
						$(".removeOrderMessages").html('<div class="alert alert-warning">'+
	            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
	            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
	          '</div>');

						// remove the mesages
	          $(".alert-success").delay(500).show(10, function() {
							$(this).delay(3000).hide(10, function() {
								$(this).remove();
							});
						}); // /.alert	          
					} // /else

				} // /success
			});  // /ajax function to remove the order

		}); // /remove order button clicked
		

	} else {
		alert('error! refresh the page again');
	}
}
// /remove order from server

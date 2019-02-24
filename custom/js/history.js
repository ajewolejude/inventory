var manageOrderTable;

$(document).ready(function() {

	var divRequest = $(".div-request").text();

	// top nav bar 
	$("#navProduct").addClass('active');
		// edit order form function
		
		
		$("#editOrderForm").unbind('submit').bind('submit', function() {
			// alert('ok');
			var form = $(this);

			$('.form-group').removeClass('has-error').removeClass('has-success');
			$('.text-danger').remove();
				
			var productHistory = $("#productHistory").val();	

			// form validation 
			

			if(productHistory == "") {
				$("#productHistory").after('<p class="text-danger"> The Contact field is required </p>');
				$('#productHistory').closest('.form-group').addClass('has-error');
			} else {
				$('#productHistory').closest('.form-group').addClass('has-success');
			} // /else

		
			
			// array validation
			var productHistory = document.getElementsByName('productHistory[]');				
			var validateProduct;
			for (var x = 0; x < productHistory.length; x++) {       			
				var productHistoryId = productHistory[x].id;	    	
		    if(productHistory[x].value == ''){	    		    	
		    	$("#"+productHistoryId+"").after('<p class="text-danger"> Product History Field is required!! </p>');
		    	$("#"+productHistoryId+"").closest('.form-group').addClass('has-error');	    		    	    	
	      } else {      	
		    	$("#"+productHistoryId+"").closest('.form-group').addClass('has-success');	    		    		    	
	      }          
	   	} // for

	   	for (var x = 0; x < productHistory.length; x++) {       						
		    if(productHistory[x].value){	    		    		    	
		    	validateProduct = true;
	      } else {      	
		    	validateProduct = false;
	      }          
	   	} // for       		   	
	   	

			if(productHistory) {
				if(validateProduct ) {
					// create order button
					// $("#createOrderBtn").button('loading');

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
								
							} else {
								alert(response.messages);								
							}
						} // /response
					}); // /ajax
				} // if array validate is true
			} // /if field validate is true
			

			return false;
		}); // /edit order form function	

}); // /documernt



function addRow() {
	$("#addRowBtn").button("loading");

	var tableLength = $("#productTable tbody tr").length;

	var tableRow;
	var arrayNumber;
	var count;

	if(tableLength > 0) {		
		tableRow = $("#productTable tbody tr:last").attr('id');
		arrayNumber = $("#productTable tbody tr:last").attr('class');
		count = tableRow.substring(3);	
		count = Number(count) + 1;
		arrayNumber = Number(arrayNumber) + 1;					
	} else {
		// no table row
		count = 1;
		arrayNumber = 0;
	}


			$("#addRowBtn").button("reset");			

			var tr = '<tr id="row'+count+'" class="'+arrayNumber+'">'+	
				
				'<td>'+
					'<div class="form-group">'+

				count+
				'</td>'+
			
				'<td>'+
					'<div class="form-group">'+

					'<textarea rows="4" cols="50" type="text" name="productHistory[]" id="productHistory'+count+'" autocomplete="off" required class="form-control"></textarea>'+
				'</td>'+
				
				'<td>'+
					'<div class="form-group" style="margin-left:10px;margin-right:20px;">'+

					'<input type="date" name="orderDate[]" id="orderDate'+count+'"  autocomplete="off" required class="form-control" />'+
				'</td>'+
				'<td>'+
					'<button class="btn btn-default removeProductRowBtn" type="button" onclick="removeProductRow('+count+')"><i class="glyphicon glyphicon-trash"></i></button>'+
				'</td>'+
			'</tr>';
			if(tableLength > 0) {							
				$("#productTable tbody tr:last").after(tr);
			} else {				
				$("#productTable tbody").append(tr);
			}		
			  				

} // /add row
function dateP() {
    $('*[id*=orderDate]').each(function() {
    $(this).datepicker();
});
}

function removeProductRow(row = null) {
	if(row) {
		$("#row"+row).remove();


		subAmount();
	} else {
		alert('error! Refresh the page again');
	}
}


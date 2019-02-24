<?php require_once 'includes/header.php'; ?>

<?php 

$sql = "SELECT * FROM item WHERE status = 1";
$query = $connect->query($sql);
$countProduct = $query->num_rows;

$orderSql = "SELECT * FROM requests";
$orderQuery = $connect->query($orderSql);
$countOrder = $orderQuery->num_rows;

$totalRevenue = "";
while ($orderResult = $query->fetch_assoc()) {
	$totalRevenue += $orderResult['price'];
}

$lowStockSql = "SELECT * FROM consumables WHERE consumer = ''";
$lowStockQuery = $connect->query($lowStockSql);
$countLowStock = $lowStockQuery->num_rows;

$usedStockSql = "SELECT * FROM consumables WHERE consumer != ''";
$usedStockQuery = $connect->query($usedStockSql);
$countUsedStock = $usedStockQuery->num_rows;

$connect->close();

?>


<style type="text/css">
	.ui-datepicker-calendar {
		display: none;
	}
	span{
		font-family: verdana;
	}
</style>

<!-- fullCalendar 2.2.5-->
    <link rel="stylesheet" href="assests/plugins/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="assests/plugins/fullcalendar/fullcalendar.print.css" media="print">


<div class="row">
	
	

	<div class="col-md-5">

		<div class="panel panel-default">
			<div class="panel-heading"> <i class="glyphicon glyphicon-calendar"></i> Calendar</div>
			<div class="panel-body">
				<div id="calendar"></div>
			</div>	
		</div>

		

	</div>

	<div class="col-md-7">
		

		<div class="card">
		  <div class="cardHeader">
		    <h1><?php echo date('d'); ?></h1>
		  </div>

		  <div class="cardContainer">
		    <p><?php $d = date('l') .' '.date('d').', '.date('Y');
		    echo strtoupper($d); ?></p>
		  </div>
		</div> 
		<br/>

		<div class="card">
		  <div class="cardHeader" style="background-color:#245580;">
		    <h1><?php if($totalRevenue) {
		    	echo "₦".$totalRevenue;
		    	} else {
		    		echo '0';
		    		} ?></h1>
		  </div>

		  <div class="cardContainer">
		    <p>HOF I.T ASSET VALUE</p>
		  </div>
		</div> 

<br>

			<a href="product.php" style="text-decoration:none;color:black;">
		<div class="panel panel-success" >
			<div class="panel-heading" style = "height:60px;vertical-align: middle;padding: 15px; font-size: 20px;">
				
				
					TOTAL ASSET
					<span class="badge pull pull-right" style = " font-size: 15px;"><?php echo $countProduct; ?></span>	
				
				
			</div> <!--/panel-hdeaing-->
		</div> <!--/panel-->
		</a>

		<a href="orders.php?o=manord" style="text-decoration:none;color:black;">
			<div class="panel panel-info">
			<div class="panel-heading" style = "height:60px;vertical-align: middle;padding: 15px; font-size: 20px;">
				
					HARDWARE REQUESTS
					<span class="badge pull pull-right" style = " font-size: 15px;"><?php echo $countOrder; ?></span>
				
					
			</div> <!--/panel-hdeaing-->
		</div> <!--/panel-->
		</a>

				<a href="consumables.php" style="text-decoration:none;color:black;">
		<div class="panel panel-danger">
			<div class="panel-heading" style = "height:60px;vertical-align: middle;padding: 15px; font-size: 20px;">
				
					CONSUMABLES-IN-STOCK
					<span class="badge pull pull-right" style = " font-size: 15px;"><?php echo $countLowStock; ?></span>	
				
				
			</div> <!--/panel-hdeaing-->
		</div> <!--/panel-->
		</a>

				<a href="consumables.php" style="text-decoration:none;color:black;">
		<div class="panel panel-warning">
			<div class="panel-heading" style = "height:60px;vertical-align: middle;padding: 15px; font-size: 20px;">
				
					CONSUMABLES USED
					<span class="badge pull pull-right" style = " font-size: 15px;"><?php echo $countUsedStock; ?></span>	
				
				
			</div> <!--/panel-hdeaing-->
		</div> <!--/panel-->
		</a>
		
	</div>

	
</div> <!--/row-->

<!-- fullCalendar 2.2.5 -->
<script src="assests/plugins/moment/moment.min.js"></script>
<script src="assests/plugins/fullcalendar/fullcalendar.min.js"></script>


<script type="text/javascript">
	$(function () {
			// top bar active
	$('#navDashboard').addClass('active');

      //Date for the calendar events (dummy data)
      var date = new Date();
      var d = date.getDate(),
      m = date.getMonth(),
      y = date.getFullYear();

      $('#calendar').fullCalendar({
        header: {
          left: '',
          center: 'title'
        },
        buttonText: {
          today: 'today',
          month: 'month'          
        }        
      });


    });
</script>

<?php require_once 'includes/footer.php'; ?>
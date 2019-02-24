<?php
	require_once 'core.php';
	
		
	if(ISSET($_POST['submit'])){
		$orderId = $_POST['orderId'];
		//echo "<script>alert('Required Field!')</script>";
		if($_FILES['upload']['name'] != "") {
			$file = $_FILES['upload'];
			
			$file_name = $file['name'];
			$file_temp = $file['tmp_name'];
			$name = explode('.', $file_name);
			$path = "files/".$file_name;
			
			$connect->query("UPDATE file SET name = '$name[0]', file = '$path' WHERE request_id = $orderId") or die(mysqli_error($connect));
			
			move_uploaded_file($file_temp, $path);

	header("Location:http://192.168.1.4/invent/orders.php?o=editOrd&i=".$orderId); 
			
		}else{
			echo "<script>alert('Required Field!')</script>";
	header("Location:http://192.168.1.4/invent/orders.php?o=manord"); 
		}
	} else {echo "<script>alert('Required Field!')</script>";}
?>
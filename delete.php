<?php
	include("conn.php");
	
		$r=$_GET['rollno'];
		$sql="DELETE FROM `student` WHERE rollno=$r";
		echo $sql;
		$res=mysqli_query($mysqli,$sql);
		if($res===TRUE)
		{
			echo "record has been deleted";
		}
		else
		{
			echo "record has not deleted";
		}
	
?>
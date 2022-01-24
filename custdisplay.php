<?php 
$mysqli=mysqli_connect("localhost","root","","jvims");

if (mysqli_connect_errno()){
	printf("connect failed: %s\n",
	mysqli_connect_error());
	exit();
}
		$sql="SELECT `cust_no`, `cust_name`, `item_purches`, `mo_no` FROM `customer`  ";
		$res=mysqli_query($mysqli,$sql);
		//echo $res->num_rows;
		if($res->num_rows>0)
		{
			echo "<table border='6'align='center'bordercolor='black' bgcolor='pink' height='50%' width='50%' >";
			while($row=mysqli_fetch_array($res,MYSQLI_ASSOC))
			{
				$r=$row['cust_no'];
				$n=$row['cust_name'];
				$a=$row['item_purches'];
				$m=$row['mo_no'];
				echo "<tr><td>$r</td><td>$n</td><td>$a</td><td>$m</td></tr>";
				
			}
			echo "</table>";
			
		}
		else
		{	
		   echo "no record found";
		}
		
	
?>
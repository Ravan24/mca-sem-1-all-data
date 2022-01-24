<?php
	include("conn.php");
		$sql="SELECT `rollno`, `name`, `age` FROM `student ";
		$res=mysqli_query($mysqli,$sql);
		echo $res->num_rows;
		if($res->num_rows>0)
		{
			echo "<table border='2'>";
			while($row=mysqli_fetch_array($res,MYSQLI_ASSOC))
			{
				$r=$row['rollno'];
				$n=$row['name'];
				$a=$row['age'];
				echo "<tr><td>$r</td><td>$n</td><td>$a</td>";
				echo "<td><a href='delete.php?rollno=$r'>DELETE</a></td>";
				echo "<td><a href='update.php?rollno=$r'>UPDATE</a></td></tr>";
			}
			echo "</table>";
			
		}
		else
		{	
		   echo "no record found";
		}
		
	
?>
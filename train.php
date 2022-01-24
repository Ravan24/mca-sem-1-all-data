<form method="POST" >
<input type="text" name="text1">
<input type="submit" name="search" value="search">
</form>
<?php
  if(isset($_POST['search']))
	{
		
				function data()
				{
					
					
				include("conn.php");
				$sql1 = "select trainno, code, name, type ,s_city, d_city,flag from traindb ";
				$sql1 .= " order by trainno";

				$res1 = mysqli_query($mysqli, $sql1);
					if($res1->num_rows>0)
					{
						
						//echo "Show records";
						echo "<table border='1' cellpadding='5px' align='center'>";
						while($row = mysqli_fetch_array($res1, MYSQLI_ASSOC))
						{	
							$id=$row['trainno'];
							$td=$row['type'];
							$sd=$row['s_city'];
							$dd=$row['d_city'];
							$fl=$row['flag'];

							$t=$_POST['text1'];
							if($t==$sd)
							{
								echo "<tr><td>$id</td><td>$sd</td>";
								echo "<td>$dd</td><td>$fl</td>";
								
								echo "</tr>";
						
							}	
							else if($t==$td)
							{
								echo "<tr><td>$id</td><td>$sd</td>";
								echo "<td>$dd</td><td>$fl</td>";
								
								echo "</tr>";
							}
							else if($t==$fl)
							{
								echo "<tr><td>$id</td><td>$sd</td>";
								echo "<td>$dd</td><td>$fl</td>";
								
								echo "</tr>";
							}
						}
					}
				}
	
							
			
		
		data();
		
	}
		
	
?>

	
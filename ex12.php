<h1 align="center">
<?php
include("conn.php");
echo $_REQUEST['myname']??"";

if(isset($_REQUEST['page']))
{
	$page=$_POST['page'] ?? 0;
	$page=($page-1)*3;
	$sql="SELECT * FROM `student LIMIT $page,3 ";
	$res=mysqli_query($mysqli,$sql);
		
		if($res->num_rows>0)
		{
			echo "<table border='2'>";
			while($row=mysqli_fetch_array($res,MYSQLI_ASSOC))
			{
				$r=$row['rollno'];
				$n=$row['name'];
				$a=$row['age'];
				echo "<tr><td>$r</td><td>$n</td><td>$a</td>";
				
			}
			echo "</table>";
			
		}
		
	
	
}
else
{
		
			
		   echo "no record found";
		
		
}
echo "<br/><br/><br/>";
$n=3;
for($i=1;$i<=$n;$i++)
{
	echo "<a href='ex12.php? page=$i'>$i</a> |";
}
?></h1>
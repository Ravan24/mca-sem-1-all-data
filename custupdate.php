<form method="POST"  >
Roll no<input type="number" name="rno" value="<?php $rno ?> ">   <br>                                                                                         
name<input type="text" name="name" value="<?php $name ?>"><br>
age<input type="text" name="age" value="<?php $age ?>"><br>
<input type="submit" value="UPDATE">
</form>
<?php
include("conn.php");
   $rno=$_POST["rno"];
   $name=$_POST["name"];
   $age=$_POST["age"];
 $sql="UPDATE `student` SET `name`='$name',`age`='$age' WHERE rollno='$rno'";

$res=mysqli_query($mysqli,$sql);
if ($res==TRUE){
	echo "A record has been update";
}
else 
{
	printf("could not update record: %s/n",
	mysqli_error($mysqli));
	
}
?>



<form method="POST" >
Roll no<input type="number" name="rno"><br>
name<input type="text" name="name"><br>
age<input type="text" name="age"><br>
<input type="submit" value="insert">
</form>
<?php 

if($_POST)
{
include("conn.php");
$rno=$_POST["rno"];
$name=$_POST["name"];
$age=$_POST["age"];

$sql="INSERT INTO `student`(`rollno`, `name`, `age`) VALUES($rno,'$name',$age)";

$res=mysqli_query($mysqli,$sql);
if ($res==TRUE){
	echo "A record has been inserted";
}
else 
{
	printf("could not insert record: %s/n",
	mysqli_error($mysqli));
	
}
mysqli_close($mysqli);
echo "record insert successfully";
}
?>
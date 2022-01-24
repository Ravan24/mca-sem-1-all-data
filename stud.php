<?php 
$mysqli=mysqli_connect("localhost","root","","jvims")
if(mysqli_connect_error())
{
		echo "connection faild";
}
$rollno=$_POST['rno'];
$name=$_POST['name'];
$age=$_POST['age'];
$sql="insert into student(rno,'name',age)values($rno,'$name',$age)";
$res=mysqli_query($mysqli,$sql);
if ($res==TRUE){
	echo "A record has been inserted";
}
else
{
	echo "record not inserted";
}
?>
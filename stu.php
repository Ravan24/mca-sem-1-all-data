<?php 
$mysqli=mysqli_connect("localhost","root","","jvims");

if (mysqli_connect_errno()){
	printf("connect failed: %s\n",
	mysqli_connect_error());
	exit();
}

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

?>
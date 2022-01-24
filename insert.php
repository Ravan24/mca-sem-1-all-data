<?php 
$mysqli=mysqli_connect("localhost","root","","jvims");

if (mysqli_connect_errno()){
	printf("connect failed: %s\n",
	mysqli_connect_error());
	exit();
}
$fname= $_POST['fname'];
$mname= $_POST['mname'];
$lname= $_POST['lname'];

$sql="insert into testTable (fname,mname,lname)values ('$fname', '$mname','$lname')";

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
<a href="coonection.php">back</a>
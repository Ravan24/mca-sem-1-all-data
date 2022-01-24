<?php 
$mysqli=mysqli_connect("localhost","root","","jvims");

if (mysqli_connect_errno()){
	printf("connect failed: %s\n",
	mysqli_connect_error());
	exit();
}

$email1= $_POST['email'];

$sql="INSERT INTO `email`(`Email`) VALUES ('$email1')";

$res=mysqli_query($mysqli,$sql);
if ($res===TRUE)
{
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
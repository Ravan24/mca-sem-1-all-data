<?php
$mysqli = mysqli_connect("localhost","root", "" ,"jvims");
if (mysqli_connect_errno())
{
	printf("connect failed: %s\n",
	mysqli_connect_error());
	exit();
}
?>
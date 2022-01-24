<?php 
$mysqli=mysqli_connect("localhost","root","","jvims");

if (mysqli_connect_errno()){
	printf("connect failed: %s\n",
	mysqli_connect_error());
	exit();
}
$no= $_POST['no'];
$name= $_POST['name'];
$item= $_POST['item'];
$moblie= $_POST['mobile'];



$sql="INSERT INTO `customer`(`cust_no`, `cust_name`, `item_purches`, `mo_no`) VALUES  ('$no', '$name','$item','$moblie')";

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
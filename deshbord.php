<?php
session_start();
if(isset($_SESSION('id'))
{
	echo $_SESSION['user_name'];
}
else
{
	echo "error";
	header ("location:loginsess.php");
}
?>
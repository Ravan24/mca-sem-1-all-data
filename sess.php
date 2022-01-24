<?php
	session_start();
	if(isset($_SESSION['myname']))
	{
		echo $_SESSION['myname'];
	}
	else
	{
			$_SESSION['myname']="priyank";
	}
	
?>
<a href="sess1.php">next</a>
<?php
session_start();
if(isset($_SESSION['page_count']))
{
	echo "<br>welcome back";
	$_SESSION['page_count']+=1;
	echo "<br>";
	$m=time();
	echo $m;
	
}
else
{
		echo "<br>welcome user ,you have visited this first time";
		$_SESSION['page_count']=1;
}
echo "<br>Total page counnt:".$_SESSION['page_count'];
echo "<br>";
$t=date('H-M-Y');

	
	echo $t;
?>
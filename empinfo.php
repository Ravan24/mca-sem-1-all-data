<?php
	echo '<br>'.$_POST['name'];
	echo '<br>'.$_POST['no'];
	echo '<br>'.$_POST['email'];
	$s=$_POST['salary'];
	echo '<br>'.$s;
	$hr=($s*10)/100;
	echo '<br>HR '.$hr;
		$d=($s*20)/100;
	echo '<br>DA '.$d;
		$pf=($s*12)/100;
	echo '<br>PF '.$pf;
		$pt=($s*2)/100;
	echo '<br>PT '.$pt;
	$sl=$s+$hr+$d-$pf+$pt;
	echo '<br> Total:-' .$sl;
	
?>	

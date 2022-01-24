<?php
	$a="priyank";
	function f1()
	{
	
		echo $GLOBALS['a'];
		$a="hi ";
		$a= "<br> ".$a;
			return $a;
	}
	$ans=f1();	echo $ans;
?>	
<?php
	$a="priyank";
	function f1(...$a)
	{
		var_dump($a);
	}
	f1(1,23,567);
?>	
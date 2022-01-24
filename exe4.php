<?php
function name()
{
	echo "<br>";
	echo "priyank sorathiya";
	
}
echo name();
echo "<br>************************";
//b
function str_count($str='x')
{
	echo "<br>String:";
	echo $str;
	echo "<br> strlen:";
	echo strlen($str);
}
echo str_count('priyank sorathiya');
echo str_count( 'priyank sorathiya','raja');
echo str_count();
echo "<br>************************";
//c
function sum(...$num)
{
	$sum =0;
	$count=0;
	foreach($num as $n)
	{
		$sum+=$n;
		$count++;
	}
	echo "<br/>Total argument:".$count;
	echo "<br>";
	return $sum;
}
	
	
	


?>
<?php
$a=array("a","b","c");
$b=array("aa","ba","ca");
$c=array_merge($a,$b);
print_r($a);
echo "<br>";
print_r($b);
echo "<br>";
print_r($c);
echo "<br>";
echo "**************";
echo "<br>";
$na=array(1,2,3,4,5,6,7,8,9,99);
echo array_sum($na);
$t=0;
for($i=0;$i<count($na);$i++)
{
	$t=$t+$na[$i];
}
echo "<br> sum:".$t;


?>
<?php
$a=array("fname"=>"priyank","mname"=>"sorathiya");
$cars=array("volvo","bmw","kiy");
print_r($cars);

for($i=0;$i<count($cars);$i++)
{
	echo "<br/>[$i] : ".$cars[$i];
}
echo "<br>";
echo "***********************************************************************************";
 foreach($cars as $i)
 {
	 echo "<br>";
	 echo $i;
 }
 foreach($a as $k =>$v)
 {
	 echo"key".$k.",value=".$v;
	 echo "<br>";
 }
 echo "<br>";
 echo "******************************sorting***********************************";
 echo "<br>";
 print_r($cars);
 sort($cars);
 print_r($cars);
 rsort($cars);
 echo "<br>";
 print_r($cars);
 echo "<br>";
 echo "********************associatve sorting values*************************";
 echo "<br>";
 print_r($a);
 asort($a);
 echo "<br>";
 print_r($a);
 arsort($a);
 echo "<br>";
 print_r($a);
 echo "<br>";
 echo "****************************associatve sorting key **********************";
 $a=array("fname"=>"priyank","mname"=>"sorathiya");
 echo "<br>";
 print_r($a);
 echo "<br>";
 print_r($a);
 krsort($a);
 echo "<br>";
 print_r($a);
?>
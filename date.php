<?php
echo "Current date and time is :";
date_default_timezone_set("Asia/Calcutta");
$myDate = date("H");
echo $myDate;
	if($myDate < 12)
	{
		echo "good morning";
	}
	elseif($myDate  >= 12 && $myDate <= 17)
	{
		echo "good afternoon";
	}
	elseif($myDate  >= 17 && $myDate <= 19)
	{
		echo "good evening";
	}
	elseif($myDate  >= 19)
	{
		echo "good night";
	}
?>

<?php
	$cookie_name ="my_user_name";
	$cookie_value="Yash Kotecha";
	/*
	setcookie($cookie_name,$cookie_value,time()+(86400*30),"/");// 86400 = 1day
	
	if(!isset($_COOKIE[$cookie_name]))
	{
		echo "Cookie named '".$cookie_name."'is not set ";
		
	}
	else
	{
		echo "Cookie '".$cookie_name."'is set<br>";
		echo "value is :".$_COOKIE[$cookie_name];
	}
*/
	setcookie($cookie_name,null,time() -10,"/");
	 unset($_COOKIE[$cookie_name]);
	 echo "Cookie $cookie_name is deleted";

?>
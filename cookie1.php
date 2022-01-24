<form method="post" action="">
	Name <input type="text" name="name" >
	Value <input type="text" name="val" >
	
	Submit <input type="submit" name="button" >
	
</form>

<?php
if(isset($_POST['button']))
{
	$cookie_name =$_POST['name'];
	$cookie_value=$_POST['val'];
	
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

/*
	setcookie($cookie_name,null,time() -10,"/");
	 unset($_COOKIE[$cookie_name]);
	 echo "Cookie $cookie_name is deleted";
*/
}
else
{
	var_dump($_COOKIE);
}
?>
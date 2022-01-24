<?php
session_start();
if($_POST)
{
	$uname=$_POST['user_name'];
	$pwd=$_POST['password'];
	$mysqli=new mysqli("localhost","root","","jvims");
	$sql="SELECT * FROM `login` WHERE `user_name`='$uname' and `password`='$pwd' ";
		$res=$mysqli->query($sql);
		if($res->num_rows>0)
		{
			
			while($row=mysqli_fetch_array($res,MYSQLI_ASSOC))
			{
					$row=$res->fetch_assoc();
					$_SESSION['user_name']=$row['id'];
					$_SESSION['password']=$uname;
					$msg="login success";
			}
		}
		else
		{	
		   echo "login fail";
		}
		
		$mysqli->close();
}
?>
<form>
username<input type="text" name="username"><br>
password<input type="text" name="password"><br>
<input type="submit" name="login">
<a href="logout.php">logout</a>
</form> 
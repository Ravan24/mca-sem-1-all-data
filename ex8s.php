<?php
	$cn="pc1";
	if(isset($_COOKIE[$cn]))
	{
		$a=$_COOKIE[$cn]+=1;
		setcookie($cn,''.$a, time()+ (86400 *30),"/");
		echo "<br>welcome back";
		echo "<br> TOtal page count:".$_COOKIE[$cn];
		
		function changeColour() {
    if("r")
        document.body.style.backgroundColour="#FF0000";
    if("b")
        document.body.style.backgroundColour="#0000FF";
    if("p")
        document.body.style.backgroundColour="#FF00FF";
		
		
	}
	else
	{
		setcookie($cn,']', time()+ (86400 *30),"/");
		echo"<br>welcome user you have visited fitsttime";
		?>
}
		
		<?php
		echo "<br>Total page count: ]";
	}
?>
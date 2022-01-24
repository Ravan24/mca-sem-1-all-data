<html>
<head>
<script>
function myfun()
{
	x=document.getElementById("email").value;
	if(x.trim()=="")
	{
		//alert("plx Enter a email id");
		document.getElementById('em').innerHTML="plz enter value";
	}
	else
	{
		document.getElementById('em').innerHTML="";
	}
	
	
}
</script>
</head>
<form action="emailin.php" method="POST">
  <div class="container">
    <h1>Email Register</h1>
    <hr>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" id="email" onBlur="myfun();">
	<div id="em">*</div>

    <button type="submit" class="registerbtn">Register</button><br>
  </div>

  <div class="container signin">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>
</form>
</html>
<?php
session_start();
session_unset();
session_destroy();
header("logout:index.php");

?>
<a href="logout.php">logout</a>
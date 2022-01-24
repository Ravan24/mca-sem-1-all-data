<?php
    $conn = new mysqli("localhost","root","","jvims");    
?>
 <!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>AddTOCart</title>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script>
$(document).ready( function () {
    $('#myTable').DataTable();
} );
function myalert()
{
    return confirm("Are you sure you want to delete this record???");
}
</script>
 </head>
 <body>
	<h1 align="center">ADD TO CART</h1>
    <!-- <table class="table"> -->
    <table id="myTable" class="display">
    <thead>
            <th>ID</th>
            <th>Name</th>
            <th>avalible qty</th>
            <th>purchase qty</th>
            <th>price</th>
            <th>add to cart</th>
            
    </thead>
    <tbody>
    
    <?php    
    $result=$conn->query("select * from product_catalog");
    for($i=0;$i<$result->num_rows;$i++) //row
    {
        echo "<tr>";
            $row = $result->fetch_object();    
            echo "<td>";
                echo $row->id; 
            echo "</td>";
            echo "<td>";
                echo $row->name; 
            echo "</td>";
            echo "<td>";
                echo $row->qty; 
            echo "</td>";
            echo "<td>";
				echo "<from><input type='number' value='1' max='.$row->qty' min='1'></form>";
			echo "</td>";
            echo "<td>";
			
                echo $row->price; 
            echo "</td>";        
            echo "<td>";
            ?>
           
            <form method="POST" class="form-inline">
				 <input type="hidden" name="id" value=<?=$row->id?>>
                <input type="hidden" name="name" value=<?=$row->name?>>
                <input type="hidden" name="qty" value=<?=$row->qty?>>
                <input type="hidden" name="price" value=<?=$row->price?>>
				<input type="hidden" name="action" value='addtocart'>
                <input type="submit" class="btn btn-warning" value="ADD TO Cart">
            </form>

            <?php
            echo "</td>";    
        echo "</tr>"; }
    ?>
    </tbody>
    </table>
    </div>
	<?php include("showcart.php");?>
 </body>
 </html>
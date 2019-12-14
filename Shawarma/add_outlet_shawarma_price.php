<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shawarma with price in Outlets</title>
	<?php
		include 'Connect.php';
		include 'Functions.php';
	?>

</head>

<body>
  <center>
    <h1>
      Set price
    </h1>
    <form method="post" action="add_outlet_shawarma_price.php">

		Outlet name:
		<?php
		  $sel_query = $pdo->query("SELECT ID, Outlet_name FROM outlets ORDER BY Outlet_name");
		  echo make_select('outlet_select', $sel_query);
		?>
		
		<br /><br />
		Shawarma:
		<?php
		  $sel_query = $pdo->query("SELECT ID, Type FROM shawarma ORDER BY Type");
		  echo make_select('shawarma_select', $sel_query);
		?>
		
		<br /><br />
		&nbsp Price:
		<input type="number" name="price" min=0 max=5000 required>
	  
		<br /><br />
		<input type="submit" name="add_outlet_shawarma_price" value="Add">
    </form><br />
	

<?php
  
  if(isset($_POST['outlet_select']) && isset($_POST['shawarma_select']) && isset($_POST['price'])) {
    
	$query = $pdo->query("INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (" . $_POST['outlet_select'].", " . $_POST['shawarma_select'] . ", " . $_POST['price'] . ")");
   
    if(!$query) {
		$res = $pdo->errorCode();
		if ($res == 23000) {
			echo 'Price for this shawarma in this outlet is already set';
		}
		else {
			echo 'Database query failed: (' . $pdo->errorCode() . ') ' . $pdo->errorInfo()[2];
		}
    } else {
		echo 'Price successfully set!';
	}   
  }
 ?>
  </center>
  <a href ="index.html">Back</a>
</body>
</html>

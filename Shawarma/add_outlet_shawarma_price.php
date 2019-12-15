<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	
<!-- This page (with php) is for adding a Shawarma into an Outlet's menu (with price) -->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shawarma with price in Outlets</title>

</head>

<body>
  <center>
    <h1>
      Set price
    </h1>
    <form method="post" action="add_outlet_shawarma_price.php">

		Outlet name:
		<?php
			include 'Connect.php'; // create connection to database 
			include 'Functions.php'; // import functions of database abstraction level
	    
	    		// create query for retrieving data for HTML-style <select> for outlets
			$sel_query = $pdo->query("SELECT ID, Outlet_name FROM outlets ORDER BY Outlet_name");	    
	    		// displaying HTML-style <select> for outlets
			echo make_select('outlet_select', $sel_query);
		?>
		
		<br /><br />
		Shawarma:
		<?php
	    		// create query for retrieving data for HTML-style <select> for shawarma types
			$sel_query = $pdo->query("SELECT ID, Type FROM shawarma ORDER BY Type");
	    		// displaying HTML-style <select> for shawarma types
			echo make_select('shawarma_select', $sel_query);
		?>
		
		<br /><br />
		&nbsp Price:
		<input type="number" name="price" min=0 max=5000 required>
	  
		<br /><br />
		<input type="submit" name="add_outlet_shawarma_price" value="Add">
    </form><br />
	

<?php
	  // this part of file contains logics for processing data from form
	  
	  // if all need data is set
	  if(isset($_POST['outlet_select']) && isset($_POST['shawarma_select']) && isset($_POST['price'])) {
		  // create query for inserting a row
		  $query = $pdo->query("INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (" . $_POST['outlet_select'].", " . $_POST['shawarma_select'] . ", " . $_POST['price'] . ")");
		  
		  // if query fails
		  if(!$query) {
			  // get arrer code
			  $res = $pdo->errorCode();
			  // if query fails because of unique index violation, display it
			  if ($res == 23000) {
				  echo 'Price for this shawarma in this outlet is already set';
			  }
			  // if other error occured, show error code and message
			  else {
				  echo 'Database query failed: (' . $res . ') ' . $pdo->errorInfo()[2];
			  }
		  }
		  // if query was successful, display it
		  else {
			  echo 'Price successfully set!';
		  }   
	  }
?>
  </center>
  <a href ="index.html">Back</a>
</body>
</html>

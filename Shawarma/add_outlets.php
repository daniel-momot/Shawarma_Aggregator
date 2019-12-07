<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Best Shawarmas</title>
</head>

<body>
  <center>
    <h1>
      Add an outlet
    </h1>
    <form method="post" action="add_outlets.php">
      Outlet name: &nbsp
      <input type="text" name="outlet_name" style="width: 10em" required>&nbsp
      <input type="submit" name="add_outlet" value="Add">
    </form><br />

<?php
  include 'Connect.php';
  include 'Functions.php';
  
  if(isset($_POST['outlet_name']) && !empty($_POST['outlet_name'])) {
    
    $sel_query = $pdo->query("INSERT INTO `outlets`(`Outlet_name`) VALUES ('".$_POST['outlet_name']."');");
    
    if(!$sel_query) {
		$res = $pdo->errorCode();
		if ($res == 23000) {
			echo 'Outlet with this name already exists';
		}
		else {
			echo 'Database query failed: (' . $pdo->errorCode() . ') ' . $pdo->errorInfo()[2];
		}
    } else {
		echo 'Outlet successfully added!';
		$sel_query = $pdo->query("SELECT ID, Outlet_name FROM outlets ORDER BY Outlet_name");		
		if(!$sel_query) {
			echo 'Database query failed: (' . $pdo->errorCode() . ') ' . $pdo->errorInfo()[2];
		} else {
			echo make_table($sel_query->fetchAll());
		}
	}    
  }
 ?>
  </center>
  <a href ="index.html">Back</a>
</body>
</html>

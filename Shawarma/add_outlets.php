<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add outlets</title>
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
  
  if(isset($_POST['add_outlet']) && !empty($_POST['outlet_name'])) {
    $date= date("Y-m-d");
    echo "<br /> <hr /> <br />Today is: $date. <br /> <br />";
    
    $ins_query = $pdo->query("INSERT INTO `outlets`(`Outlet_name`) VALUES ('{$_POST['outlet_name']}');");
    
    if(!$ins_query) {
		$code = $pdo->errorCode();
		if ($code == 23000) {
			echo 'Outlet with this name already exists <br /> <br /> <hr />';
		}
		else {
			echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]} <br /> <br /> <hr />";
		}
    } else {
		echo 'Outlet successfully added! <br /> <br /> <hr />';
    
		$select_query = $pdo->query("SELECT ID, Outlet_name FROM outlets ORDER BY ID DESC");		
		if(!$select_query) {
			echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]}";
		} else {
      echo '<h3> Table: </h3>';
			echo make_table($select_query->fetchAll());
		}
	}    
  }
 ?>
  </center>
  <a href ="index.html">Back</a>
</body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	
<!-- This page (with php) is for adding a new Outlet -->

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
	  // this part is for processing data from the form
	  
  include 'Connect.php'; // create connection to database
  include 'Functions.php'; // include functions of database abstraction layer 
  
	  // if all data is set
  if(isset($_POST['add_outlet']) && !empty($_POST['outlet_name'])) {
    $date= date("Y-m-d"); // get current date
    echo "<br /> <hr /> <br />Today is: $date. <br /> <br />"; // show current date
    
	  // create query for inserting data
    $ins_query = $pdo->query("INSERT INTO `outlets`(`Outlet_name`) VALUES ('{$_POST['outlet_name']}');");
    
	  // if query fails
    if(!$ins_query) {
	    // get error code
		$code = $pdo->errorCode();
	    // if unique index violation, show error message about duplicationg data
		if ($code == 23000) {
			echo 'Outlet with this name already exists <br /> <br /> <hr />';
		}
	    // if any other errer, show generic error message
		else {
			echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]} <br /> <br /> <hr />";
		}
    // if query successful
    } else {
	    // show success message
		echo 'Outlet successfully added! <br /> <br /> <hr />';
    
	    // showing the updated data: create query with the new-added row first
		$select_query = $pdo->query("SELECT ID, Outlet_name FROM outlets ORDER BY ID DESC");		
	    // if error occured, show message
		if(!$select_query) {
			echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]}";
		} else {
			// otherwise show the updated table
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

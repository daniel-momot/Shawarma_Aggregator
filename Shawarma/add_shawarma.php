<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	
	<!-- This page with php is for inserting a new shawarma type -->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add shawarma</title>
</head>

<body>
  <center>
    <h1>
      Add a shawarma
    </h1>
    <form method="post" action="add_shawarma.php">
      Shawarma name: &nbsp
      <input type="text" name="shawarma_name" style="width: 10em" required>&nbsp
      Shawarma description: &nbsp
      <input type="text" name="shawarma_descr" style="width: 20em">&nbsp
      <input type="submit" name="add_shawarma" value="Add">
    </form><br />

<?php
	  // processing data from the form
	  
  include 'Connect.php'; // create connection to database
  include 'Functions.php'; // include functions of Database abstraction layer 
  
	  // if all data privided
  if(isset($_POST['add_shawarma']) && !empty($_POST['shawarma_name'])) {
	  // get current date and show it
    $date= date("Y-m-d");
    echo "<br /> <hr /> <br />Today is: $date. <br /> <br />";

	  // is description provided, add with it; otherwise without it
	if(!empty($_POST['shawarma_descr'])) {
		$ins_query = $pdo->query("INSERT INTO `shawarma`(`Type`, `Description`) VALUES ('{$_POST['shawarma_name']}', '{$_POST['shawarma_descr']}');");
	}
	else {
		$ins_query = $pdo->query("INSERT INTO `shawarma`(`Type`) VALUES ('{$_POST['shawarma_name']}');");
	}
    
	  // if query fauls
    if(!$ins_query) {
	    // get error code
		$code = $pdo->errorCode();
	    // if unique index violation, show error message about duplication data
		if ($code == 23000) {
			echo 'Shawarma with this name already exists <br /> <br /> <hr />';
		}
	    // otherwise generic error messag
		else {
			echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]} <br /> <br /> <hr />";
		}
// if query successful
    } else {
	    // show success message
		echo 'Shawarma successfully added! <br /> <br /> <hr />';

	    // create query for retrieving updated data
		$sel_query = $pdo->query("SELECT ID, Type, Description FROM Shawarma ORDER BY ID DESC");
	    // if fails, show error message
		if(!$sel_query) {
			echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]}";
		// if success, show updated data
		} else {
			echo '<h3> Table: </h3>';
      echo make_table($sel_query->fetchAll());
		}
	}    
  }

 ?>
  </center>
  <a href ="index.html">Back</a>
</body>
</html>

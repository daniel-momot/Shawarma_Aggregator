<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

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
  include 'Connect.php';
  include 'Functions.php';
  
  if(isset($_POST['add_shawarma']) && !empty($_POST['shawarma_name'])) {
    $date= date("Y-m-d");
    echo "<br /> <hr /> <br />Today is: $date. <br /> <br />";

	if(!empty($_POST['shawarma_descr'])) {
		$ins_query = $pdo->query("INSERT INTO `shawarma`(`Type`, `Description`) VALUES ('{$_POST['shawarma_name']}', '{$_POST['shawarma_descr']}');");
	}
	else {
		$ins_query = $pdo->query("INSERT INTO `shawarma`(`Type`) VALUES ('{$_POST['shawarma_name']}');");
	}
    
    if(!$ins_query) {
		$code = $pdo->errorCode();
		if ($code == 23000) {
			echo 'Shawarma with this name already exists <br /> <br /> <hr />';
		}
		else {
			echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]} <br /> <br /> <hr />";
		}
    } else {
		echo 'Shawarma successfully added! <br /> <br /> <hr />';

		$sel_query = $pdo->query("SELECT ID, Type, Description FROM Shawarma ORDER BY ID DESC");		
		if(!$sel_query) {
			echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]}";
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

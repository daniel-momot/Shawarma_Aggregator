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
      Top shawarmas
    </h1>
    <form method="post" action="top_shawarmas.php">
      Show top &nbsp
      <input type="number" name="num" min="1" max="10" value="1" style="width: 3em" required>&nbsp
      shawarmas
       <br /><br />
      <input type="submit" name="print" value="Show">
    </form><br />

<?php
  include 'Connect.php';
  include 'Functions.php';
  
  if(isset($_POST['num']) && isset($_POST['print'])) {
    $limit = $_POST['num'];

    $query = "SELECT outl.Outlet_name AS `Outlet name`, 
                     AVG(revs.Rating) AS `Average rating`, 
                     COUNT(revs.ID) AS `Number of reviews`
                FROM outlets outl JOIN reviews revs ON (outl.ID = revs.Outlet_ID) 
                Group by outl.ID, outl.Outlet_name
                Having `Number of reviews` > 2
                ORDER BY `Average rating` DESC, `Number of reviews` DESC, `Outlet name`
                LIMIT $limit";
    
    if(!$pdo_res = $pdo->query($query)) {
      echo 'Database query failed: (' . $pdo->errorCode() . ') ' . $pdo->errorInfo()[2];
    }
    elseif(count($query_rows = $pdo_res->fetchAll()) === 0) {
      echo 'Not enough reviews =(';
    } else {
      echo make_table($query_rows);
    }
  }
 ?>
  </center>
  <a href ="index.html">Back</a>
</body>
</html>

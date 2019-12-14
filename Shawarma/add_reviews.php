<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Best Shawarmas</title>
	<?php
		include 'Connect.php';
		include 'Functions.php';
	?>

</head>

<body>
  <center>
    <h1>
      Add a review
    </h1>
    <form method="post" action="add_reviews.php">

		Outlet name:
		<?php
		  $sel_query = $pdo->query("SELECT ID, Outlet_name FROM outlets ORDER BY Outlet_name");
		  echo make_select('outlet_select', $sel_query);
		?>
		
		&nbsp Your grade (1 to 10):
		<input type="number" name="review_rating" min=1 max=10 required>
	  
		<br /><br />Your review:<br />
		<textarea name="review_text" style="width: 30em; height: 15em"></textarea>
		
		<br /><br />
		<input type="submit" name="add_outlet" value="Add">
    </form><br />
	

<?php
  
  if(isset($_POST['outlet_select']) && isset($_POST['review_rating'])) {
    
	if(!empty($_POST['review_text'])) {
		$sel_query = $pdo->query("INSERT INTO `reviews`(`Outlet_ID`, `Rating`, `Review`) VALUES (" . $_POST['outlet_select'].", " . $_POST['review_rating'] .", '" . $_POST['review_text'] . "')");
	}
	else {
		$sel_query = $pdo->query("INSERT INTO `reviews`(`Outlet_ID`, `Rating`) VALUES (" . $_POST['outlet_select'].", " . $_POST['review_rating'] .")");
	}
    
    if(!$sel_query) {
		echo 'Database query failed: (' . $pdo->errorCode() . ') ' . $pdo->errorInfo()[2];
    } else {
		echo 'Review successfully added!';
	}   
  }
 ?>
  </center>
  <a href ="index.html">Back</a>
</body>
</html>

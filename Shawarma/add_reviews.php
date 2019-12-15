<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- This page (with php) is for adding a review for an outlet -->	
	
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add reviews</title>

</head>

<body>
  <center>
    <h1>
      Add a review
    </h1>
    <form method="post" action="add_reviews.php">

		Outlet name:
		<?php
		include 'Connect.php'; // create connection to database
		include 'Functions.php'; // include functions of  Database abstraction layer 
	    
	    		// create a query retrieving data for html-style <select> and show it
		  $sel_query = $pdo->query("SELECT ID, Outlet_name FROM outlets ORDER BY Outlet_name");
		  echo make_select('outlet_select', $sel_query);
		?>
		
		&nbsp Your grade (1 to 10):
		<input type="number" name="review_rating" min=1 max=10 required>
	  
		<br /><br />Your review:<br />
		<textarea name="review_text" style="width: 30em; height: 15em"></textarea>
		
		<br /><br />
		<input type="submit" name="add_review" value="Add">
    </form><br />
	

<?php
	  
	  // processign data from the form
  
	  // if all data is set
  if(isset($_POST['outlet_select']) && isset($_POST['review_rating'])) {
    
	  // if review text provided, insert with it
	if(!empty($_POST['review_text'])) {
		$query = $pdo->query("INSERT INTO `reviews`(`Outlet_ID`, `Rating`, `Review`) VALUES (" . $_POST['outlet_select'].", " . $_POST['review_rating'] .", '" . $_POST['review_text'] . "')");
	}
	  // otherwise, insert with it
	else {
		$query = $pdo->query("INSERT INTO `reviews`(`Outlet_ID`, `Rating`) VALUES (" . $_POST['outlet_select'].", " . $_POST['review_rating'] .")");
	}
    
	  // if including was successful, show error message
    if(!$query) {
		echo 'Database query failed: (' . $pdo->errorCode() . ') ' . $pdo->errorInfo()[2];
	    // otherwise show OK message
    } else {
		echo 'Review successfully added!';
	}   
  }
 ?>
  </center>
  <a href ="index.html">Back</a>
</body>
</html>

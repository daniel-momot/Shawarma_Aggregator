<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shawarma prices</title>
</head>

<body>
  <center>
    <h1>
      Shawarma prices
    </h1>
    <form method="post" action="shawarma_prices.php">
      Select shawarma type: &nbsp
      
      <?php
      # This script finds all prices for a user-selected type of shawarma
        
        // Make connection to the databse 
        include 'Connect.php';
        // Use functions from functions.php file (make_table, make_select)
        include 'Functions.php';
        
        $sel_query = $pdo->query("SELECT ID, Type FROM shawarma ORDER BY Type");
        
        // Make a drop-down list with the types of shawarma
        if(!$sel_query) {
          echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]}";
        } else {
          echo make_select('shawarma_select', $sel_query->fetchAll(), true);
        }
      ?>
      
      <br /><br /> 
      <input type="submit" name="show_prices" value="Show prices">
    </form><br />
    
    <?php
    // If the user clicked on the button, the query results are displayed (all prices for selected type of shawarma).
        if (isset($_POST["show_prices"]) && isset($_POST['shawarma_select'])) {
          $shawarma_id = $_POST['shawarma_select'];
          $prices_header_query = $pdo->query("SELECT Type FROM shawarma WHERE ID = $shawarma_id");
          
          if(!$prices_header_query) {
            echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]}";
          } else {
            echo "<h3> {$prices_header_query->fetch()[0]} <br /> Prices: </h3>";
          }
          
          $query = "SELECT outl.Outlet_name AS `Outlet`, 
                           o_sh_pr.Price AS `Price, rubles`
                    FROM outlet_shawarma_price o_sh_pr JOIN outlets outl
                          ON (o_sh_pr.Outlet_ID = outl.ID)
                    WHERE o_sh_pr.Shawarma_ID = $shawarma_id
                    ORDER BY `Price`";
                    
          if(!$pdo_prices_query = $pdo->query($query)) {
            echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]}";
          }
          elseif(count($prices_query_rows = $pdo_prices_query->fetchAll()) === 0) {
            echo 'There are no prices for the selected shawarma =(';
          } else {
            echo make_table($prices_query_rows);
          }
        }
       ?>
       
  </center>
  <a href ="index.html">Back</a>
</body>
</html>

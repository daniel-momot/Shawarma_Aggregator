<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Outlet menu</title>
</head>

<body>
  <center>
    <h1>
      Outlet menu
    </h1>
    <form method="post" action="outlet_menu.php">
      Select outlet: &nbsp
      
      <?php
      # This script displays prices for all types of shawarma at a specific outlet
      
        // Make connection to the databse 
        include 'Connect.php';
        // Use functions from functions.php file (make_table, make_select)
        include 'Functions.php';
        
        $sel_query = $pdo->query("SELECT ID, Outlet_name FROM outlets ORDER BY Outlet_name");
        
        // Make a drop-down list with the outlets
        if(!$sel_query) {
          echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]}";
        } else {
          echo make_select('outlet_select', $sel_query->fetchAll(), true);
        }
      ?>
      
      <br /><br /> 
      <input type="submit" name="show_menu" value="Show menu">
    </form><br />
    
    <?php
        // If the user clicked on the button, the query results are displayed (prices for all types of shawarma at a specific outlet).
        if (isset($_POST["show_menu"]) && isset($_POST['outlet_select'])) {
          $outlet_id = $_POST['outlet_select'];
          $menu_header_query = $pdo->query("SELECT Outlet_name FROM outlets WHERE ID = $outlet_id");
          
          if(!$menu_header_query) {
            echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]}";
          } else {
            echo "<h3> {$menu_header_query->fetch()[0]} <br /> Menu: </h3>";
          }
          
          $query = "SELECT sh.Type AS `Shawarma`, 
                           sh.Description, 
                           o_sh_pr.Price AS `Price, rubles`
                    FROM outlet_shawarma_price o_sh_pr JOIN shawarma sh 
                          ON (o_sh_pr.Shawarma_ID = sh.ID)
                    WHERE o_sh_pr.Outlet_ID = $outlet_id
                    ORDER BY `Shawarma`";
                    
          if(!$pdo_menu_query = $pdo->query($query)) {
            echo "Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]}";
          }
          elseif(count($menu_query_rows = $pdo_menu_query->fetchAll()) === 0) {
            echo 'No menu =(';
          } else {
            echo make_table($menu_query_rows);
          }
        }
       ?>
       
  </center>
  <a href ="index.html">Back</a>
</body>
</html>

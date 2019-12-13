<?php

header("Content-Type: text/xml");

# This script creates a list of all shawarma in all outlets with prices for them.

// Make connection to the databse 
include 'Connect.php';

// Select the data from the database 
$query = 'SELECT outl.Outlet_name AS `Outlet name`,
                 `Average rating`,
                 sh.Type,
                 sh.Description,
                 outl_sh_pr.Price AS `Price, rubles`
            FROM outlets outl 
                LEFT JOIN outlet_shawarma_price outl_sh_pr 
                  ON (outl.ID = outl_sh_pr.Outlet_ID)
                RIGHT JOIN shawarma sh 
                  ON (outl_sh_pr.Shawarma_ID = sh.ID)
                LEFT JOIN (SELECT Outlet_ID, ROUND(AVG(Rating), 1) AS `Average rating`
                            FROM reviews
                            GROUP BY Outlet_ID) average
                  ON (outl.ID = average.Outlet_ID)
          ORDER BY ISNULL(`Outlet name`), `Outlet name`, sh.Type';

if(!$all_prices_query = $pdo->query($query)) {
  die("Database query failed: ({$pdo->errorCode()}) {$pdo->errorInfo()[2]}");
}

// Print these results into an XML
$xml = <<<'EOT'
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="shawarma_style.xsl"?>
<!-- all prices for all types of shawarma -->
<prices>
EOT;

foreach ($all_prices_query as $row) {
  $xml .= <<<EOT
  
  <!-- price for a specific instance of shawarma -->
  <instance>
    <outlet rating="$row[1]">
      $row[0]
    </outlet>
    <type>
      $row[2]
    </type>
    <description>
      $row[3]
    </description>
    <price>
      $row[4]
    </price>
  </instance>
EOT;
}

$xml .= "</prices>\n";

echo $xml;
?>

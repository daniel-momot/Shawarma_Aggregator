<?php

$dsn = 'mysql:dbname=shawarma_db;host=localhost';
$user = 'root';
$password = 'vertrigo';

# make connection to the database server
try {
  $pdo = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
  die("<br />Connection failed: {$e->getMessage()} <br />");
}

$pdo->query("SET NAMES 'utf8';");

 ?>

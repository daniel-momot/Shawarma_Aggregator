<?php

$dsn = 'mysql:dbname=shawarma_base;host=localhost';
$user = 'root';
$password = 'vertrigo';

try {
  $pdo = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
  die('Connection failed: ' . $e->getMessage());
}

$pdo->query("SET NAMES 'utf8';");

 ?>

<?php
$host = 'localhost';
$dbname = 'sport_club_db';
$username = 'root';
$password = '';

try {
  $pdo = new PDO(
    "mysql:host=$host;dbname=$dbname;charset=utf8",
    $username,
    $password,
    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
   );
} catch (PDOException $e) {
  die("Erreur de connexion : ".$e->getMessage());
};
?>
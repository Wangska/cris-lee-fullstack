<?php
// Database configuration
$host = $_ENV['DB_HOST'] ?? 'qw0skwgck80kkwwcoog84kkc';
$dbname = $_ENV['DB_DATABASE'] ?? 'default';
$username = $_ENV['DB_USERNAME'] ?? 'root';
$password = $_ENV['DB_PASSWORD'] ?? '0lAxrnhKCsChUu0yLwZwIS9PRlJ74O7IrDHzyGlACuyGoiVSbNtEm6GLEX1MjQMo';
$port = $_ENV['DB_PORT'] ?? '3306';

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>

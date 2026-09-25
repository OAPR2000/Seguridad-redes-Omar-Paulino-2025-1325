<?php
// ADVERTENCIA: codigo deliberadamente vulnerable, con fines educativos
// (usado para demostrar deteccion/cuarentena de SQL Injection por IPS).
$conn = new mysqli('10.13.25.146', 'webuser', 'Web1325!Pass', 'tienda');
if ($conn->connect_error) {
    die('Error DB: ' . $conn->connect_error);
}

$id = $_GET['id'] ?? '1';
// Concatenacion directa sin sanitizar -> vector de SQL Injection
$sql = "SELECT * FROM productos WHERE id = $id";
$result = $conn->query($sql);

echo '<h2>WEB-SERVER 2025-1325</h2>';
while ($row = $result->fetch_assoc()) {
    echo "{$row['id']} | {$row['nombre']} | {$row['precio']}<br>";
}
?>

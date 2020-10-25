<?php
    include('db.php');

    $query = mysqli_query($dbconnect, 'INSERT INTO Standort(Team, Laenge, Breite) VALUES('.$_SESSION['TeamNr'].', '.$_GET['longitude'].', '.$_GET['latitude'].');');
?>
<?php
    include('db.php');

    $query = mysqli_query($dbconnect, 'INSERT INTO Standort(Team, Laenge, Breite) VALUES('.$_SESSION['TeamNr'].', '.$_POST['longitude'].', '.$_POST['latitude'].');');
?>
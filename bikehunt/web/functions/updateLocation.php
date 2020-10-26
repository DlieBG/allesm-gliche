<?php
    include('db.php');

    $query = mysqli_query($dbconnect, 'SELECT * FROM Spezial WHERE NOW() > Zeit AND NOW() - Zeit < 300 AND Team = '.$_SESSION['TeamNr'].' AND Typ="block" ORDER BY SpezialNr DESC LIMIT 1;');
    $spezial = mysqli_fetch_array($query);
    if($spezial!==null)
        die();

    $query = mysqli_query($dbconnect, 'INSERT INTO Standort(Team, Laenge, Breite) VALUES('.$_SESSION['TeamNr'].', '.$_POST['longitude'].', '.$_POST['latitude'].');');
?>
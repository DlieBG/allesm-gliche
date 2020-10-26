<?php
    include('db.php');

    $query = mysqli_query($dbconnect, 'SELECT * FROM Spezial WHERE NOW() > Zeit AND NOW() - Zeit < 300 AND Team = '.$_SESSION['TeamNr'].';');
    $spezial = mysqli_fetch_array($query);
    if($spezial!==null)
    {
        if($spezial['Typ']=='block')
            die();
    }

    $query = mysqli_query($dbconnect, 'INSERT INTO Standort(Team, Laenge, Breite) VALUES('.$_SESSION['TeamNr'].', '.$_POST['longitude'].', '.$_POST['latitude'].');');
?>
<?php
    include('db.php');

    $query = mysqli_query($dbconnect, 'SELECT COUNT(SpezialNr) FROM Spezial WHERE Typ = "live" AND Team = '.$_SESSION['TeamNr'].' GROUP BY Team;');
    $spezial = mysqli_fetch_array($query);
    if($spezial!==null)
    {
        if($spezial[0] == 1)
        {
            print("Live-Standort kann nicht mehr angefordert werden!");
            die();
        }
    }

    print("300 Sekunden live!");
    $query = mysqli_query($dbconnect, 'INSERT INTO Spezial(Team, Typ) VALUES('.$_SESSION['TeamNr'].', "live");');
?>
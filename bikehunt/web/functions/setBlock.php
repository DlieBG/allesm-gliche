<?php
    include('db.php');

    $query = mysqli_query($dbconnect, 'SELECT COUNT(SpezialNr) FROM Spezial WHERE Typ = "block" AND Team = '.$_SESSION['TeamNr'].' GROUP BY Team;');
    $spezial = mysqli_fetch_array($query);
    if($spezial!==null)
    {
        if($spezial[0] == 1)
        {
            print("Block kann nicht mehr angefordert werden!");
            die();
        }
    }

    print("300 Sekunden offline!");
    $query = mysqli_query($dbconnect, 'INSERT INTO Spezial(Team, Typ) VALUES('.$_SESSION['TeamNr'].', "block");');
?>
<?php
    include('db.php');

    $query = mysqli_query($dbconnect, 'SELECT * FROM Spezial WHERE NOW() > Zeit AND NOW() - Zeit < 300 AND Team = '.$_SESSION['TeamNr'].' AND Typ="live" ORDER BY SpezialNr DESC LIMIT 1;');
    $spezial = mysqli_fetch_array($query);
    if($spezial!==null)
    {
        $query = mysqli_query($dbconnect, 'SELECT * FROM Standort LEFT JOIN Team ON Team.TeamNr = Standort.Team WHERE Team = '.$_SESSION['GegnerNr'].' ORDER BY StandortNr DESC LIMIT 1;');
        $location = mysqli_fetch_array($query);

        print_r(json_encode($location));
        die();
    }

    $query = mysqli_query($dbconnect, 'SELECT * FROM Standort LEFT JOIN Team ON Team.TeamNr = Standort.Team WHERE Standort.Zeit < NOW()-200 AND Team = '.$_SESSION['GegnerNr'].' ORDER BY StandortNr DESC LIMIT 1;');
    $location = mysqli_fetch_array($query);

    print_r(json_encode($location));
?>
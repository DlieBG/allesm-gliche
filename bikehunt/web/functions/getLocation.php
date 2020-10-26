<?php
    include('db.php');

    //SELECT * FROM `Spezial` WHERE NOW() > Zeit AND NOW() - Zeit < 300;
    $query = mysqli_query($dbconnect, 'SELECT * FROM Spezial WHERE NOW() > Zeit AND NOW() - Zeit < 300 AND Team = '.$_SESSION['TeamNr'].';');
    $spezial = mysqli_fetch_array($query);
    if($spezial!==null)
    {
        if($spezial['Typ']=='live')
        {
            $query = mysqli_query($dbconnect, 'SELECT * FROM Standort LEFT JOIN Team ON Team.TeamNr = Standort.Team WHERE Team = '.$_SESSION['GegnerNr'].' ORDER BY StandortNr DESC LIMIT 1;');
            $location = mysqli_fetch_array($query);

            print_r(json_encode($location));
            die();
        }
    }

    $query = mysqli_query($dbconnect, 'SELECT * FROM Standort LEFT JOIN Team ON Team.TeamNr = Standort.Team WHERE Standort.Zeit < NOW()-200 AND Team = '.$_SESSION['GegnerNr'].' ORDER BY StandortNr DESC LIMIT 1;');
    $location = mysqli_fetch_array($query);

    print_r(json_encode($location));
?>
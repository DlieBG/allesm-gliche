<?php
    include('db.php');

    $query = mysqli_query($dbconnect, 'SELECT * FROM Standort LEFT JOIN Team ON Team.TeamNr = Standort.Team WHERE Standort.Zeit < NOW()-200 AND Team = '.$_SESSION['GegnerNr'].' ORDER BY StandortNr DESC LIMIT 1;');
    $location = mysqli_fetch_array($query);

    print_r(json_encode($location));
?>
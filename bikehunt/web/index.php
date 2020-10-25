<?php
    include('functions/db.php');

    if(!isset($_SESSION['TeamNr'])||!isset($_SESSION['GegnerNr']))
        header("Refresh: 0; url=login.php");

    $query = mysqli_query($dbconnect, 'SELECT * FROM Team WHERE TeamNr = '.$_SESSION['TeamNr'].';');
    $team = mysqli_fetch_array($query);
    $query = mysqli_query($dbconnect, 'SELECT * FROM Team WHERE TeamNr = '.$_SESSION['GegnerNr'].';');
    $gegner = mysqli_fetch_array($query);

    include('update.php');
    include('map.php');
?>

<div style="font-family: system-ui; z-index:1000; position: fixed; top: 0; left: 15%; width: 70%; border: 1px solid black; background-color: #ffffff9e; text-align: center;">
    Dein Team: <?php echo($team['Name']); ?><br>(<?php echo($team['Beschreibung']); ?>)<hr>
    Gegner Team: <?php echo($gegner['Name']); ?><br>(<?php echo($gegner['Beschreibung']); ?>)
</div>
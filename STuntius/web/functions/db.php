<?php
    session_start();
    header("Access-Control-Allow-Origin: *");

    $hostname = "192.168.0.191";
    $username = "web";
    $password = "IchKannNurLesen";
    $db = "STuntius";
    $dbconnect = mysqli_connect($hostname, $username, $password, $db);

    if(!isset($_SESSION['BenutzerNr']))
    {
        header('Refresh: 0; url=login.php');
        die();
    }

    $query = mysqli_query($dbconnect, 'SELECT * FROM Benutzer WHERE BenutzerNr = '.$_SESSION['BenutzerNr'].';');
    while($row = mysqli_fetch_array($query))
    {
        $benutzer = $row;
    }

    $query = mysqli_query($dbconnect, 'SELECT * FROM Benutzer WHERE BenutzerNr = '.$_SESSION['PartnerNr'].';');
    while($row = mysqli_fetch_array($query))
    {
        $partner = $row;
    }
?>
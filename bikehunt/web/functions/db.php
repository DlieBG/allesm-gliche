<?php
    session_start();
    header("Access-Control-Allow-Origin: *");

    $hostname = "192.168.0.191";
    $username = "web";
    $password = "IchKannNurLesen";
    $db = "bikehunt";
    $dbconnect = mysqli_connect($hostname, $username, $password, $db);
?>
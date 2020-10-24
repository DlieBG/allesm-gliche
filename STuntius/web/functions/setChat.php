<?php
session_start();
header("Access-Control-Allow-Origin: *");
header('Refresh: 0; url=../index.php');
$_SESSION['PartnerNr'] = $_GET['p'];
?>
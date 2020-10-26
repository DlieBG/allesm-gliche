<?php
    include('functions/db.php');

    if(!isset($_GET['code']))
    {
        header('Refresh: 0;url=index.php');
        die();
    }

    $query = mysqli_fetch_array(mysqli_query($dbconnect, 'SELECT * FROM Login WHERE Code = "'.$_GET['code'].'";'));

    if($query==null)
    {
        header('Refresh: 0;url=index.php');
        die();
    }
    else
    {
        $_SESSION['TeamNr'] = $query["Team"];
        $_SESSION['GegnerNr'] = $query["Gegner"];
        header('Refresh: 0;url=index.php');
    }
?>
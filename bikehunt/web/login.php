<?php
    include('functions/db.php');

    if(isset($_GET['TeamNr'])&&isset($_GET['GegnerNr']))
    {
        $_SESSION['TeamNr'] = $_GET['TeamNr'];
        $_SESSION['GegnerNr'] = $_GET['GegnerNr'];
        header('Refresh: 0; url=index.php');
    }
?>

<form>
    Eigenes Team: <input name="TeamNr"></input><br>
    Gegner Team: <input name="GegnerNr"></input><br>
    <input type="submit"></input>
</form>
<?php
    $_SESSION['BenutzerNr'] = 1;

    $query = mysqli_query($dbconnect, 'SELECT Benutzer.* FROM Benutzer RIGHT JOIN Nachricht ON Nachricht.Empfaenger = Benutzer.BenutzerNr OR Nachricht.Sender = Benutzer.BenutzerNr WHERE Benutzer.BenutzerNr != '.$_SESSION['BenutzerNr'].' GROUP BY Benutzer.BenutzerNr;');
    while($row = mysqli_fetch_array($query))
    {
        echo('<a style="text-decoration: none; color: white;" href="functions/setChat.php?p='.$row['BenutzerNr'].'"><li class="contact">
            <div class="wrap">
                <span class="contact-status online"></span>
                <img src="'.$row['Profilbild'].'" alt="" />
                <div class="meta">
                    <p class="name">'.$row['vollerName'].'</p>
                    <p class="preview">'.$row['Info'].'</p>
                </div>
            </div>
        </li></a>');
    }
?>
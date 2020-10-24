<?php
    echo('
    <div class="contact-profile">
        <img src="'.$partner['Profilbild'].'" alt="" />
        <p>'.$partner['vollerName'].'</p>
        <div class="social-media">
        </div>
    </div>
    <div class="messages">
        <ul>');

        $query = mysqli_query($dbconnect, 'SELECT * FROM Nachricht WHERE (Empfaenger = '.$_SESSION['BenutzerNr'].' OR Sender = '.$_SESSION['BenutzerNr'].') AND (Empfaenger = '.$_SESSION['PartnerNr'].' OR Sender = '.$_SESSION['PartnerNr'].');');
        while($row = mysqli_fetch_array($query))
        {
            if($row['Sender']==$_SESSION['BenutzerNr'])
            {
                echo('<li class="replies">
                    <img src="'.$benutzer['Profilbild'].'" alt="" />
                    <p>'.$row['Inhalt'].'</p>
                </li>');
            }
            else
            {
                echo('<li class="sent">
                    <img src="'.$partner['Profilbild'].'" alt="" />
                    <p>'.$row['Inhalt'].'</p>
                </li>');
            }
        }
            


        echo('</ul>
    </div>
    <div class="message-input">
        <div class="wrap">
        <input type="text" placeholder="Write your message..." />
        <i class="fa fa-paperclip attachment" aria-hidden="true"></i>
        <button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
        </div>
    </div>
    ');

?>
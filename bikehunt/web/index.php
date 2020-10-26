<?php
  include('functions/db.php');
?>
<!DOCTYPE html>
  <html>
    <head>
      <link href="css/fonts.css" rel="stylesheet">
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="css/style.css"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
      <script src="js/jquery-3.4.1.min.js"></script>
      <title>Bike Hunt - Schwering Software</title>
      <link rel="icon" type="image/png" href="https://benedikt-schwering.de/media/SoftwareLogo.png">
    </head>

    <body>

    <?php
      if(!isset($_SESSION['TeamNr'])||!isset($_SESSION['GegnerNr']))
      {
    ?>

      <div id="login">
        <nav>
          <div class="nav-wrapper" style="background-color: #000;">
            <a href="index.php" class="brand-logo center">Bike Hunt</a>
          </div>
        </nav>

        <form id="loginForm" action="login.php" method="GET" class="col s12">
            <div class="input-field col s12">
              <input name="code" id="code" type="text" class="validate">
              <label for="code">Code</label>
            </div>

            <button id="loginSubmit" class="btn waves-effect waves-light black" type="submit">Anmelden
              <i class="material-icons right">send</i>
            </button>
        </form>
      </div>

    <?php
      }
      else
      {
        $query = mysqli_query($dbconnect, 'SELECT * FROM Team WHERE TeamNr = '.$_SESSION['TeamNr'].';');
        $team = mysqli_fetch_array($query);
        $query = mysqli_query($dbconnect, 'SELECT * FROM Team WHERE TeamNr = '.$_SESSION['GegnerNr'].';');
        $gegner = mysqli_fetch_array($query);
    ?>

      <div id="map">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" />
        <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
        <div id='bikemap'></div>
      </div>

      <div id="info">
        <a class="btn-floating btn-large waves-effect waves-light red modal-trigger" href="#infoModal"><i class="material-icons">group</i></a>
      </div>

      <div id="infoModal" class="modal">
        <div class="modal-content">
          <h4>Information</h4>
          <p>
            <h6>Dein Team:</h6> <b><?php echo($team['Name']); ?></b><br>(<?php echo($team['Beschreibung']); ?>)<br><hr>
            <h6>Gegner Team:</h6> <b><?php echo($gegner['Name']); ?></b><br>(<?php echo($gegner['Beschreibung']); ?>)
          </p>
        </div>
        <div class="modal-footer">
          <a href="#!" class="modal-close waves-effect waves-green btn-flat">Schließen</a>
        </div>
      </div>

    <?php
      }
    ?>

      <!--JavaScript at end of body for optimized loading-->
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript" src="js/script.js"></script>
      <script>
        $(document).ready(function(){
          $('.modal').modal();
        });
      </script>
    </body>
  </html>
<?php
  session_start();
  if(isset($_GET['benedikt']))
    $_SESSION['benedikt']=true;
?>
<!DOCTYPE html>
  <html>
    <head>
      <link href="css/fonts.css" rel="stylesheet">
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <script src="js/jquery-3.4.1.min.js"></script>
      <title>Point System</title>
      <style>
        body {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
          }

          main {
            flex: 1 0 auto;
          }
      </style>

    </head>
    <body>

    <nav>
        <div class="nav-wrapper" style="background-color: #ff5959;">
        <a href="index.php" class="brand-logo center">Point System</a>
        </ul>
        </div>
    </nav>
    <br><br>

    <div class="row">
      <div class="col s12 m12">
        <div class="card">
          <div class="card-content">
            <span class="card-title">Punkteberechnung</span>
            <p>

            </p>
          </div>
          <div class="card-action">
            <a href="#" id="auswrtbtn">Auswerten</a>
          </div>
          <div class="card-action" id="out">
                  
          </div>
        </div>
      </div>
    </div>

      <!--JavaScript at end of body for optimized loading-->
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script>
      
      </script>
    </body>
  </html>
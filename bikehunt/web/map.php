<html lang="de">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
      <title>Bike Hunt - Schwering Software</title>
      <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" />
      <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
   </head>

   <body style="margin:0;"><!--height: 92.5%;">-->
      <div id='meineKarte' style='height: 100%; width: 100%;'></div>

      <script type='text/javascript'>
        var Karte = L.map('meineKarte').setView([51.845879, 6.8417191], 12);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        'attribution': 'Schwering Software',
        'useCache': true
        }).addTo(Karte);
      </script>

      <script>        
         var marker;
         marker = L.marker([0,0]).addTo(Karte);

         const delay = ms => new Promise(res => setTimeout(res, ms));

         async function stickerLoad()
         {
            fetch('functions/getLastLocation.php')
               .then(response => response.json())
               .then(data => {if(data!==null){marker.removeFrom(Karte); marker = L.marker([data["Breite"], data["Laenge"]]).addTo(Karte).bindPopup("<b style='font-size: 1.2em;'>"+data["Name"]+"</b><br>"+data["Beschreibung"]+"<br>"+data["Zeit"]);}});

            await delay(5000);
            stickerLoad();
         }

         window.onload = stickerLoad();
      </script>

   </body>

   <body style="height: 7.5%;">
         
   </body>
</html>
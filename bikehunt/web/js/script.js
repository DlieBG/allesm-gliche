var Karte;
var marker;
const delay = ms => new Promise(res => setTimeout(res, ms)); 

function initialiseMap()
{
    Karte = L.map('bikemap').setView([51.845879, 6.8417191], 12);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        'attribution': 'Schwering Software',
        'useCache': true
    }).addTo(Karte);

    marker = L.marker([0,0]).addTo(Karte);  

    updateMarker();
}

async function updateMarker()
{
    fetch('functions/getLocation.php')
    .then(response => response.json())
    .then(data => {
        if(data!==null){
            marker.removeFrom(Karte);
            marker = L.marker([data["Breite"], data["Laenge"]])
                .addTo(Karte)
                .bindPopup("<b style='font-size: 1.2em;'>"+data["Name"]+"</b><br>"+data["Beschreibung"]+"<br>"+data["Zeit"]);
        }
    });

    await delay(5000);
    updateMarker();
}

async function initialisePosition()
{
    if ('geolocation' in navigator) 
    {
        navigator.geolocation.getCurrentPosition(updateLocation, function(error){alert("Fehler bei Standortbestimmung!");}, {enableHighAccuracy: true});
        navigator.geolocation.watchPosition(updateLocation);
    }
    else
        alert("Browser nicht geeignet!");
}

async function updateLocation(location)
{
    fetch('functions/updateLocation.php', {
        method: 'post',
        headers: {
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: 'longitude=' + location.coords.longitude + '+&latitude=' + location.coords.latitude
    });
}

window.onload = initialiseMap();
window.onload = initialisePosition();
<script>
    function appendLocation(location) {
        var text = 'Location: ' + location.coords.latitude + ', ' + location.coords.longitude + '';
        fetch('functions/updateLocation.php?longitude=' + location.coords.longitude + '+&latitude=' + location.coords.latitude);
    }

    if ('geolocation' in navigator) {
        navigator.geolocation.getCurrentPosition(function (location) {
            appendLocation(location);
        }, function(error){}, {enableHighAccuracy: true});
        navigator.geolocation.watchPosition(appendLocation);
    }
    else
        alert("Browser nicht geeignet!");
</script>
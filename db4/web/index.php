<?php

?>

<input type="number" id="person" onkeyup="load('person')" onclick="load('person')"></input>
<button onclick="load('adresse')">Adresse</button>
<button onclick="load('arbeit')">Arbeit</button>
<button onclick="load('bemerkung')">Bemerkung</button>
<button onclick="load('eigenschaft')">Eigenschaft</button>
<button onclick="load('ereignis')">Ereignis</button>
<button onclick="load('gegenstand')">Gegenstand</button>
<button onclick="load('gruppe')">Gruppe</button>
<button onclick="load('kontaktinfo')">Kontaktinfo</button>
<button onclick="load('konto')">Konto</button>
<button onclick="load('name')">Name</button>

<iframe id="iframe" src="person list.php" style="border: none; width: 100%; height: 90%;"></iframe>

<script>
function load(target)
{
    if(document.getElementById("person").value!=='')
        document.getElementById("iframe").src=target+".php?person="+document.getElementById("person").value;
}
</script>
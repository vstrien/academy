# Introductie casus
Je hebt als Business Intelligence consultant zojuist kennis gemaakt met je nieuwe klant: AdventureWorks. Deze (fabrikant/)distributeur van fietsen en bijbehorende benodigdheden is al enkele jaren actief met zowel fysieke (“brick-and-mortar”) als online winkels. Voor het nieuwe Data Warehouse willen ze graag met een zgn. “greenfield” beginnen. Een bijzonder mooie en leuke klus voor een BI-consultant!

Gedurende je traineeship zul je steeds meer (en verschillende) vaardigheden opdoen. De casus zal zich dan ook steeds verder uitbreiden: we starten met enkele analyses direct op het bronsysteem, maar zullen snel toewerken naar een grote totaaloplossing. Het is dan ook handig om vroeg in het proces al een schets te maken van de oplossing waar je naartoe gaat bouwen. Wanneer je training krijgt, gebruik dan de trainers ook als senior consultants die op je project langskomen: ze kunnen je zaken uitleggen die je lastig vindt, meedenken, maar ook advies geven vanuit hun ervaring.

## Casus week 1

Aan de start van dit project willen zowel je architect als je klant graag weten welke oplossing er komt te staan. Sommige zaken weten ze al (“het wordt de Microsoft BI-stack”), andere zaken zijn nog minder duidelijk. Daarnaast zijn er al wat concrete analyses waar de klant om gevraagd heeft.

Tevens heb je ontdekt dat een deel van de bronnen niet als een relationele database beschikbaar is: deze krijg je als CSV-bestanden aangeleverd. Voordat je hier analyses op kunt doen, moeten ze een plek krijgen in de database.

De opdracht is daarom als volgt:

* Maak een globaal ontwerp van je data-oplossing. Zorg hierbij minimaal voor de volgende zaken:
  * Een globale logische architectuur (integratielaag, presentatielaag, “landing zone”)
    * Voor inspiratie: [Meer informatie over een Data Warehouse architectuur](http://lmgtfy.com/?t=i&q=data+warehouse+architecture)
  * Een korte schriftelijke onderbouwing over je keuzes (dit breiden we in de loop van de Academy verder uit)
* Richt een staging area in voor de CSV-bronnen
  * Maak een aparte database aan voor de staging
  * Plaats alle tabellen in het schema ‘staging’
  * Bedenk hoe het proces eruit gaat zien van het laden van je staging area
  * Maak scripts om je tabellen leeg te kunnen maken
    * Bonus: zet deze in _stored procedures_ per tabel
  * Analyseer de aangeleverde bestanden, bepaal welke datatypes je nodig hebt en ontwerp de tabellen
    * In een staging area is geen referentiële integriteit nodig of aanwezig
    * Constraints en keys zijn ook niet nodig in de staging area
    * De GUID-kolommen mag je weglaten in de staging area
  * Bewijs dat de staging area ook de CSV-data kan bevatten, bijvoorbeeld door de “Import/Export data wizard” van SSMS te gebruiken.
* Voer de volgende analyses uit:
  * Geef de top 5 best verkopende klanten weer op basis van klantnummer
    * Verkopen aangeduid in TotalDue
    * Klantnummer te vinden in AccountNumber
  * Geef de top 10% best verkopende steden waar er vanuit het huisadres besteld is (AddressType is “Home”)
  * Geef het maximale verschil tussen orderdatum en betaaldatum (“OrderDate” en “DueDate”) per land (“CountryRegionCode”) waarheen verzonden is.

Tips:

* Produceer in alle ontwerpen niet teveel tekst: beter een paar duidelijke schema’s en tekeningen met een kort begeleidend schrijven dan een dik boekwerk!
* Denk ook aan de “presenteerbaarheid” van het geheel. Hoe kun je dit (relatief) eenvoudig aan veel mensen uitleggen? 
* Het kan handig zijn om je ideeën voor een staging area eerst te laten toetsen voordat je ‘m daadwerkelijk inricht
* In het bronsysteem wordt regelmatig een “BusinessEntityID” gebruikt. Dit is een SEQUENCE die over meerdere tabellen (klanten, medewerkers e.d.) gedeeld wordt. Soms wordt er dus naar “PersonID” verwezen, maar bestaat er geen “id” kolom in de “Person” tabel. Je gebruikt in dat geval de “BusinessEntityID” kolom.
* (Deze tip geldt gedurende de gehele cursus): Je weet vooraf nooit hoe veel moeite een opdracht je gaat kosten. Daarom:
  * Ga in alle gevallen voor om voor een klein onderdeel alles end-to-end uit te zoeken, en focus je pas in de tweede instantie op volledigheid. 
  * Concreet in dit geval: zorg ervoor dat je minimaal één tabel uit de CSV-bron een bijbehorende tabel in de staging area geeft en bijbehorende processen. Wanneer dit staat, kun je de breedte in en meer tabellen toevoegen.

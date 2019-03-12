# Historie in je model

Hieronder staat een eenvoudig scenario uitgewerkt over de verwerking van historie. Met behulp van de bijgeleverde code kun je deze situatie naspelen en SQL-statements hiervoor schrijven. De uitkomst hiervan hoef je niet letterlijk over te nemen in presentatie of verslag, maar kan een handige leidraad zijn voor het soort informatie dat je wilt opnemen in je presentatie / verslag.

Probeer minimaal opgave 1 uit te werken, om scherp te krijgen wat er gebeurt bij het laden van historie. De overige opgaven zijn optioneel, maar kunnen enorm helpen om je begrip van historie en historische analyses te vergroten.

## Omgeving

We hebben een miniatuur-DW met één die we historisch willen gaan opslaan. We hebben de volgende tabellen:

* `dbo.SourceTable` is de tabel in de bron
* `dbo.StagingTable` is onze *staging area*
* `dbo.HistoryTable` is de historische opslag

Dagelijks wordt de volledige inhoud van het bronsysteem aangeleverd. Hierbij is de volgende combinatie van attributen uniek:
  
* Klantnaam (is ook de Business Key voor een klant)
* DatumTijdAankoop
* ProductNaam

Alle overige zaken kunnen aangepast worden in het bronsysteem.

Wanneer een rij niet meer aanwezig is in de aanlevering, kiezen we ervoor om deze *af te sluiten* in de historielaag. Dit houdt in dat we de rij een einddatum meegeven. Wanneer een rij nog niet afgesloten is (we zeggen dan vaak dat de rij *actief* is), zetten we in het veld `Load_EndDTS` de waarde `9999-12-31 00:00:00`.

## Voorbeeld van historische verwerking

Op dag 1 (1-2-2018) ziet de aanlevering er als volgt uit:

| Klantnaam               | KlantWoonplaats | DatumAankoop | Productnaam | Aantal | Stuksprijs | Totaalprijs |
|-------------------------|-----------------|--------------|-------------|--------|------------|-------------|
| Simchat Data Consulting | Huizen          | 1-2-2018     | Laptop      | 6      | 1250       | 6000        |

Op dag 2 (2-2-2018) ziet de aanlevering er nu als volgt uit:

| Klantnaam                 | KlantWoonplaats | DatumAankoop | Productnaam | Aantal | Stuksprijs | Totaalprijs |
|---------------------------|-----------------|--------------|-------------|--------|------------|-------------|
| Simchat Data Consulting   | Huizen          | 1-2-2018     | Laptop      | 6      | 1250       | 6000        |
| St. Micha Data Consulting | Huizen          | 1-2-2018     | Laptop      | 6      | 1250       | 6000        |

Op dag 3 (3-2-2018) ziet de aanlevering er als volgt uit:

| Klantnaam                 | KlantWoonplaats | DatumAankoop | Productnaam | Aantal | Stuksprijs | Totaalprijs |
|---------------------------|-----------------|--------------|-------------|--------|------------|-------------|
| St. Micha Data Consulting | Huizen          | 1-2-2018     | Laptop      | 6      | 1250       | 6000        |

Op dag 4 (4-2-2018) ziet de aanlevering er als volgt uit:

| Klantnaam             | KlantWoonplaats | DatumAankoop | Productnaam | Aantal | Stuksprijs | Totaalprijs |
|-----------------------|-----------------|--------------|-------------|--------|------------|-------------|
| Sigma Data Consulting | Huizen          | 1-2-2018     | Laptop      | 6      | 1250       | 6000        |

Hoe ziet de historie-laag er nu uit op dag 1, 2, 3 en 4?

### Dag 1

In de historie-laag ziet er op dag 1 als volgt uit:

| Klantnaam                 | KlantWoonplaats | DatumAankoop | Productnaam | Aantal | Stuksprijs | Totaalprijs | Load_DTS   | Load_EndDTS   |
|---------------------------|-----------------|--------------|-------------|--------|------------|-------------|------------|---------------|
| *Simchat Data Consulting* | *Huizen*        | *1-2-2018*   | *Laptop*    | *6*    | *1250*     | *6000*      | *1-2-2018* | *31-12-9999*  |

### Dag 2

Op dag 2 is er één rij bij gekomen, en ziet de historie-laag er dus als volgt uit:

| Klantnaam                   | KlantWoonplaats | DatumAankoop | Productnaam | Aantal | Stuksprijs | Totaalprijs | Load_DTS   | Load_EndDTS   |
|-----------------------------|-----------------|--------------|-------------|--------|------------|-------------|------------|---------------|
| Simchat Data Consulting     | Huizen          | 1-2-2018     | Laptop      | 6      | 1250       | 6000        | 1-2-2018   | 31-12-9999    |
| *St. Micha Data Consulting* | *Huizen*        | *1-2-2018*   | *Laptop*    | *6*    | *1250*     | *6000*      | *2-2-2018* | *31-12-9999*  |

### Dag 3

Op dag 3 is er één rij verwijderd (deze wordt dus *afgesloten*). De historie-laag ziet er nu als volgt uit:

| Klantnaam                 | KlantWoonplaats | DatumAankoop | Productnaam | Aantal | Stuksprijs | Totaalprijs | Load_DTS | Load_EndDTS |
|---------------------------|-----------------|--------------|-------------|--------|------------|-------------|----------|-------------|
| Simchat Data Consulting   | Huizen          | 1-2-2018     | Laptop      | 6      | 1250       | 6000        | 1-2-2018 | *3-2-2018*  |
| St. Micha Data Consulting | Huizen          | 1-2-2018     | Laptop      | 6      | 1250       | 6000        | 2-2-2018 | 31-12-9999  |

### Dag 4

Op dag 4 is er een rij *geüpdatet*. Dit is echter vanuit de historie bezien niet anders dan het verwijderen en opnieuw toevoegen (in beide gevallen is de "oude" waarde niet meer zichtbaar in de aanlevering - of deze nu overschreven of verwijderd is - en de "nieuwe" waarde wel). De historie-laag ziet er daarmee als volgt uit:

| Klantnaam                 | KlantWoonplaats | DatumAankoop | Productnaam | Aantal | Stuksprijs | Totaalprijs | Load_DTS   | Load_EndDTS   |
|---------------------------|-----------------|--------------|-------------|--------|------------|-------------|------------|---------------|
| Simchat Data Consulting   | Huizen          | 1-2-2018     | Laptop      | 6      | 1250       | 6000        | 1-2-2018   | 3-2-2018      |
| St. Micha Data Consulting | Huizen          | 1-2-2018     | Laptop      | 6      | 1250       | 6000        | 2-2-2018   | *4-2-2018*    |
| *Sigma Data Consulting*   | *Huizen*        | *1-2-2018*   | *Laptop*    | *6*    | *1250*     | *6000*      | *4-2-2018* | *31-12-9999*  |

## Implementatie

1. Bijgevoegd vind je [een SQL-script](historie-casus.sql) met daarin een framework voor bovengenoemde vier dagen. Vul het script verder aan met een implementatie van het historisch laden van deze tabel.

## Verdieping en uitdaging

2. Wanneer je het idee hebt dat je het laadproces van staging naar historie goed snapt en de SQL-statements werkend hebt, zou je kunnen proberen of je één generieke *stored procedure* kan bedenken die het inladen van deze historische tabel voor je regelt.

Vaak worden historische tabellen op twee manieren gebruikt:

* Als *point-in-time*, waarbij je een datum opgeeft en de attributen van tabel terugkrijgt zoals die op de gegeven datum eruit gezien heeft (let op: het gaat hier om bronsysteem-attributen als *Klantnaam*. Systeem-attributen als *Load_EndDTS* krijg je nooit historisch terug)
* Als *actual*, waarmee je alleen *actieve* rijen weergeeft

3. Maak twee SELECT-statements:
   * Eén statement die op de tabel van dag 4 de stand van zaken van dag 2
   * Eén statement die altijd de *actieve* rijen teruggeeft
4. Voor extra uitdaging kun je een Table-Valued Function (TVF) maken die de *point-in-time* teruggeeft. Deze kun je dan bevragen door `SELECT * FROM [dbo].[HistoryTable_PIT]('2018-02-02')`
5. Als je je totaalbeeld wilt vergroten, kun je het bovenstaande voorbeeld verder uitwerken tot een klein dimensioneel model met twee (of drie) dimensies en een feittabel. Bedenk goed welke datum je hier gebruikt voor je datumdimensie!
   * Dimensie klant
   * Dimensie product
   * (Dimensie datum)
   * Feit verkoop

Bedenk dat je bij het bovenstaande dimensionele model een weergave geeft van de werkelijkheid *volgens de meest recente informatie*. Dat kan een verkleurd beeld geven als je bijvoorbeeld je beslissingsproces tegen het licht wilt houden. Concreet heb je het hier hier bijvoorbeeld over verkopen die gedaan zijn op 1-2-2018, maar doe je dit met de kennis van 4-2-2018. Wanneer je de vraag wilt beantwoorden over de verkopen op 1-2-2018 *zoals we dat zagen op 3-2-2018* (bijvoorbeeld vóór een fusie, of andere minder ingrijpende gebeurtenissen), heb je een tweede tijdslijn nodig.

6. Bedenk hoe je dit conceptueel zou kunnen oplossen in je dimensionele model, en welke informatie je hiervoor nodig hebt vanuit je historie-laag.
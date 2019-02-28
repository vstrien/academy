# Meer Calculated Columns

Met *calculated columns* kun je in een kolom voor elke rij van een tabel een berekening laten uitvoeren. In de vorige module hebben we hier een voorbeeld van gezien, waarbij in elke rij in de producttabel de bijbehorende subcategorie en categorie werd opgezocht via de functie `RELATED`.

In deze module kijken we naar andere mogelijkheden van _calculated columns_.

## Berekeningen

Bij het definiëren van _calculated columns_ kun je gebruikmaken van een heel arsenaal aan DAX-functies. Van heel geavanceerde (die feitelijk voor elke rij in de tabel een nieuwe query uitvoeren) tot basale functies als optellen en aftrekken.

Hieronder staan een paar opdrachten - kijk in hoeverre je ze kunt oplossen met een _calculated column_:

* In de tabel "Sales" willen we een nieuwe kolom met daarin subtotaal inclusief belastingen
* In de tabel "Product" willen we een nieuwe kolom met daarin een indicator of een product rood van kleur is
* In de tabel "Product" willen we een groepering van _listprice_.
  * Kolomnaam: "prijssegment_code"
  * _listprice_ = 0 -> _Blank_
  * _listprice_ tussen 0 en 1000 -> 1
  * _listprice_ tussen 1000 en 2000 -> 2
  * _listprice_ tussen 2000 en 3000 -> 3
  * _listprice_ tussen 3000 en 4000 -> 4
  * Probeer de weergave zo te krijgen dat dit als een geheel getal wordt weergegeven in het datamodel
* In de tabel "Product" willen we het prijssegment ook een label geven
  * Kolomnaam: "prijssegment"
  * 0: "Geen geld"
  * 1: "Goedkoop"
  * 2: "Minder goedkoop"
  * 3: "Duur"
  * 4: "Exorbitant"
* Wanneer je nu de verkopen groepeert per prijssegment in een visualisatie, zul je zien dat deze alfabetisch gesorteerd is:

![Foute sortering](img/prijssegment-sortering-fout.png)

* Zorg ervoor dat de sortering hiervan gaat op basis van de prijssegment_code. *Je hoeft hier geen DAX-expressies te gebruiken of aan te passen!*
* Verberg vervolgens de kolom "prijssegment_code"

![Correcte sortering](img/prijssegment-sortering-goed.png)

## Visuele shizzle

Na de aanpassing van deze definities en codes, is het tijd om wat zaken aan te gaan passen in je rapport.

* Ga terug naar de *Report* weergave van Power BI, en voeg hier een nieuwe pagina toe
* Zorg ervoor dat deze er als volgt uit gaat zien.
  * Tip: je zult hier ook nog wat aanpassingen moeten doen aan de instellingen van je datamodel ...
  * ... maar je hoeft geen extra DAX-expressies, measues of calculated columns toe te voegen

![Doelopmaak rapport](img/screenshot-pbi-doel.png)

## Volgende modules

De volgende module is [Module 7: Power Query via de GUI](07-power-query.md). Hieronder vind je een overzicht van alle modules:

1. [Introductie Power BI Desktop](01-introductie-powerbi-desktop.md)
2. [CSV-data inladen, introductie Power Query en eerste visualisatie](02-csv-inladen.md)
3. [SQL-bronnen inladen](03-sql-inladen.md)
4. [Relaties leggen](04-relaties.md)
5. [Opschonen en introductie calculated columns](05-opschonen.md)
6. *Meer calculated columns* (huidige module)
7. [Power Query via de GUI](07-power-query.md)

# Relaties leggen

In de vorige module zagen we dat er een relatie ontbrak tussen de tabel *Store* (waarin de winkels staan) en de tabel *2014-01* (waar de verkopen uit 2014 in aangeleverd zijn).

## Aanmaken van relaties

Om relaties aan te maken, schakel je naar de "Relationships" weergave.

![Relationships weergave in Power BI](img/relationships.png)

Zoals je ziet, liggen er diverse relaties, weergegeven door lijntjes tussen de tabellen. Wanneer op een relatie klikt, zie je hoe de relatie loopt en welke kolommen naar elkaar refereren. In een relatie zijn drie belangrijke kenmerken:

1. de "1"-zijde
2. de "*"-zijde
3. de filter-richting

![Drie componenten in relatie](img/driecomponenten.png)

In bovenstaand plaatje:

* De relatie loopt tussen _Production ProductSubcategory_ en _Production Product_
* De relatie ligt aan beide zijden op de kolom _ProductSubcategoryID_
* De kolom _ProductSubcategoryID_ is uniek binnen de tabel _Production Product_ (dit is aangegeven door de "1" bij de relatie)
* Wanneer je de tabel _Production ProductSubcategory_ filtert (door bijvoorbeeld in een rapport te klikken op een subcategorie), dan werkt deze filter door in de lijst met weergegeven producten.

Probeer dit laatste uit in de Report-weergave van Power BI.

Er mist momenteel een relatie tussen de tabel "2014-01" en de tabel "Store". Leg deze aan, door de kolom "BusinessEntityID" te slepen van "Store" en los te laten boven de kolom "StoreID" in de tabel "2014-01":

![Relatie toevoegen door drag and drop](img/addrelationship.png)

Keer nu terug naar de "report" weergave en verifieer dat de weergave van vrachtkosten per winkel correct gaat.

## Volgende modules

De volgende module is [Module 5: Opschonen en introductie calculated columns](05-opschonen.md). Hieronder vind je een overzicht van alle modules:

1. [Introductie Power BI Desktop](01-introductie-powerbi-desktop.md)
2. [CSV-data inladen, introductie Power Query en eerste visualisatie](02-csv-inladen.md)
3. [SQL-bronnen inladen](03-sql-inladen.md)
4. *Relaties leggen* (huidige module)
5. [Opschonen en introductie calculated columns](05-opschonen.md)
6. [Meer calculated columns](06-calc-columns.md)
7. [Power Query via de GUI](07-power-query.md)

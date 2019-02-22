# Toets week 3

Het is inmiddels week 4, maar de toets van deze week gaat over week 3.

Opnieuw geldt hier:

Er zijn de afgelopen weken behoorlijk wat nieuwe onderwerpen de revue gepasseerd. Om een beeld te krijgen van hoe dit geland is, krijg je deze toets. Deze is primair niet bedoeld als beoordeling, maar als indicator voor de onderwerpen die nog extra aandacht nodig hebben.

## 3NF-Modelleren

1. Hieronder staan twee tabellen. Accountmanager ID verwijst naar de tabel "Accountmanager". Zijn deze in 3NF (de derde normaalvorm)?
   * Zo ja, hoe zie je dit?
   * Zo nee: teken de tabellen zoals ze wel in 3NF zouden zijn.

| Klantnummer | Naam    | Accountmanager ID |
|-------------|---------|-------------------|
| 15001       | Stephan | 25                |
| 15002       | Wesley  | 25                |
| 15003       | Jimmy   | 26                |

| Accountmanager ID | Naam    |
|-------------------|---------|
| 25                | Bart    |
| 26                | Vincent |

2. Hieronder staan drie tabellen. Zijn deze in 3NF?
   * Zo ja, hoe zie je dit?
   * Zo nee: teken de tabellen zoals ze wel in 3NF zouden zijn.

| Verkoop ID | Verkoper ID | Product ID | Datum     |
|------------|-------------|------------|-----------|
| 10101      | 1           | 11         | 22-2-2019 |
| 10102      | 2           | 22         | 22-2-2019 |
| 10103      | 1           | 11         | 22-2-2019 |
| 10104      | 3           | 22         | 23-2-2019 |

| Verkoper ID | Naam   | Voornaam manager | Achternaam manager |
|-------------|--------|------------------|--------------------|
| 1           | Lotte  | Bart             | Brolsma            |
| 2           | Marnix | Vincent          | Wylenzek           |
| 3           | Timo   | Vincent          | Wylenzek           |

| Product ID | Naam product       | Introductiedatum |
|------------|--------------------|------------------|
| 11         | Pen                | 1-1-2018         |
| 12         | Potlood            | 1-1-2018         |
| 13         | Papier             | 1-5-2018         |
| 22         | Paperclips 100 st. | 1-7-2018         |

## Dimensioneel modelleren

BIT Consultancy is zeer geïnteresseerd in de klanttevredenheid, en heeft daarom een beoordelingssysteem toegevoegd aan haar ERP-pakket. Klanten beoordelen daarin geen individuele medewerkers, maar projecten waarop medewerkers werkzaam zijn. Hieronder staat een deel van het datamodel van het ERP-systeem van BIT - eerst op tabelniveau, daarna uitgesplitst naar kolommen en datatypes.

![Diagram van bronsysteem - tabelweergave](toets-bestanden/bronsysteem-diagram-tabelweergave.png)

![Diagram van bronsysteen - kolomweergave](toets-bestanden/bronsysteem-diagram-kolomweergave.png)

BIT Consultancy wil over het bovenstaande bronsysteem gaan rapporteren, en overweegt om rapportages direct op het bronsysteem te gaan bouwen.

3. Vind je dit een goed idee, of zou je hier een Data Warehouse tussenin zetten? Onderbouw.

Enkele vragen die BIT consultancy beantwoord wil zien om goed onderbouwde beslissingen te kunnen maken zijn de volgende:

* Hoe is de ontwikkeling van het gemiddelde uurloon per medewerker door de tijd heen? Kunnen we hier trends in herkennen?
* Zijn er bepaalde "top-medewerkers" op het gebied van beoordeling? (Met andere woorden: Is het wellicht zo dat een project significant hoger beoordeeld wordt wanneer medewerker X daar werkt? Of daalt de klanttevredenheid juist standaard bij bepaalde medewerkers?)
* Hoeveel medewerkers zitten er gemiddeld op een project? Zijn grote projecten beter beoordeeld, of juist kleinere?
* Is er een relatie tussen de gemiddelde reisafstand die medewerkers op een project afleggen en de klanttevredenheid?

4. Ontwerp een dimensioneel model waarbij bovenstaande vragen beantwoord kunnen worden. Probeer geen onnodige snowflakes te maken!
# Extra DAX opdrachten - dag 2

In de map "Starter" vind je een Power BI bestand genaamd [Start-dag-2.pbix](Starter/Start-dag-2.pbix). Dit is een nieuw ingeladen bestand en bouwt dus niet voor op de casus van vorige dagen! Bekijk eerst even de relaties in de _Relationship view_ van Power BI om een beeld te krijgen van het model. Merk op:

* Er liggen drie relaties tussen *Fact Reseller Sales* en *Dim Date*, maar er is er slechts één actief. (welke?)
* Idem tussen *Fact Reseller Sales* en *Dim Geography*

Hieronder staan diverse opdrachten die je op het model moet uitvoeren. Zoals je zult zien, staat er niet altijd bij hoe je verifieert of je iets juist hebt gedaan, of hoe je de effecten kunt zien. Je hebt inmiddels al één en ander van Power BI gezien, dus probeer waar nodig zelf de visualisaties te bedenken die laten zien dat jouw oplossingen werken.

Wanneer je complexere DAX-functies gaat schrijven, bedenk dan dat het oplossen van problemen stukken eenvoudiger is wanneer je de code helder opmaakt. Gebruik hier bijvoorbeeld [DAX Formatter](https://www.daxformatter.com) voor.

1. Maak een _calculated column_ in *FactResellerSales*, waarin je de kolom *SalesTerritoryCountry* uit de *DimSalesTerritory* ophaalt.
   * Via welke relatie wordt deze opgehaald?
   * Bonus: maak een tweede calculated column die via de niet-actieve relatie de _SalesTerritoryCountry_ ophaalt
      * Zitten er verschillen in deze registratie?
2. De *margin* voor een product is bepaald door de "lijstprijs" (*listprice*) minus de kosten (*standardcost*). Maak een grafiek waarin je de *margin* per product weergeeft. Probeer dit op twee manieren op te lossen:
   * Maak een _calculated column_ binnen _DimProduct_
   * Maak een _measure_ die de marge berekent
3. De opdracht hierboven gaf je de marge ten opzichte van de catalogusprijs ("lijstprijs"). Dat is iets anders dan de daadwerkelijke marge, die je op basis van daadwerkelijke verkoopprijs bepaalt (kolom _SalesAmount_ in _FactResellerSales_). Bereken ook de daadwerkelijke marge in een measure, deze keer op basis van _SalesAmount_ en _TotalProductCost_. (_OrderQuantity_ is al verwerkt)
4. Zorg ervoor dat je de marge ook *procentueel* kunt weergeven (marge als percentage van de verkoopprijs). Bedenk zelf of je hier een _calculated column_ of een _measure_ voor nodig hebt.
5. Maak een _calculated column_ binnen _DimProductCategory_. Sla hier het _daadwerkelijke_ margepercentage op binnen de productcategorie
6. Maak een _calculated column_ binnen _DimProductSubcategory_. Sla hier de totale marge in op (in dollars) die in het jaar 2012 binnengekomen is.
7. (Deze is pittig!) Maak twee _measures_ waarin je de _SalesAmount_ weergeeft van
   * de klant die het _minst_ gekocht heeft (globaal is dit € 1,37)
   * de klant waarvan de naam start met een A en het minst gekocht heeft (€ 381,19)
   * Hints:
      * je moet hier _itereren_ over de resellers
      * Direct gevolg is dat je je binnen een _row context_ bevindt, dus moet je goed bedenken hoe je vanuit de tabel waarover je itereert de benodigde tabel met verkopen kunt benaderen
8. Binnen het bedrijf is een nieuwe standaard voor het noteren van maanden bedacht:
![January-Decuary](https://i.imgur.com/Pk4lgUV.gif)
   * Voeg een kolom "MonthUary" toe binnen _DimDate_. Zorg er hier voor dat op basis van _MonthNumberOfYear_ (binnen _DimDate_) de volgende waarden in komen:
   * 1 -> January
   * 2 -> Febuary
   * 3 -> Maruary
   * 4 -> Apruary
   * etc.
   * Los dit met een `SWITCH` functie op.
   * Zorg ervoor dat de kolom automatisch correct sorteert (nee, dat is niet op alfabet..)
   * Bonus: zorg ervoor dat in je expressie de term "uary" maar één keer voorkomt.
   * Bonusbonus: Zorg ervoor dat "uary" de enige string is in de `SWITCH`, en dat je de maandafkortingen tevoorschijn haalt met `FORMAT`
9. Voeg een measure toe genaamd _AantalUniekeResellers_. Hiermee bereken je hoeveel unieke resellers zich binnen een selectie bevinden
   * Tip: test hierbij niet zozeer de tabel _DimReseller_, maar focus je op _ResellerKey_ binnen _FactResellerSales_
   * Test dit met bijv. een matrix-visualisatie, waarbij je de jaren op de kolommen zet en de productcategorieën op de rijen
   * Bedenk waarom deze measure niet werkt in bovenstaande visualisatie wanneer je zou tellen binnen _DimReseller_
10. Maak een "cumulatief totaal" (ofwel _running total_) van verkopen dat ook over de jaren heen werkt
   * Als je er niet direct uitkomt, helpt het wellicht [om Google te gebruiken](http://lmgtfy.com/?q=dax+cumulative+total)
   * De oplossing is eenvoudiger wanneer je gebruikmaakt van een variabele om de maximale datum in de huidige selectie op te slaan
11. Maak een YTD-measure voor verkopen op twee manieren:
   * Met de YTD-functies van DAX
   * Op basis van het patroon uit de vorige opgave
12. Maak een measure die de verkopen *niet* weergeeft als er slechts één reseller geselecteerd is
   * Wanneer je dus een tabel maakt met de verkopen per land waarin de reseller zit, zie je de verkopen hier gewoon
   * Wanneer je de weergave uitsplitst per _reseller key_, worden de verkopen niet weergegeven
   * *Er zijn wereldwijd twee resellers met dezelfde naam. Wanneer je uitsplitst op basis van reseller naam, zul je deze dus wel terugzien*
13. Maak drie _SalesAmount_ measures:
   * Gebaseerd op OrderDate: _SalesAmountOrderDate_
   * Gebaseerd op DueDate: _SalesAmountDueDate_
   * Gebaseerd op ShipDate: _SalesAmountShipDate_
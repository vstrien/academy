# Casus week 5

Nog steeds in de technische implementatie, bouwen we deze week een analytische database in SSAS (Tabular Model) op basis van het dimensioneel model dat we vorige week hebben afgerond. Daarnaast heeft de klant zich gerealiseerd dat er een nieuw bronsysteem benodigd is voor bepaalde analyses. Dit bronsysteem bevat gevoelige persoonlijke data, dus we moeten zorgvuldig omgaan met wie er wat mag zien in de kubus! Uiteraard wijken we hiervoor niet van onze planning af: het Tabular Model wordt deze week geïmplementeerd, op basis van de bronnen zoals we die al hadden.

## De opdrachten voor deze week

* Implementatie van de SSAS-TM kubus op basis van het dimensioneel model
* Ontwerp / plan maken voor het opnemen van de nieuwe bron
  * Binnen het DW
  * Binnen het Tabular Model

## Tips

* Voor SSAS:
  * Denk aan de benodigde measures!
  * Geef aandacht aan gebruiksvriendelijkheid op het gebied van
    * Snowflakes (of niet)
    * Kolom- en tabelnamen
    * (Evt. perspectives voor rapportages)
    * (Evt. translations)
* Voor de nieuwe bron:
  * Maak minimaal een inschatting van wat er wordt geraakt (impactanalyse) en van wat je aan extra werk denkt kwijt te zijn
  * Bedenk goed hoe zou je de security inrichten zoals vereist met rollen en RLS. Op het moment dat je al een Tabular Model hebt staan, probeer dan de requirements te vertalen naar een situatie die je eenvoudig kunt naspelen.
    * Bijvoorbeeld: “een klant mag alles van productcategorie A zien, behalve als het in regio Y verkocht is” is ook na te spelen met 
      * een willekeurige transactie (niet alleen “verkoop”)
      * een willekeurige hiërarchie (niet alleen “productcategorie”)
      * een willekeurige andere dimensie (niet alleen “regio”)
    * Zonder extra te bouwen, kun je zo een ontwerp al testen en uitproberen
  * Bedenk of je deze bron met de hand zou willen toevoegen, of wellicht liever gebruik wilt maken van het SDC ETL-framework

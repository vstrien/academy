# Casus week 5

Nog steeds in de technische implementatie, bouwen we deze week een analytische database in SSAS (Tabular Model) op basis van het dimensioneel model dat we vorige week hebben afgerond. Daarnaast heet de klant recent een demo gezien van Power BI ("spiegeltjes en kraaltjes" volgens onze architect), en wil graag een korte impressie van wat hiermee mogelijk is t.b.v. de rapportages die ook in SSRS ontwikkeld werden.

Vanuit het team moeten we ook gaan werken aan de documentatie. Ons product moet over enkele weken presenteerbaar zijn, en de verwachting is dat we hier ook een goed gedocumenteerd product opleveren. Het gaat hier vooral om het documenteren van de keuzes die we gemaakt hebben:

* Hoe zit de logische architectuur in elkaar?
* Welke technische invulling is hieraan gegeven?
* Welke stappen kent het laadproces?
* Is er rekening gehouden met herstartbaarheid?

Daarnaast zullen we moeten gaan nadenken over *historie* en *incrementeel laden*. Hierover volgt later meer (met name even wat dingen om over na te denken).

## Tips

* Voor SSAS:
  * Denk aan de benodigde measures!
  * Geef aandacht aan gebruiksvriendelijkheid op het gebied van
    * Snowflakes (of niet)
    * Kolom- en tabelnamen
    * (Evt. perspectives voor rapportages)
    * (Evt. translations)

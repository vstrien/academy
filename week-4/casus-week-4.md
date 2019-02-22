# Casus week 4

De casus van week 3 bestond uit de gesprekken die je met de "technische mannen" van de klant hebt gevoerd. Die heeft gewerkt: de klant is overtuigd geraakt van het nut van een Data Warehouse, en is ermee akkoord dat we dit in een dimensioneel model oplossen. Je taak voor deze week bestaat dan ook uit de volgende zaken:

1. Een dimensioneel model ontwerpen, laten reviewen en implementeren
   * Je hebt uiteraard al e.e.a. aan dimensionele modellen gezien van de AdventureWorks-klant (in de casussen), maar omwille van je leerervaring zou ik je aanmoedigen hier  niet teveel naar te kijken / door te laten leiden
   * Probeer snowflakes zoveel mogelijk te vermijden
   * Zorg ervoor dat de vragen uit de rapportage van week 2 eenvoudig door het model te beantwoorden zijn
   * Maak eerst een globaal model waarin je aangeeft welke informatie (measures / attributen) t.b.v. de rapportage en analyse waarvandaan gaat komen. Nadat je dit hebt  laten reviewen (denk eraan in de review te laten zien hoe je de vragen uit het rapport gaat beantwoorden!)
   * *Tip: Pak een flipboard-vel en stiften, en zoek met je team een tafel op waar je met elkaar omheen kan staan en werken*
   * Nadat het ontwerp is goedgekeurd, werk je dit verder uit tot een database-ontwerp. Gebruik daar een tool als bijv. [SQLDBM](https://app.sqldbm.com/) voor (voel je vrij om even te zoeken naar een andere tool die je prettig vindt)
      * Implementeer dit model in je DW-database waar ook je staging staat
      * Zet alle tabellen in het `dimensional` schema
2. Een plan/ontwerp maken hoe je dit in SSIS gaat ontwikkelen.
   * Maak een plan waarin je bedenkt hoe je de volgende zaken oplost:
      * Laden van nieuwe data
         * Je krijgt elke dag een volledige datadump. Hoe krijg je deze correct aangevuld in je type 2 dimensies en feittabellen?
         * Hoe werken de lookups tussen een feittabel en een type 2-dimensie?
            * Zorg ervoor dat je [goed](https://www.nuwavesolutions.com/slowly-changing-dimensions/) [online](https://www.mssqltips.com/sqlservertip/5632/implement-a-slowly-changing-type-2-dimension-in-sql-server-integration-services--part-1/) [zoekt](https://www.mssqltips.com/sqlservertip/5639/optimizing-type-2-slowly-changing-dimensions-in-integration-services--part-2/) [naar](https://www.mssqltips.com/sqlservertip/5640/additional-optimizations-for-type-2-slowly-changing-dimensions-in-sql-server-integration-services--part-3/) [bronnen](https://www.mssqltips.com/sqlservertip/5642/handling-intraday-changes-for-type-2-slowly-changing-dimensions-in-sql-server-integration-services--part-4/) [en](https://datadrivenperspectives.com/how-to-properly-update-a-type-ii-slowly-changing-dimension-with-t-sql-8ec03242c915) [manieren](https://sqlbits.com/Sessions/Event10/Loading_Data_Warehouse_Dimensions_in_SSIS) (je hoeft niet zelf het wiel uit te vinden, en bent ook niet verplicht om alles in SSIS op te lossen!)
      * Herstartbaarheid van procedures. Wat doe je als halverwege de load de server uitvalt en je herstart? Hoe los je dit op?
      * Impact van wijzigingen (moet je voor een enkele wijziging je gehele ETL aanpassen, of hebben wijzigingen minder impact?)
      * Volgorde van ETL-processen (is er een strikte volgorde, hoe beheer of documenteer je dit?)
   * Implementeer een PoC (Proof-of-Concept) voor één type-2-dimensie en een feittabel het gehele proces
      * Wanneer je maar één dimensie hebt, betekent dit automatisch dat de feittabel dus niet alle dimensies kan vullen. Dat is voor deze PoC ook niet belangrijk.

## Tips (niet alleen voor Stephan)

* Er staan nogal wat links naar interessante artikelen in de tekst verwerkt. Kan handig zijn.
* Ga niet gelijk aan het programmeren. Eerst een plan, eerst overleggen, eerst checken of er wellicht valkuilen zitten!

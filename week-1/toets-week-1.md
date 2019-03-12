# Toets week 1

Er zijn deze week behoorlijk wat nieuwe onderwerpen de revue gepasseerd. Om een beeld te krijgen van hoe dit geland is, krijg je deze toets. Deze is primair niet bedoeld als beoordeling, maar als indicator voor de onderwerpen die nog extra aandacht nodig hebben.

Het gaat er ook niet om dat je de letterlijke syntax goed hebt - schrijf op hoe je denkt dat een query zou moeten.

## Toets

De toets bestaat uit een aantal vragen en SQL-statements waarvan je de uitkomst moet voorspellen. De tabellen waar de queries van uit gaan zien er als volgt uit:

### Product

| Product_id | Naam   |
|------------|--------|
| 1          | Auto   |
| 2          | Beker  |
| 3          | Cactus |

### Kleur

| Kleur_id | Naam   |
|----------|--------|
| 11       | Geel   |
| 12       | Rood   |
| 13       | Oranje |
| 14       | Paars  |

### Product_Kleur

(Deze tabel geeft aan welke producten in welke kleur leverbaar zijn, en koppelt dus _product_ aan _kleur_)

| Product_id | Kleur_id | Prijs |
|------------|----------|-------|
| 1          | 11       | 12.00 |
| 1          | 12       | 21.00 |
| 2          | 13       | 30.00 |
| 3          | 12       |  NULL |

### Vragen

* Wat is het verschil tussen `NVARCHAR(3)` en `VARCHAR(3)`?
* De variabele `@var` is gedefinieerd door `DECLARE @var INT`. Vervolgens wijzen we er de waarde `3.234` aan toe via `SET @var = 3.234`. Wat is nu het resultaat als we `SELECT @var` uitvoeren?
* We willen een kolom `Leverancier` toevoegen aan de tabel `Product`. Leveranciers willen we kunnen opslaan met een precisie van 100 tekens.
  * Beschrijf het statement hoe je deze toevoegt (hint: `ALTER TABLE xxx ADD COLUMN yyy`)
  * Bedenk goed of je `NULL`-waarden wilt toestaan, en schrijf op waarom!
* Nu de kolom `Leverancier` is toegevoegd, willen we er ook data in doen. Schrijf een `UPDATE` statement om de leverancier `Vistaprint` toe te voegen aan het product `Beker`
* De tabel "Product" heeft een `IDENTITY(1,1)` als eigenschap bij de kolom `product_id`
* Voeg een nieuwe rij toe aan de tabel `Product`, met de volgende waarden:
  * Naam: Doos
  * Leverancier: Verpakkingsmaterialen B.V.  
* Schrijf een `SELECT` statement waarin je alle tabellen aan elkaar koppelt.
  * Producten zonder kleur (en vice versa) mogen niet in de resultaatset voorkomen.
  * De resultaatset moet uiteindelijk de volgende kolommen bevatten:
    * NaamKleur: een samengevoegde kolom, met daarin de productnaam en kleur gescheiden door een komma (bijv. "Auto, Geel")
    * Prijs: is "0" wanneer onbekend.
    * IsVoertuig:
      * "Voertuig" wanneer het een voertuig betreft (dus alleen voor "Auto")
      * "Geen voertuig" voor alle overige gevallen
    * KleurBehalveGeel:
      * NULL as de kleur geel is
      * De naam van de kleur in alle overige gevallen
    * Bonus: KleurBehalveGeelv2:
      * Inhoud identiek aan KleurBehalveGeel, maar dan op een andere manier opgelosts
* Schrijf de uitkomst van bovenstaand statement uit
* Schrijf een `SELECT`-statement dat de kleuren weergeeft waar momenteel geen producten bij geregistreerd staan.
  * Alleen de kleurnaam is voldoende
  * Bonus: bedenk een tweede aanpak om hetzelfde resultaat te bereiken.
-- VOORBEREIDING

IF OBJECT_ID('dbo.SourceTable', 'U') IS NOT NULL
	DROP TABLE dbo.SourceTable

CREATE TABLE [dbo].[SourceTable](
	[KlantNaam] [varchar](50) NULL,
	[KlantWoonplaats] [varchar](50) NULL,
	[DatumTijdAankoop] [datetime] NULL,
	[ProductNaam] [varchar](50) NULL,
	[Aantal] [int] NULL,
	[Stuksprijs] [decimal](15, 4) NULL,
	[Totaalprijs] [decimal](15, 4) NULL
)

IF OBJECT_ID('[dbo].[StagingTable]', 'U') IS NOT NULL
	DROP TABLE dbo.[StagingTable]

CREATE TABLE [dbo].[StagingTable](
	[KlantNaam] [varchar](50) NULL,
	[KlantWoonplaats] [varchar](50) NULL,
	[DatumTijdAankoop] [datetime] NULL,
	[ProductNaam] [varchar](50) NULL,
	[Aantal] [int] NULL,
	[Stuksprijs] [decimal](15, 4) NULL,
	[Totaalprijs] [decimal](15, 4) NULL,
	[Load_DTS] [datetime2](7) NULL,
	[BatchNr] [int] NULL
)
GO

IF OBJECT_ID('[dbo].[HistoryTable]', 'U') IS NOT NULL
	DROP TABLE dbo.HistoryTable

CREATE TABLE dbo.HistoryTable (
    hist_id BIGINT IDENTITY(1,1)
	, KlantNaam VARCHAR(50)
	, KlantWoonplaats VARCHAR(50)
	, DatumTijdAankoop DATETIME
	, ProductNaam VARCHAR(50)
	, Aantal INT
	, Stuksprijs DECIMAL(15, 4)
	, Totaalprijs DECIMAL(15, 4)
	
	, Load_DTS DATETIME2
	, Load_EndDTS DATETIME2
	, BatchNr INT
)
















-- DAG 1
INSERT INTO dbo.SourceTable (KlantNaam, KlantWoonplaats, DatumTijdAankoop, ProductNaam, Aantal, Stuksprijs, Totaalprijs)
VALUES ('Simchat Data Consulting', 'Huizen', DATETIME2FROMPARTS(2018, 02, 01, 0, 0, 0, 0, 0), 'Laptop', 6, 1250, 6000)

SELECT * FROM dbo.SourceTable

-- --------------------------------------------------------------------------
-- Implementeer logica om de staging area te vullen op basis van de brontabel
-- --------------------------------------------------------------------------
DECLARE @Load_DTS DATETIME2 = DATETIME2FROMPARTS(2018, 02, 01, 0, 0, 0, 0, 0)
DECLARE @BatchNr INT = 1



-- Hier jouw logica.





-- Verwachte uitkomst:
--KlantNaam					KlantWoonplaats	DatumTijdAankoop		ProductNaam	Aantal	Stuksprijs	Totaalprijs	Load_DTS				BatchNr
--Simchat Data Consulting	Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-01 00:00:00.000 1
SELECT * FROM dbo.StagingTable




-- ------------------------------------------------------------------------------
-- Implementeer logica om de historie-laag te vullen op basis van de staging area
-- ------------------------------------------------------------------------------


-- Hier jouw logica





-- Verwachte uitkomst:
--KlantNaam					KlantWoonplaats	DatumTijdAankoop		ProductNaam	Aantal	Stuksprijs	Totaalprijs	Load_DTS				Load_EndDTS				BatchNr
--Simchat Data Consulting	Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-01 00:00:00.000	9999-12-31 00:00:00.000	1
SELECT * FROM dbo.HistoryTable


GO























-- DAG 2
INSERT INTO dbo.SourceTable (KlantNaam, KlantWoonplaats, DatumTijdAankoop, ProductNaam, Aantal, Stuksprijs, Totaalprijs)
VALUES ('St. Micha Data Consulting', 'Huizen', DATETIME2FROMPARTS(2018, 02, 01, 0, 0, 0, 0, 0), 'Laptop', 6, 1250, 6000)




SELECT * FROM dbo.SourceTable


-- --------------------------------------------------------------------------
-- Implementeer logica om de staging area te vullen op basis van de brontabel
-- --------------------------------------------------------------------------
DECLARE @Load_DTS DATETIME2 = DATETIME2FROMPARTS(2018, 02, 02, 0, 0, 0, 0, 0)
DECLARE @BatchNr INT = 2



-- Hier jouw logica.





-- Verwachte uitkomst:
--KlantNaam					KlantWoonplaats	DatumTijdAankoop		ProductNaam	Aantal	Stuksprijs	Totaalprijs	Load_DTS				BatchNr
--Simchat Data Consulting	Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-02 00:00:00.000 2
--St. Micha Data Consulting	Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-02 00:00:00.000 2
SELECT * FROM dbo.StagingTable




-- ------------------------------------------------------------------------------
-- Implementeer logica om de historie-laag te vullen op basis van de staging area
-- ------------------------------------------------------------------------------


-- Hier jouw logica





-- Verwachte uitkomst:
--KlantNaam					KlantWoonplaats	DatumTijdAankoop		ProductNaam	Aantal	Stuksprijs	Totaalprijs	Load_DTS				Load_EndDTS				BatchNr
--Simchat Data Consulting	Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-01 00:00:00.000	9999-12-31 00:00:00.000	1
--St. Micha Data Consulting	Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-02 00:00:00.000	9999-12-31 00:00:00.000	2
SELECT * FROM dbo.HistoryTable


GO


























-- DAG 3

DELETE FROM dbo.SourceTable WHERE KlantNaam = 'Simchat Data Consulting'



SELECT * FROM dbo.SourceTable



-- --------------------------------------------------------------------------
-- Implementeer logica om de staging area te vullen op basis van de brontabel
-- --------------------------------------------------------------------------
DECLARE @Load_DTS DATETIME2 = DATETIME2FROMPARTS(2018, 02, 03, 0, 0, 0, 0, 0)
DECLARE @BatchNr INT = 3



-- Hier jouw logica.





-- Verwachte uitkomst:
--KlantNaam					KlantWoonplaats	DatumTijdAankoop		ProductNaam	Aantal	Stuksprijs	Totaalprijs	Load_DTS				BatchNr
--St. Micha Data Consulting	Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-03 00:00:00.000 3
SELECT * FROM dbo.StagingTable




-- ------------------------------------------------------------------------------
-- Implementeer logica om de historie-laag te vullen op basis van de staging area
-- ------------------------------------------------------------------------------


-- Hier jouw logica





-- Verwachte uitkomst:
--KlantNaam					KlantWoonplaats	DatumTijdAankoop		ProductNaam	Aantal	Stuksprijs	Totaalprijs	Load_DTS				Load_EndDTS				BatchNr
--Simchat Data Consulting	Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-01 00:00:00.000	2018-02-03 00:00:00.000	1
--St. Micha Data Consulting	Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-02 00:00:00.000	9999-12-31 00:00:00.000	2
SELECT * FROM dbo.HistoryTable

GO































-- DAG 4
UPDATE dbo.SourceTable
SET KlantNaam = 'Sigma Data Consulting' 
WHERE KlantNaam = 'St. Micha Data Consulting'

SELECT * FROM dbo.SourceTable



-- --------------------------------------------------------------------------
-- Implementeer logica om de staging area te vullen op basis van de brontabel
-- --------------------------------------------------------------------------
DECLARE @Load_DTS DATETIME2 = DATETIME2FROMPARTS(2018, 02, 04, 0, 0, 0, 0, 0)
DECLARE @BatchNr INT = 4



-- Hier jouw logica.





-- Verwachte uitkomst:
--KlantNaam					KlantWoonplaats	DatumTijdAankoop		ProductNaam	Aantal	Stuksprijs	Totaalprijs	Load_DTS				BatchNr
--Sigma Data Consulting		Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-04 00:00:00.000 4
SELECT * FROM dbo.StagingTable




-- ------------------------------------------------------------------------------
-- Implementeer logica om de historie-laag te vullen op basis van de staging area
-- ------------------------------------------------------------------------------


-- Hier jouw logica





-- Verwachte uitkomst:
--KlantNaam					KlantWoonplaats	DatumTijdAankoop		ProductNaam	Aantal	Stuksprijs	Totaalprijs	Load_DTS				Load_EndDTS				BatchNr
--Simchat Data Consulting	Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-01 00:00:00.000	2018-02-03 00:00:00.000	1
--St. Micha Data Consulting	Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-02 00:00:00.000	2018-02-04 00:00:00.000	2
--Sigma Data Consulting		Huizen			2018-02-01 00:00:00.000	Laptop		6		1250.0000	6000.0000	2018-02-04 00:00:00.000	9999-12-31 00:00:00.000	4
SELECT * FROM dbo.HistoryTable

GO



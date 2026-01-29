-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 countries.db
-- 2. Load this script: .read tasks.sql
-- 3. Exit SQLite: .exit

1. SELECT Continent, AVG(Population) AS [Average Population] FROM countries GROUP BY Continent;
2. SELECT Continent, SUM(Population) AS [Total Population] FROM countries GROUP BY Continent;
3. SELECT Continent, MAX(Population) AS [Largest Population], FROM countries GROUP BY Continent;
4. SELECT Continent, MIN(AreaSqMi) AS [Smallest Area], FROM countries GROUP BY Continent;
5. SELECT Continent, COUNT(*) AS [Total Nunber] FROM countries GROUP BY Continent;
6. SELECT Continent, AVG(GDPPerCapita) AS [Average GDP Per Capita] FROM countries GROUP BY Continent ORDER BY [Average GDP Per Cap.] DESC;
7. SELECT Country, Population FROM countries ORDER BY Population DESC LIMIT 5;
8. SELECT Country, InfantMortalityPer1000 FROM countries WHERE InfantMortalityPer1000 IS NOT NULL ORDER BY InfantMortalityPer1000 ASC LIMIT 5;
9. SELECT Continent, AVG(LiteracyPercent) AS [Average Literacy] FROM countries GROUP BY Continent ORDER BY [Average Literacy] ASC;
10. SELECT Continent, SUM(Population) AS [Highest Total Population] FROM countries GROUP BY Continent ORDER BY [Highest Total Pop.] DESC LIMIT 3;
11. SELECT Continent, AVG(Population) AS [Average Population] FROM countries WHERE Population > 10000000 GROUP BY Continent;
12. SELECT Continent, AVG(GDPPerCapita) AS [Average GDP Per Cap.] FROM countries WHERE LiteracyPercent > 80 GROUP BY Continent;
13. SELECT Continent, MAX(Birthrate) AS [Max Birthrate] FROM countries WHERE InfantMortalityPer1000 < 30 GROUP BY Continent;
14. SELECT Continent, AVG(GDPPerCapita) AS [Average GDP Per Cap.] FROM countries WHERE LiteracyPercent > 80 GROUP BY Continent HAVING AVG(GDPPerCapita) > 10000 ORDER BY [Average GDP Per Cap.] DESC;
15. SELECT Continent, SUM(Population) AS [Total Population] FROM countries WHERE Birthrate < 20 GROUP BY Continent HAVING SUM(Population) > 500000000 ORDER BY [Total Pop.] DESC LIMIT 3;

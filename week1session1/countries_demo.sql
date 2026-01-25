-- week 1, session 1
-- demo on countries.db
-- remember to load countries.db by typing sqlite3 countries.db

-- The following are examples of retrieving data with SELECT queries
-- (a) Basic SELECT queries
-- (1) select everything
.mode column -- to display data aligned
.headers on  -- display the headers

SELECT * FROM countries;

---(2) select everything from specific column(s)
SELECT Country FROM countries;
SELECT Country, Continent FROM countries;

---(3) select specific columns and rows with WHERE condition
SELECT Country, NetMigration from countries WHERE NetMigration>0;

---(4) select distinct values from a column with distinct keyword
SELECT distinct(Continent) from countries;

---(5) select rows with specific pattern in the data value with WHERE and LIKE keywords
---- % sign for any characters
---- _ for single character
SELECT Country from countries WHERE Country LIKE '%nited%';
SELECT distinct(Continent) from countries WHERE Continent LIKE '%Asia%';
SELECT Country from countries WHERE Country LIKE 'M%';

SELECT Country from countries WHERE Country LIKE 'S____';   -- starts with S and four characters after

---(6) SELECT with multiple WHERE conditions with AND, OR
SELECT Country, NetMigration, Population, LiteracyPercent FROM countries WHERE NetMigration<0 AND LiteracyPercent>50;
SELECT Country, AreaSqMi, PopDensityPerSqMi, GDPPerCapita, InfantMortalityPer1000 FROM Countries WHERE GDPPerCapita > 10000 OR InfantMortalityPer1000 >100;

------------------------------------------------------------------------------------------------------------------------------------------------------------

---(7) SELECT query with ordering with ORDER BY keyword
SELECT Country, Population FROM countries ORDER BY Population DESC;   -- default is ascending ie. ORDER BY Population

---- we can use ORDER BY with multiple conditions
SELECT Country, Population, Continent FROM countries ORDER BY Continent, Population DESC;

---(8) SELECT query with LIMIT keyword
SELECT Country, Population FROM countries ORDER BY Population DESC LIMIT 10;  -- only top 10 countries

--- can use LIMIT in other SELECT queries such as
SELECT * FROM countries LIMIT 5;

---(9) SELECT query with GROUP BY aggreation with COUNT, MIN, MAX, AVG, and SUM keyword
SELECT Country, AVG(LiteracyPercent), Continent FROM countries GROUP BY Continent;  -- average literacy percent in each continent
SELECT Continent, COUNT(Country) FROM countries GROUP BY Continent;  -- how many countries in each continent
SELECT Country, MAX(Population) from countries;   -- country with highest population
SELECT Country, MAX(Population), COntinent from countries GROUP BY Continent;  -- country with highest population in each continent
SELECT Country, MIN(LiteracyPercent) from countries;   -- country with lowest literacy percent
SELECT Continent, SUM(AreaSqMi) from countries GROUP BY Continent;   -- total square miles in each continent

--- (10) SELECT with As (alias) for retrieved data
SELECT Country, AVG(LiteracyPercent) As 'Average Literacy Percent', Continent FROM countries GROUP BY Continent;  -- average literacy percent in each continent
SELECT Continent, COUNT(Country) As TotalCountries FROM countries GROUP BY Continent;  -- how many countries in each continent

---(11) SELECT with GROUP BY and condition on the grouping with HAVING, HAVING is applied on the aggregation
SELECT Continent, SUM(Population) FROM countries GROUP BY Continent HAVING SUM(Population)>200000000;

---(12) SELECT with WHERE, GROUP BY, HAVING
---- Let's list all contries with NetMigration>0 and order by continent
SELECT Country, NetMigration, Continent from countries WHERE NetMigration>0 ORDER BY Continent;

---- we can to count how many countries with NetMigration>0 in each continent, we can double check this with previous query
SELECT Count(Country), Continent from countries WHERE NetMigration>0 GROUP BY Continent;
-- we can also use ORDER BY
SELECT Count(Country), Continent from countries WHERE NetMigration>0 GROUP BY Continent ORDER BY COUNT(Country);

---- We can further filter the results by only showing continent with more than 5 countries
SELECT Count(Country) As TotalCountries, Continent from countries WHERE NetMigration>0 GROUP BY Continent HAVING TotalCountries>5;
-- Task 2

-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 countries.db
-- 2. Load this script: .read task2.sql
-- 3. Exit SQLite: .exit


-- write your sql code here
1. SELECT Country FROM countries ORDER BY Population DESC LIMIT 10;
2. SELECT Country FROM countries ORDER BY AreaSqMi ASC LIMIT 5;
3. SELECT Country FROM countries WHERE Continent = 'Europe' ORDER BY AreaSqMi DESC LIMIT 1;
Country;
4. SELECT Country FROM countries WHERE Continent = 'Africa' ORDER BY AreaSqMi ASC LIMIT 3;
Country;
5. SELECT Country FROM countries ORDER BY LiteracyPercent LIMIT 5;
6. SELECT Country FROM countries WHERE Country LIKE 'C%' ORDER BY GDPPerCapita LIMIT 3;
Country;
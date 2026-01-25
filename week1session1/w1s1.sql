-- week 1, session 1

-- we learned about deriving relations from erd last semester
-- the next step is creating database tables from the relations

-- let's take slides 16 from week11-session2
-- Staff(staffNo, name, telNo, position) with primary key staffNo
-- Car(carRegNo, model, year, status, staffNo) with primary key from Staff as a foreign key

-- to create a database table in SQL, we use CREATE TABLE keyword, together with other keywords for
-- primary key, foreign keys, data types and so on. For sqlite database, refer to https://sqlite.org/docs.html

-- since we are using sqlite dbms, this is how the Staff and Car tables can be created
-- before we can create a table, we need to create a database first
-- sqlite3 demo.db on the terminal and you will be in sqlite prompt
-- then you have two options:
-- (1) type the following in the prompt to create the table
-- (2) run this sql file by typing .read w1s1.sql
CREATE TABLE Staff(staffNo TEXT primary key, name TEXT, telNo TEXT, position TEXT);

-- how do you check whether a table has been created in demo.db?
-- on the sqlite prompt, type .table and you will see all tables in the database
-- you can also see the table schema by typing 
-- (1) .schema - showing schema for all tables
-- (2) .schema Staff - showing schema for specific table


-- take note that sqlite is case insensitive in general
CREATE TABLE Car(carRegNo text primary key, model text, year integer, status text, staffNo text,
FOREIGN KEY (staffNo) REFERENCES Staff(staffNo));

-- after the tables have been created, you can then start inserting data into the tables
-- as well as (1) updating data (2) deleting data

-- let's insert some rows into Staff
INSERT INTO Staff VALUES('lbr1001', 'Keir Stalin', '1223334444', 'CEO');
INSERT INTO Staff VALUES('lbr2001', 'Gina Rayner', '1223335555', 'COO');
INSERT INTO Staff VALUES('lbr3001', 'Rachel Thieves', '1223336666', 'CFO');

-- we can retrieve everything in the table with a SELECT query
SELECT * FROM Staff;

-- to display the retrieved data in different format, you could set
.mode column -- each record is shown on a separate line with the data aligned in columns
.headers on -- display the header
-- for more details, refer https://sqlite.org/cli.html

-- let's insert some rows into Car
INSERT INTO Car VALUES('ABX001', 'Rolls-Royce Phantom', '2024', 'Assigned - Active', 'lbr1001');
INSERT INTO Car VALUES('ABX010', 'Bentley Continental GT', '2025', 'Assigned - Active', 'lbr2001');
INSERT INTO Car VALUES('ABX015', 'Aston Martin DB12', '2023', 'Assigned - Active', 'lbr3001');
INSERT INTO Car (carRegNo, model, year, status) VALUES('ABX020', 'Rolls-Royce Cullinan', '2024', 'Not assigned');
INSERT INTO Car (carRegNo, model, year, status) VALUES('ABX025', 'Bentley Mulliner Batur', '2025', 'Not assigned');

-- we can retrieve everything in the table with a SELECT query
SELECT * FROM Car;

-- we can then update
UPDATE Car SET year=2026 WHERE carRegNo='ABX020';

-- we can check if it's updated with a SELECT query
SELECT * FROM Car WHERE carRegNo='ABX020';

-- we can also delete
DELETE FROM Car WHERE carRegNo='ABX020';

-- avoid delete data from a table without WHERE condition unless you are really sure
--- DELETE FROM Staff;   -- unless you are sure to delete all rows from Staff

-- we can check if it's deleted with a SELECT query;
SELECT * FROM Car WHERE carRegNo='ABX020';  -- this or
SELECT * FROM Car;  -- this show everything in Car table

-- we can delete tables with DROP TABLE query
-- please be certain that you want to drop them
DROP TABLE Staff
DROP TABLE Car

-- in sqlite prompt, you want exit by typing .quit
-- in sqlite prompt, you want type .shell clear to clear screen
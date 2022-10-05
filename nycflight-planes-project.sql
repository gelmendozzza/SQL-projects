PART 1

--Select table for planes under nyc flight database
SELECT *
FROM planes;

--Built since 2000
SELECT * 
FROM planes
WHERE year >= 2000;

--Manufacturer is BOEING
SELECT *
FROM planes
WHERE manufacturer = 'BOEING';

--Built between 1980 and 1990
SELECT *
FROM planes
WHERE year BETWEEN 1980 AND 1990;

--Manufacturer is either CESSNA, BOEING or AIRBUS
SELECT *
FROM planes
WHERE manufacturer IN('CESSNA', 'BOEING', 'AIRBUS');

--year field is unknown
SELECT *
FROM planes
WHERE year IS NULL;

--speed field isn't unknown
SELECT *
FROM planes
WHERE speed IS NOT NULL;

--Do not seat between 50 and 200
SELECT *
FROM planes
WHERE seats NOT BETWEEN 50 AND 200;

--engine field starts with Turbo
SELECT *
FROM planes
WHERE engine ILIKE 'Turbo%';

--model name is in the format XXX-XXX
SELECT *
FROM planes
WHERE model LIKE '___-___';

--built before 1980 and seat more than 100
SELECT *
FROM planes
WHERE year < 1980
AND seats > 100;

--built after 2000 or have a 'reciprocating' engine
SELECT *
FROM planes
WHERE year > 2000
OR engine = 'Reciprocating';

--built between 1980 and 1990, are not 'two-engine' planes, 
--have a nonmissing value for speed
--and were either manufactured by BOEING or CESSNA
SELECT *
FROM planes
WHERE year BETWEEN 1980 AND 1990
	AND engines != 2
	AND speed IS NOT NULL
AND manufacturer IN ('BOEING', 'CESSNA');

--Either built between 1980 and 1990, 
--and are not 'two-engine' planes,
--and have a nonmissing value for speed,
--or were manufactured by either 'BOEING' or 'CESSNA'
SELECT *
FROM planes
WHERE year BETWEEN 1980 AND 1990
	AND (engines != 2
	AND speed IS NOT NULL)
OR manufacturer IN ('BOEING', 'CESSNA');

--Both built between 1980 and 1990,
--and are not two-engine planes,
--and also have non-missing values for speed
--or were manufactured either by 'BOEING' or 'CESSNA'
SELECT *
FROM planes
WHERE year BETWEEN 1980 AND 1990
	AND engines != 2 
	AND (speed IS NOT NULL
OR manufacturer IN ('BOEING', 'CESSNA'));

PART 2

--Return all records, sorted from oldest to newest by year
SELECT *
FROM planes
ORDER BY year;

--Return all records, sorted from Z to A by manufacturer
SELECT *
FROM planes
ORDER BY manufacturer DESC;

--Return all records, sorted oldest to newest,
--then by manufacturer, then by model both A-Z
SELECT *
FROM planes
ORDER BY year, manufacturer, model;

--Return all records, sorted low to high by engines,
--then high to low by seats
SELECT *
FROM planes
ORDER BY engines, seats DESC;

--Return all records of planes built before 2000, 
--sorted A-Z by engine
SELECT *
FROM planes
WHERE year < 2000
ORDER BY engine;

--Return the top 10 records, sorted high to low by seats.
--Return the top 10 records of planes built before 1990,
--sorted high ti low by seats
SELECT *
FROM planes
WHERE year < 1990
ORDER BY seats DESC
LIMIT 10;

--Count the number of all records, the number of speed records,
-- and the number of year records. Name these fields
--count_total, count_speed and coun_year
SELECT COUNT(*) AS count_total, 
	COUNT(speed) AS count_speed,
	COUNT(year) AS count_year
FROM planes;

--Count the number of speed records where year
--is before 1980.
SELECT COUNT(speed) AS count_speed
FROM planes
WHERE year < 1980;

--List the distinct values for the engine field
SELECT DISTINCT engine
FROM planes;

--List the distinct values of combinations for year,
--manufacturer, and model, sorted by manufacturer A-Z,
--then year oldest to newest, and then model A-Z
SELECT DISTINCT year, manufacturer, model
FROM planes
ORDER BY manufacturer, year, model;


PART 3

--How many unique values of type are there?
SELECT COUNT(DISTINCT type)
FROM planes;

--How many records are there for year 2004
SELECT COUNT(*)
FROM planes
WHERE year = 2004;

--How many records for engine 'Turbo-jet' are there?
SELECT COUNT(*)
FROM planes
WHERE engine = 'Turbo-jet';

--Which type of engine has the most records
SELECT engine, COUNT(engine)
FROM planes
GROUP BY engine;

--How many years is the BOEING manufacturer and the 757-222
--model in the database
SELECT COUNT(DISTINCT year)
FROM planes
WHERE model = '757-222'
	AND manufacturer = 'BOEING';
					
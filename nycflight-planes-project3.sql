--Select planes dataset from nycflight13 database
SELECT *
FROM planes
LIMIT 10;

--How many unuqie values of type are there?
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
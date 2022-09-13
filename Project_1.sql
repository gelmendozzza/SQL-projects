--Select table for planes under nycflight 13 database
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
					
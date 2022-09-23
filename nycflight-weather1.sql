--Select weather table from nycflight13 database
SELECT *
FROM weather
LIMIT 10;

--What is the average temperature for month 10?
--Round to a whole number
SELECT ROUND(AVG(temp),0) avg_temp
FROM weather
WHERE month = 10;

--Which origin had the highest total precip
SELECT origin, MAX(precip)
FROM weather
GROUP BY origin;

--Which day has following statistics
--avg temp: 39.0675, min temp: 32, max temp: 46.04
SELECT month, day, ROUND(AVG(temp),4) as avg_temp, 
ROUND(MIN(temp),0) min_temp, ROUND(max(temp),2) max_temp
FROM weather
GROUP BY month, day
ORDER BY month, day;

--Find the minimum visibility recorded for each origin 
--and month, sorted low to high. What is the minimum
--visibility of the fifth record
SELECT origin, month, MIN(visib) min_visib
FROM weather
GROUP BY origin, month
ORDER BY min_visib;

--Find the minimum visibility recorded for each origin and
--month, sorted high to low. What is the minimum visibility
--of the sixth record
SELECT origin, month, min(visib) min_visib
FROM weather
GROUP BY origin, month
ORDER BY min_visib DESC;
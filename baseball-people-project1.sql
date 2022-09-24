--Select people tables from baseball database
SELECT *
FROM people
LIMIT 5;

--Find the average height of players born after 1950 for
--each birthcountry, sorted from high to low. Query should 
--only include countries who have a max height <=75 inches
SELECT ROUND(AVG(height),2) avg_height, birthcountry
FROM people
WHERE birthyear > 1950
GROUP BY birthcountry
HAVING MAX(height) <= 75
ORDER BY avg_height DESC;

--For each birth year, find the average weight of players
--who both bat and throw with their left hand. Keep only
--the birth years where the average weight is greated than
--200.
SELECT birthyear, ROUND(avg(weight),2) avg_weight
FROM people
WHERE bats = 'L' and throws = 'L'
GROUP BY birthyear
HAVING AVG(weight) > 200;

--Which batting hand has the highest average height for 
--all players weighing over 200 pounds?
SELECT ROUND(AVG(height),2), bats
FROM people
WHERE weight > 200
GROUP BY bats;

--What is the average weight for all players who are born 
--in the USA and bat left-handed, rounded to the nearest
--whole number
SELECT ROUND(AVG(weight),0) avg_weight, birthcountry, bats
FROM people
WHERE birthcountry = 'USA'
GROUP BY birthcountry, bats
HAVING bats = 'L';

--For all players who have the first name of 'David', what
--is the height of the tallest player?
SELECT namefirst, MAX(height) max_height
FROM people
WHERE namefirst = 'David'
GROUP BY namefirst;
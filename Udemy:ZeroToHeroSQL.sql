-- SQL Assessment # 2 from Udemy Course: The Complete SQL Bootcacamp
-- 2022: Go from zero to hero

--Retrieve all the information from facilities table?
SELECT * FROM cd.facilities;

--Print out a list of all of the facilities and their 
--cost to members. How would you retrieve a list of 
--only facility names and costs?
SELECT name, membercost
FROM cd.facilities;

--Produce a list of facilities that charge a fee 
--to members? 
SELECT * 
FROM cd.facilities
WHERE membercost != 0;

--Produce a list of facilities that charge a fee to 
--members, and that fee is less than 1/50th of the 
--monthly maintenance cost? Return the facid,
--facility name, member cost and monthly maintenance
--of the facilities in question
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0
AND membercost < (monthlymaintenance/50.0);

--Produce a list of all facilities with the word 
--'Tennis' in their name
SELECT *
FROM cd.facilities
WHERE name LIKE '%Tennis%';

--Retrieve the details of facilities with ID1 and 5? 
SELECT *
FROM cd.facilities
WHERE facid IN (1,5);

--Produce a list of members who joined after the 
--start of September 2012? Return the memid, surname,
--firstname, joindate of the members in question
SELECT *
FROM cd.members;

SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate > '2012-09-01';

--Produce an ordered list of all the first 10 surnames
--in the members table? List must not contain duplicates
SELECT DISTINCT surname
FROM cd.members
ORDER BY surname
LIMIT 10;

--Get the signup date of your last member
SELECT MAX(joindate)
FROM cd.members;


--Produce a count of the number of facilities that
--have a cost to guest of 10 or more
SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >= 10;

--Produce a list of the total number of slots bookes
--per facility in the month of September 2012. Produce
--an ouput table consisting of facility id and slots,
--sorted by the number of slots
SELECT facid, SUM(slots) number_of_slots
FROM cd.bookings
WHERE starttime BETWEEN '2012-09-01' AND '2012-10-01'
GROUP BY facid
ORDER BY number_of_slots;

--Produce a list of facilities with more than 1000
--slots booked. Produce an output table consisting
--of facility ID and total slots, sorted by facilityID
SELECT facid, SUM(slots) total_slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) >= 1000
ORDER BY facid;

--Produce a list of the start times for bookings
--for tennis courts, for the date '2012-09-21'?
--Return a list of start times and facility name pairings,
--order by the time
SELECT cd.bookings.starttime AS start, 
cd.facilities.name
FROM cd.bookings 
INNER JOIN cd.facilities 
ON cd.bookings.facid = cd.facilities.facid
WHERE cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime < '2012-09-22'
AND cd.facilities.name ILIKE '%Tennis Court%'
ORDER BY cd.bookings.starttime;

--Produce a list of the start times for bookings
--by members named 'David Farrell'
SELECT cd.bookings.starttime, cd.members.surname,
cd.members.firstname
FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid
WHERE cd.members.surname = 'Farrell'
AND cd.members.firstname = 'David';

-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS

-- writing a comment like this

-- selecting all columns from the crime scene report
--
--SELECT * FROM crime_scene_report;
--get the crime scene report
SELECT *
FROM crime_scene_report
WHERE date = 20180115
  AND type = 'murder'
  AND city = 'SQL City';


  --find person who lives at last house on Northwestern Dr.

  SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

--find annabelle witness 2 on Franklin Ave

SELECT *
FROM person
WHERE name LIKE 'Annabel%'
  AND address_street_name = 'Franklin Ave';

--witness 1 id 14887
--witness 2 id 16371

--read interview from witness 1 using person id
SELECT *
FROM interview
WHERE person_id = 14887 --I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".

;

--read interview from witness 2 using person id
SELECT *
FROM interview
WHERE person_id = 16371 --I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

;
--find the gym member with the clue member numer starting with "48Z"

SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%';
--gotta be a gold member that eliminiates 2. Joe and Jeremey are only suspects

--check date of Check in. 20180109
SELECT * FROM get_fit_now_check_in;

SELECT * FROM get_fit_now_check_in WHERE check_in_date = 20180109 

--48Z55 and 48Z7A are the only members that fit
--check if either are joe or jeremy
SELECT id, name
	FROM get_fit_now_member
	WHERE name LIKE 'Joe%'
	OR name LIKE 'Jer%';      ----They both match ugggh!
     
     --find everyone name joe or jeremy lcense id 
     SELECT * FROM person WHERE  
	 name LIKE 'Joe%'
	OR name LIKE 'Jeremy%';

    --license plate to get license id
    Select * FROM drivers_license
	WHERE plate_number LIKE '%H42W%';
--423327
--664760  ---there were 3 and i eliminated the female. now check for mame that goes with the id number
   
   Select * FROM person
	WHERE license_id = 423327
	OR license_id  = 664760 ;

    --The names that came up are Tushar and Jeremy and by
    --previous searches we know the name of the killer is Jeremy!

    --THE NAME OF THE KILLER IS JEREMY BOWERS!!!!!!
    --67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279







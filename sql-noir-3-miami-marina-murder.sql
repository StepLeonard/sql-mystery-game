-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

  --A body was found floating near the docks of Coral Bay Marina 
  --in the early hours of August 14, 1986. Your job, detective, 
  --is to find the murderer and bring them to justice. 
  --This case might require the use of JOINs, wildcard searches, and logical deduction. Get to work, detective.

--get the crime scene report for the date and location. 19860814 Coral Bay Marina 

SELECT * FROM crime_scene
WHERE date = 19860814 AND location = 'Coral Bay Marina';

--id 43. The body of an unidentified man was found near the docks.
--Two people were seen nearby: one who lives on 300ish "Ocean Drive"
-- and another whose first name ends with "ul" and his last name ends with "ez".

--check for persons name ending in ez. 

SELECT * FROM person
WHERE name LIKE '%ez' ;

--only 1 person with ul and ez: 102	Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave

--find who lives at Ocean Drive

SELECT * FROM person
WHERE address LIKE '% Ocean Drive' ;

---the only person at 300 something ocean drive is
--101	Carlos Mendez	Los Ojos	Fisherman	369 Ocean Drive
--check interview with person id
SELECT * FROM interviews
WHERE person_id = 101 OR person_id = 102 ;
--I saw someone check into a hotel on August 13. The guy looked nervous.
--I heard someone checked into a hotel with "Sunset" in the name.
--Check hotel name and check in date
SELECT *
FROM hotel_checkins
WHERE check_in_date = 19860813
  AND hotel_name LIKE '%Sunset%';

  --now match the hotel chedkins to surveillance. JOIN
  SELECT *
FROM hotel_checkins
INNER JOIN surveillance_records
ON hotel_checkins.id = surveillance_records.hotel_checkin_id
WHERE hotel_checkins.check_in_date = 19860813
  AND hotel_checkins.hotel_name LIKE '%Sunset%';

--take out null rows
  --AND surveillance_records.suspicious_activity IS NOT NULL;

SELECT *
FROM hotel_checkins
INNER JOIN surveillance_records
ON hotel_checkins.id = surveillance_records.hotel_checkin_id
WHERE hotel_checkins.check_in_date = 19860813
  AND hotel_checkins.hotel_name LIKE '%Sunset%'
  AND surveillance_records.suspicious_activity IS NOT NULL;

  --looked at suspicious activity the only "suspicious" thing was
  --28	33	Sunset Crest Hotel	19860813	157	157	28	Broke the vending machine

--now find out with the id who that person is
SELECT *
FROM person
WHERE id = 157;
--157	Arthur Long	The Axe	Lumberjack	27 Shell Bay
--NO THATS NOT THE PERSON! 
--THE ID IS 33.
SELECT *
FROM person
WHERE id = 157; --Donald Cook broke the vending machine. its not him!

--look in confessions for "I did it" -- get name
SELECT person.name, confessions.confession
FROM confessions
JOIN person
ON person.id = confessions.person_id

WHERE confessions.confession LIKE '%I did it%';

--Thomas Brown	Alright! I did it. I was paid to make sure he never left the marina alive.

--THE KILLER IS THOMAS BROWN!!!!!


-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?


--- tind the crime scene location form the crime_scene 
SELECT *
FROM crime_scene
WHERE location = 'Blue Note Lounge'
-- man with scar on left cheek

--find the suspects that match the attire trenchcoat

SELECT *
FROM suspects
WHERE attire LIKE '%trench%';

--Frank Lombardi and Vincent Malone both have scars on left cheek and wore trenchcoats
--ID 3 and 183

--choose from interview to show interviews with suspect id
SELECT *
FROM interviews
WHERE suspect_id = 3 OR suspect_id = 183;

--the transcript shows suspect_id 183 confessess. id 183 is Vincent Malone
---VINCENT MALONE IS THE THEIF!

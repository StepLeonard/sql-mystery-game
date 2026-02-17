-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

-- West Hollywood Records store /// July 15, 1983,

--find the date and location of the crime_scene
SELECT * FROM crime_scene WHERE date = 19830715 AND location = 'West Hollywood Records';

--A prized vinyl record was stolen from the store during a busy evening.
--Id 65

-- see clues from witnesses with id 65
SELECT * FROM witnesses WHERE crime_scene_id = 65;

--The main thing I remember is that he had a distinctive gold watch on his wrist.
--I saw a man wearing a red bandana rushing out of the store.

--check for suspects with red bandana and gold watch

SELECT * FROM suspects  WHERE bandana_color = 'red' AND accessory = 'gold watch';
--35	Tony Ramirez	red	gold watch
--44	Mickey Rivera	red	gold watch
--97	Rico Delgado	red	gold watch

--now check the interviews with the suspect id's

SELECT * FROM interviews WHERE suspect_id = 35 OR suspect_id = 44 OR suspect_id = 97;

--The transcrip says suspect 97 confesses. 97	I couldn't help it. I snapped and took the record.
--suspect 97 is Rico Delgado



--RICO DELGADO IS THE THEIF!

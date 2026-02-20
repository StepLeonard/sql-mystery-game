-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

---get all the cofessions with names
SELECT guest.name, final_interviews.confession
FROM final_interviews
JOIN guest
ON guest.id = final_interviews.guest_id

--now look in confessions for someone who "stole" or 'took' it or said "i did it"
--add this the query above
SELECT guest.name, final_interviews.confession
FROM final_interviews
JOIN guest
ON guest.id = final_interviews.guest_id
WHERE final_interviews.confession LIKE '% stole %' OR final_interviews.confession LIKE '% took %'
OR final_interviews.confession LIKE '% I did it %';;



--Mike Manning	I was the one who took the crystal. I guess I need a lawyer now?

---WE HAVE A CONFESSION!  MIKE MANNING STOLE IT !!!!

---YOU CAN SOLVE THIS IN ONE QUERY!

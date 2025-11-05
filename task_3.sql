SELECT Location
FROM Ground
WHERE MatchID = 'M03';

-- Expected Result:
-- Location
-- ----------
-- Nellai


-- ======================================================
-- 3.2 Retrieve players whose first name starts with 'A'
-- ======================================================
SELECT *
FROM Player
WHERE FName LIKE 'A%';

-- Expected Result:
-- Players: Amar, Akash, Arun


-- ======================================================
-- 3.3 Add columns Batting and Bowling in Player table
-- ======================================================
ALTER TABLE Player ADD Batting VARCHAR2(10);
ALTER TABLE Player ADD Bowling VARCHAR2(10);

-- Both columns successfully added.


-- ======================================================
-- 3.4 Count the number of right-hand batsmen in all teams
-- ======================================================
SELECT COUNT(*) AS RightHand_Batsmen
FROM Player
WHERE Batting = 'right-hand';

-- Expected Result:
-- RIGHTHAND_BATSMEN
-- -----------------
-- 9


-- ======================================================
-- 3.5 Display CricketBoard details for selected BoardIDs
-- ======================================================
SELECT *
FROM CricketBoard
WHERE BoardID IN ('BID01', 'BID03', 'BID06');

-- Expected Result:
-- BID01 – Chennai Cricket Board
-- BID03 – Viluppuram Cricket Board
-- BID06 – Tuticorin Cricket Board


-- ======================================================
-- 3.6 Select names and IDs of players who are left-hand bowlers
-- ======================================================
SELECT PlayerID, FName, LName
FROM Player
WHERE Bowling = 'left-hand';

-- Expected Result:
-- PlayerID | FName   | LName
-- ---------+---------+-------
-- 1        | Raj     | N
-- 18       | Kishore | K
-- 1        | Prem    | V


-- ======================================================
-- 3.7 Find UmpireID of umpires who have NOT umpired any match
-- ======================================================
SELECT a.UmpireID
FROM Umpire a
WHERE a.UmpireID NOT IN (SELECT UmpireID FROM Umpire_Umpired);

-- Expected Result:
-- UmpireID
-- ---------
-- UID03


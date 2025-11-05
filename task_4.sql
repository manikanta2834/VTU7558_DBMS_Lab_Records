-- ======================================================
-- 4.1 Retrieve all team details including count of winning matches
-- ======================================================

SELECT 
    t.TeamID,
    t.Name AS TeamName,
    t.Coach,
    t.Captain,
    (
        SELECT COUNT(m.MatchID)
        FROM Match m
        WHERE t.TeamID = SUBSTR(m.Result, 1, 5)
    ) AS WinningMatchCount
FROM Team t;

-- Expected Output:
-- Displays each team with number of matches won.


-- ======================================================
-- 4.2 Retrieve total number of 'Tie' matches in a team-wise manner
-- ======================================================

SELECT 
    t.TeamID,
    t.Name AS TeamName,
    (
        SELECT COUNT(m.MatchID)
        FROM Match m
        WHERE (t.TeamID = m.TeamID1 OR t.TeamID = m.TeamID2)
        AND INSTR(m.Result, 'Tie') > 0
    ) AS TieCount
FROM Team t
GROUP BY t.TeamID, t.Name;

-- Expected Output:
-- Lists each team with number of tied matches.


-- ======================================================
-- 4.3 Retrieve team details who won the matches
-- ======================================================

SELECT *
FROM Team t
WHERE t.TeamID IN (
    SELECT TeamID1 FROM Match WHERE INSTR(Result, TeamID1) > 0
    UNION
    SELECT TeamID2 FROM Match WHERE INSTR(Result, TeamID2) > 0
);

-- Expected Output:
-- Teams that appear in match results as winners.


-- ======================================================
-- 4.4 Retrieve players and match details of players above 25 years old
-- ======================================================

SELECT 
    p.PlayerID,
    p.FName,
    p.LName,
    p.Age,
    m.MatchID,
    m.Match_Date,
    m.Time1,
    m.Result
FROM Player p, Match m
WHERE p.Age > 25
AND (p.TeamID = m.TeamID1 OR p.TeamID = m.TeamID2);

-- Expected Output:
-- Lists player info with match details for players older than 25.


-- ======================================================
-- 4.5 Retrieve details of teams who have NOT played any matches
-- ======================================================

SELECT 
    t.TeamID,
    t.Name AS TeamName,
    t.Coach,
    t.Captain
FROM Team t
WHERE t.TeamID NOT IN (
    SELECT TeamID1 FROM Match
    UNION
    SELECT TeamID2 FROM Match
);

-- Expected Output:
-- Teams with no recorded matches.


-- ======================================================
-- 4.6 Retrieve teamid, boardid, teamname, and playername for a given playerid
-- ======================================================

SELECT 
    t.TeamID,
    t.BoardID,
    t.Name AS TeamName,
    p.FName AS PlayerName
FROM Team t
JOIN Player p ON t.TeamID = p.TeamID
WHERE p.PlayerID = '66';

-- Expected Output:
-- Shows team and player details for PlayerID = 66

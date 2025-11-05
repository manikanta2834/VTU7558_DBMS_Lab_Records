-- ======================================================
-- 6.1 PL/SQL Block: Calculate average age of players
-- ======================================================

DECLARE
    total_age NUMBER := 0;
    num_players NUMBER := 0;
    avg_age NUMBER := 0;
BEGIN
    -- Using a cursor to loop through all players
    FOR player_rec IN (SELECT Age FROM Player) LOOP
        total_age := total_age + player_rec.Age;  -- Summing up ages
        num_players := num_players + 1;           -- Counting players
    END LOOP;

    -- Calculating the average
    IF num_players > 0 THEN
        avg_age := total_age / num_players;
    END IF;

    -- Displaying results
    DBMS_OUTPUT.PUT_LINE('Total Players: ' || num_players);
    DBMS_OUTPUT.PUT_LINE('Total Age: ' || total_age);
    DBMS_OUTPUT.PUT_LINE('Average Age: ' || CEIL(avg_age));
END;
/
-- Expected Output:
-- Total Players: 14
-- Total Age: 342
-- Average Age: 24


-- ======================================================
-- 6.2 PL/SQL Block: Insert a new player record into Player table
-- ======================================================

DECLARE
    v_PlayerID    VARCHAR2(6) := '&PlayerID';
    v_TeamID      VARCHAR2(10) := '&TeamID';
    v_FName       VARCHAR2(30) := '&FName';
    v_LName       VARCHAR2(30) := '&LName';
    v_Age         NUMBER(5,2) := &Age;
    v_DateofBirth DATE := TO_DATE('&DOB', 'DD-Mon-YYYY');
    v_PlayingRole VARCHAR2(25) := '&PlayingRole';
    v_Email       VARCHAR2(40) := '&Email';
    v_Contact_No  NUMBER := &Phone;
    v_Batting     VARCHAR2(10) := '&Batting';
    v_Bowling     VARCHAR2(10) := '&Bowling';
BEGIN
    INSERT INTO Player
    (PlayerID, TeamID, FName, LName, Age, DateofBirth, PlayingRole, Email, Contact_No, Batting, Bowling)
    VALUES
    (v_PlayerID, v_TeamID, v_FName, v_LName, v_Age, v_DateofBirth, v_PlayingRole, v_Email, v_Contact_No, v_Batting, v_Bowling);
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Player record inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/
-- Example Input:
-- PlayerID: 676 | TeamID: CCB01 | Name: Rahul Sharma | Age: 23 | DOB: 17-Jul-1999
-- PlayingRole: AllRounder | Email: rahulsharma@gmail.com | Contact: 9797181815
-- Output: Player record inserted successfully.


-- ======================================================
-- 6.3 Function: Return total number of teams in a Cricket Board
-- ======================================================

CREATE OR REPLACE FUNCTION GetTotalTeamsInBoard(BoardID1 VARCHAR2)
RETURN NUMBER
IS
    v_TotalTeams NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_TotalTeams
    FROM Team
    WHERE BoardID = BoardID1;

    RETURN v_TotalTeams;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN -1;  -- Indicates an error
END GetTotalTeamsInBoard;
/

-- Testing the function
DECLARE
    res NUMBER;
BEGIN
    res := GetTotalTeamsInBoard('BID01');
    DBMS_OUTPUT.PUT_LINE('No of teams: ' || res);
END;
/
-- Expected Output: No of teams: 2


-- ======================================================
-- 6.4 Procedure: Retrieve even-numbered PlayerIDs
-- ======================================================

CREATE OR REPLACE PROCEDURE GetEvenNumberedPlayerIDs IS
BEGIN
    FOR player_rec IN (
        SELECT PlayerID
        FROM Player
        WHERE MOD(TO_NUMBER(PlayerID), 2) = 0
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Even-Numbered PlayerID: ' || player_rec.PlayerID);
    END LOOP;
END GetEvenNumberedPlayerIDs;
/
-- Execute the procedure
EXEC GetEvenNumberedPlayerIDs;
/
-- Expected Output:
-- Even-Numbered PlayerID: 102
-- Even-Numbered PlayerID: 12
-- Even-Numbered PlayerID: 18
-- Even-Numbered PlayerID: 2
-- Even-Numbered PlayerID: 62
-- Even-Numbered PlayerID: 66
-- Even-Numbered PlayerID: 676


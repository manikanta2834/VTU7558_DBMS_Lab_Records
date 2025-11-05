-- =====================================================
-- 1. CricketBoard Table (Derived from FD: BoardID → Name, Address, Contact_No)
-- =====================================================
CREATE TABLE CricketBoard (
    BoardID      VARCHAR2(10) PRIMARY KEY,
    Name         VARCHAR2(50) NOT NULL,
    Address      VARCHAR2(50),
    Contact_No   NUMBER(15)
);


-- =====================================================
-- 2. CricketTeam Table (Derived from FD: TeamID → TName, Coach, Captain)
-- =====================================================
CREATE TABLE CricketTeam (
    TeamID   VARCHAR2(10) PRIMARY KEY,
    TName    VARCHAR2(50) NOT NULL,
    Coach    VARCHAR2(50),
    Captain  VARCHAR2(50),
    BoardID  VARCHAR2(10),
    FOREIGN KEY (BoardID) REFERENCES CricketBoard(BoardID)
);


-- =====================================================
-- 3. CricketPlayer Table (Derived from FD: PlayerID → PFName, PLName, etc.)
-- =====================================================
CREATE TABLE CricketPlayer (
    PlayerID      VARCHAR2(10) PRIMARY KEY,
    TeamID        VARCHAR2(10),
    PFName        VARCHAR2(30),
    PLName        VARCHAR2(30),
    Age           NUMBER(3),
    PDateOfBirth  DATE,
    PlayingRole   VARCHAR2(25),
    Email         VARCHAR2(50),
    Contact_No    NUMBER(15),
    Batting       VARCHAR2(20),
    Bowling       VARCHAR2(20),
    FOREIGN KEY (TeamID) REFERENCES CricketTeam(TeamID)
);


-- =====================================================
-- 4. CricketGround Table (Derived from FD: GroundID → GName, Location, Capacity)
-- =====================================================
CREATE TABLE CricketGround (
    GroundID  VARCHAR2(10) PRIMARY KEY,
    GName     VARCHAR2(50),
    Location  VARCHAR2(50),
    Capacity  NUMBER
);


-- =====================================================
-- 5. CricketMatch Table (Derived from FD: MatchID → Match_Date, Time1, Result, GroundID)
-- =====================================================
CREATE TABLE CricketMatch (
    MatchID     VARCHAR2(10) PRIMARY KEY,
    TeamID      VARCHAR2(10),
    Match_Date  DATE,
    Time1       VARCHAR2(20),
    Result      VARCHAR2(50),
    GroundID    VARCHAR2(10),
    FOREIGN KEY (TeamID) REFERENCES CricketTeam(TeamID),
    FOREIGN KEY (GroundID) REFERENCES CricketGround(GroundID)
);


-- =====================================================
-- 6. CricketUmpire Table (Derived from FD: UmpireID → UFName, ULName, etc.)
-- =====================================================
CREATE TABLE CricketUmpire (
    UmpireID      VARCHAR2(10) PRIMARY KEY,
    UFName        VARCHAR2(30),
    ULName        VARCHAR2(30),
    UAge          NUMBER(3),
    UDateOfBirth  DATE,
    Country       VARCHAR2(40),
    UEmail        VARCHAR2(50),
    UContact_No   NUMBER(15)
);


-- =====================================================
-- 7. MatchVenue Table (To remove transitive dependency: MatchID → GroundID)
-- =====================================================
CREATE TABLE MatchVenue (
    MatchID   VARCHAR2(10),
    GroundID  VARCHAR2(10),
    PRIMARY KEY (MatchID, GroundID),
    FOREIGN KEY (MatchID) REFERENCES CricketMatch(MatchID),
    FOREIGN KEY (GroundID) REFERENCES CricketGround(GroundID)
);


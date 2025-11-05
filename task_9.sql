// ==========================================
// CREATE NODES
// ==========================================

// Create CricketBoard Node
CREATE (cb:CricketBoard {
    BoardID: 'BID01',
    Name: 'Chennai Cricket Board',
    Address: 'Chennai',
    Phone: 9988776699
})
RETURN cb;


// Create Team Nodes
CREATE (t1:Team {
    TeamID: 'CCB01',
    BoardID: 'BID01',
    Name: 'ABS EXPRESS',
    Coach: 'G.D.RAMESH',
    Captain: 'SAMPATH KUMAR'
})
RETURN t1;

CREATE (t2:Team {
    TeamID: 'CCB02',
    BoardID: 'BID01',
    Name: 'AVG EXPRESS',
    Coach: 'T.KARTHIKH',
    Captain: 'Y.JOHN'
})
RETURN t2;


// Create Player Nodes
CREATE (p1:Player {
    PlayerID: '1',
    TeamID: 'CCB01',
    Name: 'Raj',
    Age: 23,
    DateOfBirth: '29-JUN-1996',
    PlayingRole: 'Bowler',
    Email: 'rajn@gmail.com'
})
RETURN p1;

CREATE (p2:Player {
    PlayerID: '33',
    TeamID: 'CCB01',
    Name: 'Anand',
    Age: 23,
    DateOfBirth: '02-JAN-1999',
    PlayingRole: 'Batsman',
    Email: 'balajid@gmail.com'
})
RETURN p2;

CREATE (p3:Player {
    PlayerID: '65',
    TeamID: 'CCB02',
    Name: 'Suresh',
    Age: 27,
    DateOfBirth: '02-JUN-1996',
    PlayingRole: 'Batsman',
    Email: 'sureshd@gmail.com'
})
RETURN p3;

CREATE (p4:Player {
    PlayerID: '75',
    TeamID: 'CCB02',
    Name: 'Rohit',
    Age: 33,
    DateOfBirth: '02-JUN-1991',
    PlayingRole: 'Batsman',
    Email: 'srohit@gmail.com'
})
RETURN p4;


// ==========================================
// CREATE RELATIONSHIPS
// ==========================================

// CricketBoard → Teams
MATCH (cb:CricketBoard {BoardID: 'BID01'}), (t1:Team {TeamID: 'CCB01'})
CREATE (cb)-[:HAS]->(t1)
RETURN cb, t1;

MATCH (cb:CricketBoard {BoardID: 'BID01'}), (t2:Team {TeamID: 'CCB02'})
CREATE (cb)-[:HAS]->(t2)
RETURN cb, t2;


// Players → Teams
MATCH (p1:Player {PlayerID: '1'}), (t1:Team {TeamID: 'CCB01'})
CREATE (p1)-[:PLAYS_FOR]->(t1)
RETURN p1, t1;

MATCH (p2:Player {PlayerID: '33'}), (t1:Team {TeamID: 'CCB01'})
CREATE (p2)-[:PLAYS_FOR]->(t1)
RETURN p2, t1;

MATCH (p3:Player {PlayerID: '65'}), (t2:Team {TeamID: 'CCB02'})
CREATE (p3)-[:PLAYS_FOR]->(t2)
RETURN p3, t2;

MATCH (p4:Player {PlayerID: '75'}), (t2:Team {TeamID: 'CCB02'})
CREATE (p4)-[:PLAYS_FOR]->(t2)
RETURN p4, t2;


// ==========================================
// DISPLAY ALL NODES
// ==========================================
MATCH (n) RETURN n;


// ==========================================
// RETRIEVE PARTICULAR PLAYER DETAILS
// ==========================================
MATCH (p:Player {PlayerID: '33'}) RETURN p;


// ==========================================
// UPDATE A PLAYER’S DETAILS
// ==========================================
MATCH (p:Player {PlayerID: '1'})
SET p.Age = 27
RETURN p;


// ==========================================
// DELETE A PARTICULAR PLAYER FROM THE TEAM
// ==========================================
MATCH (p:Player {PlayerID: '33'}) DELETE p;


// ==========================================
// RESULT
// ==========================================
// Thus, CRUD operations like creating, inserting, querying, 
// finding, updating, and deleting nodes and relationships 
// in Neo4j Graph Database have been successfully performed.
// ==========================================

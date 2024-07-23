CREATE TABLE Constituency (
    C_id INT PRIMARY KEY,
    C_name VARCHAR(100),
    district VARCHAR(100),
    localbody VARCHAR(100)
);
CREATE TABLE Voter (
    Voterid INT PRIMARY KEY,
    aadhar_no VARCHAR(12),
    fname VARCHAR(50),
    lname VARCHAR(50),
    DOB DATE,
    house_no VARCHAR(10),
    house_name VARCHAR(100),
    street VARCHAR(100),
    ballot_paper INT,
    C_id INT,
    Voter_CAND VARCHAR(1),
    FOREIGN KEY (C_id) REFERENCES Constituency(C_id)
);

CREATE TABLE Candidate (
    Candidate_id SERIAL PRIMARY KEY,
    Voterid INT,
    no_candidate INT,
    no_voters INT,
    party VARCHAR(100),
    symbol VARCHAR(100),
    FOREIGN KEY (Voterid) REFERENCES Voter(Voterid)
);


INSERT INTO Constituency (C_id, C_name, district, localbody)
VALUES
    (1, 'Constituency A', 'District X', 'Local Body 1'),
    (2, 'Constituency B', 'District Y', 'Local Body 2'),
    (3, 'Constituency C', 'District Z', 'Local Body 3');

-- Insert values into Voter table
INSERT INTO Voter (Voterid, aadhar_no, fname, lname, DOB, house_no, house_name, street, ballot_paper, C_id, Voter_CAND)
VALUES
    (1, '123456789012', 'John', 'Doe', '1990-05-15', '123', 'Sunrise Villa', 'Main Street', 1, 1, 'V'),
    (2, '234567890123', 'Jane', 'Smith', '1985-10-20', '456', 'Moonlight Apartments', 'Park Avenue', 2, 2, 'V'),
    (3, '345678901234', 'Michael', 'Johnson', '1978-03-08', '789', 'River View', 'Waterfront Road', 3, 3, 'V'),
    (4, '456789012345', 'Emily', 'Brown', '1995-12-27', '1011', 'Greenwood Lane', 'Forest Street', 4, 1, 'V'),
    (5, '567890123456', 'William', 'Davis', '1982-08-14', '1213', 'Mountain Vista', 'Hilltop Drive', 5, 2, 'C'),
    (6, '678901234567', 'Olivia', 'Wilson', '1998-06-30', '1415', 'Golden Sands', 'Beach Road', 6, 3, 'V');

-- Insert values into Candidate table
INSERT INTO Candidate (Voterid, no_candidate, no_voters, party, symbol)
VALUES
    (1, 3, 10000, 'Party X', 'Symbol X'),
    (2, 2, 8000, 'Party Y', 'Symbol Y'),
    (3, 3, 10000, 'Party X', 'Symbol X'),
    (4, 4, 12000, 'Party Z', 'Symbol Z'),
    (5, 2, 8000, 'Party Y', 'Symbol Y'),
    (6, 4, 12000, 'Party Z', 'Symbol Z');
	
select * from constituency;
	
select * from voter;

select * from candidate;

INSERT INTO Constituency (C_id, C_name, district, localbody)
VALUES
    (4, 'Constituency D', 'District X', 'Local Body 1'),
    (5, 'Constituency E', 'District Y', 'Local Body 2'),
    (6, 'Constituency F', 'District Z', 'Local Body 3'),
    (7, 'Constituency G', 'District X', 'Local Body 1'),
    (8, 'Constituency H', 'District Y', 'Local Body 2'),
    (9, 'Constituency I', 'District Z', 'Local Body 3'),
    (10, 'Constituency J', 'District X', 'Local Body 1'),
    (11, 'Constituency K', 'District Y', 'Local Body 2'),
    (12, 'Constituency L', 'District Z', 'Local Body 3'),
    (13, 'Constituency M', 'District X', 'Local Body 1');
	
	-- Insert values into Voter table
INSERT INTO Voter (Voterid, aadhar_no, fname, lname, DOB, house_no, house_name, street, ballot_paper, C_id, Voter_CAND)
VALUES
    (7, '789012345678', 'James', 'Martinez', '1973-09-22', '1617', 'Lakeside Retreat', 'Lakeview Avenue', 7, 4, 'C'),
    (8, '890123456789', 'Sophia', 'Taylor', '1989-02-18', '1819', 'Skyline Tower', 'High Street', 8, 5, 'V'),
    (9, '901234567890', 'Alexander', 'Anderson', '1980-07-05', '2021', 'Harbor View', 'Marina Road', 9, 6, 'C'),
    (10, '012345678901', 'Emma', 'Thomas', '1993-11-10', '2223', 'Maplewood Estate', 'Grove Lane', 10, 7, 'V'),
    (11, '123456789012', 'John', 'Smith', '1980-05-15', '3333', 'Sunrise Villa', 'Main Street', 11, 8, 'V'),
    (12, '234567890123', 'Alice', 'Johnson', '1985-10-20', '4444', 'Moonlight Apartments', 'Park Avenue', 12, 9, 'C'),
    (13, '345678901234', 'Michael', 'Brown', '1978-03-08', '5555', 'River View', 'Waterfront Road', 13, 10, 'V'),
    (14, '456789012345', 'Emily', 'Davis', '1995-12-27', '6666', 'Greenwood Lane', 'Forest Street', 14, 11, 'C'),
    (15, '567890123456', 'William', 'Wilson', '1982-08-14', '7777', 'Mountain Vista', 'Hilltop Drive', 15, 12, 'V'),
    (16, '678901234567', 'Olivia', 'Taylor', '1998-06-30', '8888', 'Golden Sands', 'Beach Road', 16, 13, 'V');

-- Insert values into Candidate table
INSERT INTO Candidate (Voterid, no_candidate, no_voters, party, symbol)
VALUES
    (7, 3, 10000, 'Party X', 'Symbol X'),
    (8, 2, 8000, 'Party Y', 'Symbol Y'),
    (9, 3, 10000, 'Party X', 'Symbol X'),
    (10, 4, 12000, 'Party Z', 'Symbol Z'),
    (11, 2, 8000, 'Party Y', 'Symbol Y'),
    (12, 4, 12000, 'Party Z', 'Symbol Z'),
    (13, 3, 10000, 'Party X', 'Symbol X'),
    (14, 2, 8000, 'Party Y', 'Symbol Y'),
    (15, 4, 12000, 'Party Z', 'Symbol Z'),
    (16, 3, 10000, 'Party X', 'Symbol X');

SELECT Constituency.C_name, COUNT(Voter.Voterid) AS total_voters, COUNT(Candidate.Candidate_id) AS total_candidates
FROM Constituency
LEFT JOIN Voter ON Constituency.C_id = Voter.C_id
LEFT JOIN Candidate ON Voter.Voterid = Candidate.Voterid
GROUP BY Constituency.C_name;


SELECT V.fname, V.lname, C.C_name, COUNT(CA.Candidate_id) AS total_candidates, COUNT(V2.Voterid) AS total_voters
FROM Voter V
JOIN Constituency C ON V.C_id = C.C_id
JOIN Candidate CA ON V.Voterid = CA.Voterid
JOIN Voter V2 ON V.C_id = V2.C_id
GROUP BY V.fname, V.lname, C.C_name;

SELECT Constituency.C_name, COUNT(Voter.Voterid) AS total_voters, COUNT(Candidate.Candidate_id) AS total_candidates
FROM Constituency
LEFT JOIN Voter ON Constituency.C_id = Voter.C_id
LEFT JOIN Candidate ON Voter.Voterid = Candidate.Voterid
GROUP BY Constituency.C_name;


SELECT C.C_id, C.C_name, COUNT(CA.Candidate_id) AS total_candidates
FROM Constituency C
LEFT JOIN Candidate CA ON C.C_id = c.C_id
GROUP BY C.C_id, C.C_name
ORDER BY total_candidates DESC
LIMIT 1;



SELECT C.C_id, C.C_name, COUNT(CA.Candidate_id) AS total_candidates
FROM Constituency C
JOIN Candidate CA ON C.C_id = C.C_id
WHERE CA.party = 'Party X'
GROUP BY C.C_id, C.C_name
ORDER BY total_candidates DESC
LIMIT 1;

SELECT C.C_id, C.C_name, AVG(DATE_PART('year', AGE(V.DOB))) AS avg_age
FROM Constituency C
JOIN Voter V ON C.C_id = V.C_id
GROUP BY C.C_id, C.C_name;

SELECT *
FROM Voter
WHERE LENGTH(fname || lname) = (SELECT MAX(LENGTH(fname || lname)) FROM Voter);

SELECT C.C_id, C.C_name, 
    MAX(DATE_PART('year', AGE(MAX(V.DOB)))) - MIN(DATE_PART('year', AGE(MIN(V.DOB)))) AS age_difference
FROM Constituency C
JOIN Voter V ON C.C_id = V.C_id
GROUP BY C.C_id, C.C_name;


SELECT
    C.C_id,
    C.C_name,
    MAX_age - MIN_age AS age_difference
FROM
    Constituency C
JOIN (
    SELECT
        V.C_id,
        MAX(DATE_PART('year', AGE(V.DOB))) AS MAX_age,
        MIN(DATE_PART('year', AGE(V.DOB))) AS MIN_age
    FROM
        Voter V
    GROUP BY
        V.C_id
) AS AgeSubquery ON C.C_id = AgeSubquery.C_id;

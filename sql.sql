
CREATE TABLE User (
  id int NOT NULL, firstName varchar(255), lastName varchar(255), email varchar(255), cultureID int,    deleted bit, country varchar(255),    isRevokeAccess bit, created datetime, PRIMARY KEY (id)

);


INSERT INTO User(id , firstName,lastName,email,cultureID,deleted,country,   
 isRevokeAccess, created )
VALUES (1, 'Victor', 'Shevchenko', 'vs@ gmail.com', 1033, 1, 'US', 0, '2011-04-05'), 
(2, 'Oleksandr', 'Petrenko', 'op@ gmail.com', 1034, 0, 'UA', 0, '2014-05-01'), 
(3, 'Victor', 'Tarasenko', 'vt@gmail.com', 1033, 1, 'US', 1, '2015-07-03'), 
(4, 'Sergiy', 'Ivanenko', 'sergiy@gmail.com', 1046, 0, 'UA', 1, '2010-02-02'), 
(5, 'Vitalii', 'Danilchenko', 'shumko@ gmail.com', 1031, 0, 'UA', 1, '2014-05-01'), 
(6, 'Joe', 'Dou', 'joe@ gmail.com', 1032, 0, 'US', 1, '2009-01-01'), 
(7, 'Marko', 'Polo', 'marko@gmail.com', 1033, 1, 'UA', 1, '2015-07-03');*/



CREATE TABLE GroupTable (
  id int NOT NULL, 
  name varchar(255), 
  created datetime ,
  PRIMARY KEY (id)
);


INSERT INTO GroupTable(id,name,created)
VALUES (10, 'Support', '2010-02-02'), 
(12, 'Dev team', '2010-02-03'), 
(13, 'Apps team', '2011-05-06'), 
(14, 'TEST - dev team', '2013-05-06'), 
(15, 'Guest', '2014-02-02'), 
(16, 'TEST-QA-team', '2014-02-02'), 
(17, 'TEST-team', '2011-01-07') ; */


CREATE TABLE GroupMembership (
  id int, 
  userID int, 
  groupID int, 
  created datetime,
   PRIMARY KEY (id),
   FOREIGN KEY (userID) REFERENCES User(id),
   FOREIGN KEY (groupID) REFERENCES GroupTable(id)
);


INSERT INTO GroupMembership(id,userID,GroupID,created)
VALUES (110, 2, 10, '2010-02-02'), 
 (112, 3, 15, '2010-02-03'), 
 (114, 1, 10, '2014-02-02'), 
 (115, 1, 17, '2011-05-02'), 
 (117, 4, 12, '2014-07-13'), 
 (120, 5, 15, '2014-06-15'); 
 
SELECT * FROM GroupTable WHERE name LIKE 'TEST%';

SELECT GroupMembership.id , userID, GroupID , name ,firstName ,LastName
FROM GroupMembership
INNER JOIN GroupTable ON GroupMembership.groupID = GroupTable.id
INNER JOIN User ON GroupMembership.userID = User.id WHERE firstName = 'Victor' AND name NOT LIKE "TEST%";*/


SELECT GroupMembership.id , name ,firstName ,LastName,user.created as User_CreatedDate , GroupMembership.created as GroupMembership_CreatedDate
FROM GroupMembership
INNER JOIN GroupTable ON GroupMembership.groupID = GroupTable.id
INNER JOIN User ON GroupMembership.userID = User.id WHERE  User_CreatedDate < GroupMembership_CreatedDate  ;







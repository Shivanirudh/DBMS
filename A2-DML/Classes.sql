REM ******Define the relation Classes appropriately to accommodate the following tuples:
DROP TABLE Classes;

CREATE TABLE Classes(
    class VARCHAR(20) CONSTRAINT Class_pk PRIMARY KEY,
    type VARCHAR(2),
    country VARCHAR(20),
    numGuns NUMBER(2),
    bore NUMBER(2),
    displacement NUMBER(5)
);

REM ******1. Add first two tuples from the above sample data. List the columns explicitly in the INSERT clause.

INSERT INTO Classes(class,type,country,numGuns,bore,displacement) VALUES(
    'Bismark','bb','Germany',8,14,32000
);

INSERT INTO Classes(class,type,country,numGuns,bore,displacement) VALUES(
    'Iowa','bb','USA',9,16,46000
);

REM ******2. Populate the relation with the remaining set of tuples. This time, do not list the columns in the INSERT clause.

INSERT INTO Classes VALUES(
    'Kongo','bc','Japan',8,15,42000
);

INSERT INTO Classes VALUES(
    'North Carolina','bb','USA',9,16,37000
);

INSERT INTO Classes VALUES(
    'Revenge','bb','Gt.Britain',8,15,29000
);

INSERT INTO Classes VALUES(
    'Renown','bc','Gt.Britain',6,15,32000
);

REM ******3. Display the populated relation.

SELECT * 
FROM Classes;

REM ******4. Mark an intermediate point here in this transaction.
SAVEPOINT S1;

REM ******5. Change the displacement of Bismark to 34000.
UPDATE Classes
SET displacement=34000
WHERE Class='Bismark';


REM ******6. For the battleships having at least 9 number of guns or the ships with at least 15 inch bore, increase the displacement by 10%. Verify your changes to the table.

UPDATE Classes
SET displacement=1.1*displacement
WHERE numGuns>=9 AND bore>=15;

SELECT * 
FROM Classes;

REM ******7. Delete Kongo class of ship from Classes table.

DELETE FROM Classes
WHERE Class='Kongo';

REM ****** 8. Display your changes to the table.

SELECT *
FROM Classes;

REM ******9. Discard the recent updates to the relation without discarding the earlier INSERT operation(s).
ROLLBACK TO S1;

REM ****** 10. Commit the changes.
COMMIT;
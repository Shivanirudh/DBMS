REM ****** 1. Create a view Schedule_15 that display the flight number, route, airport(origin, destination), departure (date, time), arrival (date, time)
REM ****** of a flight on 15 apr 2005. Label the view column as flight, route, from_airport, to_airport, ddate, dtime, adate, atime respectively.

CREATE OR REPLACE VIEW Schedule_15 AS
	SELECT  fl.flno "FLIGHT", r.routeID "ROUTE", r.orig_airport "FROM_AIRPORT", r.dest_airport "TO_AIRPORT", fl.departs "DDATE", fl.dtime "DTIME", fl.arrives "ADATE", fl.atime "ATIME"
	FROM    routes r, flights f, fl_schedule fl
	WHERE   departs=to_date('15-Apr-2005', 'DD-MON-YYYY') 
	AND     f.rID = r.routeID AND fl.flno = f.flightNo;

SELECT *
FROM Schedule_15;

SAVEPOINT A;

SELECT table_name,column_name,updatable,insertable,deletable
FROM user_updatable_columns
WHERE table_name='SCHEDULE_15';


INSERT INTO Schedule_15 VALUES  ('9E-9999','MD-150','Houston','Texas','15-Apr-05',1130,'15-Apr-05',1730);

SELECT *
FROM Schedule_15;

UPDATE Schedule_15
SET ddate = '18-APR-2005',dtime = 1820, adate = '18-APR-05', atime = 1820
WHERE flight = 'HA-1' OR flight = '9E-3851';


SELECT *
FROM Schedule_15;

SELECT *
FROM fl_schedule
WHERE flno='HA-1' OR flno='9E-3851';

SELECT *
FROM fl_schedule
WHERE flno='SQ-11';

DELETE FROM Schedule_15
WHERE flight = 'SQ-11';

SELECT *
FROM Schedule_15;

SELECT *
FROM fl_schedule
WHERE flno='SQ-11';

ROLLBACK TO A;

REM ************************************************************************************************************************************************************
REM ************************************************************************************************************************************************************

REM ****** 2. Define a view Airtype that display the number of aircrafts for each of its type. Label the column as craft_type, total.

CREATE OR REPLACE VIEW Airtype ("CRAFT_TYPE","TOTAL")AS
	SELECT type, COUNT(*) 
	FROM   aircraft
	GROUP BY type;


SELECT *
FROM Airtype;

SAVEPOINT B;

SELECT table_name,column_name,updatable,insertable,deletable
FROM user_updatable_columns
WHERE table_name='AIRTYPE';

INSERT INTO Airtype VALUES  ('Spicejet',null);

SELECT *
FROM Airtype;

UPDATE Airtype
SET craft_type = 'Lockerseed',total = 100
WHERE craft_type = 'Lockheed';

SELECT *
FROM Airtype;

DELETE FROM Airtype
WHERE craft_type = 'Lockheed';

SELECT *
FROM Airtype;

ROLLBACK TO B;

REM ************************************************************************************************************************************************************
REM ************************************************************************************************************************************************************

REM ****** 3. Create a view Losangeles_Route that contains Los Angeles in the route. Ensure that the view always contain/allows only information about the
REM ****** Los Angeles route

CREATE OR REPLACE VIEW LA_Route AS
	SELECT  *
	FROM    routes
	WHERE   orig_airport = 'Los Angeles' OR dest_airport = 'Los Angeles'
	WITH CHECK OPTION;

SELECT *
FROM LA_Route;

SAVEPOINT C;

SELECT table_name,column_name,updatable,insertable,deletable
FROM user_updatable_columns
WHERE table_name='LA_ROUTE';

INSERT INTO LA_Route VALUES ('LE066','Los Angeles','Houston',4200);

SELECT * 
FROM LA_Route;

SELECT *
FROM routes
WHERE   orig_airport = 'Los Angeles'
OR      dest_airport = 'Los Angeles';

INSERT INTO LA_Route VALUES ('LE420','Boston','Houston',4269);

SELECT * 
FROM LA_Route;

SELECT *
FROM routes
WHERE   orig_airport = 'Los Angeles'
OR      dest_airport = 'Los Angeles';

UPDATE LA_Route
SET routeID = 'LE069',orig_airport = 'Los Angeles', dest_airport = 'Boston',distance = 1420
WHERE routeID = 'LE066';

SELECT * 
FROM LA_Route;

SELECT *
FROM routes
WHERE   orig_airport = 'Los Angeles'
OR      dest_airport = 'Los Angeles';

DELETE FROM LA_Route
WHERE routeID = 'LE069';

SELECT * 
FROM LA_Route;

SELECT  *
FROM    routes
WHERE   orig_airport = 'Los Angeles'
OR      dest_airport = 'Los Angeles';

ROLLBACK TO C;

REM ************************************************************************************************************************************************************
REM ************************************************************************************************************************************************************

REM ****** 4. Create a view named Losangeles_Flight on Schedule_15 (as defined in 1) that display flight, 
REM ****** departure (date, time), arrival (date, time) of flight(s) from Los Angeles

CREATE OR REPLACE VIEW LosAngeles_Flight AS
	SELECT flight, ddate, dtime, adate, atime
	FROM   Schedule_15
	WHERE  from_airport = 'Los Angeles';

SELECT *
FROM LosAngeles_Flight;

SAVEPOINT D;

SELECT table_name,column_name,updatable,insertable,deletable
FROM user_updatable_columns
WHERE table_name='LOSANGELES_FLIGHT';

INSERT INTO LosAngeles_Flight VALUES    ('HA-66','16-Apr-05',1430,'16-Apr-05',1840);


SELECT *
FROM LosAngeles_Flight;

SELECT *
FROM Schedule_15;

SELECT * 
FROM fl_schedule 
WHERE flno = 'HA-1';

UPDATE LosAngeles_Flight
SET flight = 'SQ-11',ddate = '17-APR-05',dtime = 1230,adate = '17-APR-05',atime = 1430
WHERE flight = 'HA-1' AND ddate = '15-APR-2005';

SELECT * 
FROM fl_schedule 
WHERE flno = 'SQ-11';

SELECT *
FROM LosAngeles_Flight;

SELECT * 
FROM fl_schedule 
WHERE flno = 'SQ-11';

DELETE FROM LosAngeles_Flight
WHERE flight = 'SQ-11';

SELECT * 
FROM LosAngeles_Flight;

SELECT flight, ddate, dtime, adate, atime
FROM   Schedule_15
WHERE  from_airport = 'Los Angeles';

SELECT * 
FROM fl_schedule 
WHERE flno = 'SQ-11';

ROLLBACK TO D;


REM @Z:/A4/air_cre.sql
REM @Z:/A4/air_pop.sql
REM @Z:/A4/views.sql
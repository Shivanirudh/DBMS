REM ****** 1. Display the flight number,departure date and time of a flight, its route details and aircraft
REM ****** name of type either Schweizer or Piper that departs during 8.00 PM and 9.00 PM.

SELECT Fl.flno,Fl.departs,Fl.dtime,R.routeid,R.orig_airport,R.dest_airport,R.distance,A.aname
FROM fl_schedule Fl,routes R, aircraft A, flights F
WHERE F.flightNo=Fl.flno     AND
	  R.routeid=F.rID 		 AND
	  A.aid IN (SELECT aid 
	  		 FROM Aircraft 
	  		 WHERE type="Schweizer" OR type ="Piper") AND
	  Fl.dtime BETWEEN 2000 AND 2100;

REM ****** 2. For all the routes, display the flight number, origin and destination airport, if a flight is
REM ****** assigned for that route.	 

SELECT flightno, orig_airport,dest_airport
FROM Routes
WHERE routeid IN (SELECT rid
			  FROM Flights);

REM ****** 3. For all aircraft with cruisingrange over 5,000 miles, find the name of the aircraft and the average salary of all pilots certified for this aircraft.

SELECT a.aname, avg(e.salary) 
FROM aircraft a, employee e
WHERE a.cruisingrange>5000   AND
	  a.aid=(SELECT aid 
	  		 FROM certified) AND
	  e.eid=(SELECT eid
	  		 FROM certified)
GROUP BY a.aname;

REM ****** 4. Show the employee details such as id, name and salary who are not pilots and whose salary
REM ****** is more than the average salary of pilots.

SELECT e.eid,e.ename,e.esalary 
FROM employee e,certified c
WHERE e.eid=c.eid   AND
	  c.eid IS NULL AND
	  e.salary > (SELECT AVG(salary)
	  			  FROM employee emp,certified ctf
	  			  WHERE emp.eid=ctf.eid);

REM ****** 5. Find the id and name of pilots who were certified to operate some aircrafts but at least one
REM ****** of that aircraft is not scheduled from any routes.

SELECT DISTINCT e.eid , e.ename 
FROM employee e, certified c
WHERE e.eid=c.eid AND
      c.aid IN (SELECT c.aid 
				FROM certified c, flights f 
				WHERE f.aid = c.aid AND 
					  f.rID IS NULL);	


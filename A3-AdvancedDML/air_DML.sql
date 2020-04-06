REM ****** 1. Display the flight number,departure date and time of a flight, its route details and aircraft
REM ****** name of type either Schweizer or Piper that departs during 8.00 PM and 9.00 PM.

SELECT Fl.flno,Fl.departs,Fl.dtime,R.routeid,R.orig_airport,R.dest_airport,R.distance,A.aname
FROM fl_schedule Fl INNER JOIN flights F on Fl.flno=flightno INNER JOIN routes R ON F.rid=R.routeid INNER JOIN aircraft A ON A.aid=F.aid 
WHERE (type='Schweizer' OR type ='Piper') AND
	Fl.dtime BETWEEN 2000 AND 2100;

REM ****** 2. For all the routes, display the flight number, origin and destination airport, if a flight is
REM ****** assigned for that route.	 

SELECT F.flightno, R.orig_airport,R.dest_airport
FROM routes R LEFT OUTER JOIN flights F ON F.rid=R.routeid;

REM ****** 3. For all aircraft with cruisingrange over 5,000 miles, find the name of the aircraft and the average salary of all pilots certified for this aircraft.

SELECT a.aname, ROUND(avg(e.salary)) 
FROM aircraft a, employee e,certified c
WHERE a.cruisingrange>5000   AND
	  a.aid = c.aid AND
	  e.eid = c.eid
GROUP BY a.aname;

REM ****** 4. Show the employee details such as id, name and salary who are not pilots and whose salary
REM ****** is more than the average salary of pilots.

SELECT e.eid,e.ename,e.salary 
FROM employee e LEFT OUTER JOIN certified c ON e.eid=c.eid
WHERE c.eid IS NULL AND
      e.salary > (SELECT AVG(salary)
	  	  FROM employee emp,certified ctf
	          WHERE emp.eid=ctf.eid);

REM ****** 5. Find the id and name of pilots who were certified to operate some aircrafts but at least one
REM ****** of that aircraft is not scheduled from any routes.

SELECT DISTINCT e.eid , e.ename 
FROM employee e, certified c
WHERE e.eid=c.eid AND
      c.aid NOT IN (SELECT c.aid 
		    FROM certified c, flights f,fl_schedule Fl 
		    WHERE f.aid = c.aid AND 
		    	f.flightno=Fl.flno);

REM ****** 6. Display the origin and destination of the flights having at least three departures with
REM ****** maximum distance covered.

SELECT R.orig_airport,R.dest_airport
FROM routes R INNER JOIN flights f ON R.routeid=F.rid
WHERE F.flightno IN (SELECT flno 
		     FROM fl_schedule
		     GROUP BY flno
		     HAVING COUNT(*)>=3) AND
      R.distance >= ALL(SELECT R.distance
			FROM routes R INNER JOIN flights f ON R.routeid=F.rid
			WHERE F.flightno IN (SELECT flno 
		     			     FROM fl_schedule
		         		     GROUP BY flno
		     			     HAVING COUNT(*)>=3));

REM ****** 7. Display name and salary of pilot whose salary is more than the average salary of any pilots 
REM ****** for each route other than flights originating from Madison airport.

SELECT DISTINCT e.ename,e.salary
FROM employee e JOIN certified c ON e.eid=c.eid JOIN flights f ON f.aid=c.aid JOIN routes R ON R.routeid=f.rid
WHERE e.salary > (SELECT avg(emp.salary)
		  FROM employee emp, routes rt,certified ctf
		  WHERE	ctf.eid=emp.eid AND
			rt.routeid = R.routeid
		  GROUP BY rt.routeid)
AND R.orig_airport != 'Madison';


REM ****** 8. Display the flight number, aircraft type, source and destination airport of the aircraft having 
REM ****** maximum number of flights to Honolulu.

SELECT f.flightno, a.type, r.orig_airport, r.dest_airport 
FROM flights f JOIN aircraft a on f.aid=a.aid JOIN routes r ON f.rid=r.routeid
WHERE r.dest_airport='Honolulu'
 	  AND a.aid =(SELECT flights.aid
				  FROM routes, flights 
				  WHERE dest_airport='Honolulu' AND routes.routeid=flights.rid
				  GROUP BY flights.aid
				  HAVING count(*)=(SELECT max(count)
		 						   FROM (SELECT count(*) AS count
								   FROM routes, flights WHERE dest_airport='Honolulu' AND routes.routeid=flights.rid
								   GROUP BY flights.aid)));


REM ****** 9. Display the pilot(s) who are certified exclusively to pilot all aircraft in a type.

SELECT DISTINCT eid, type
FROM certified c JOIN aircraft a ON c.aid=a.aid 
WHERE a.type = ALL(SELECT a1.type 
				   FROM aircraft a1 JOIN certified c1 ON a1.aid=c1.aid 
				   WHERE c.eid = c1.eid)
GROUP BY eid, type
HAVING COUNT(*)=(SELECT COUNT(*) 
				 FROM aircraft a2 
				 WHERE a2.type=a.type);
    
REM ****** 10. Name the employee(s) who is earning the maximum salary among the airport having 
REM ****** maximum number of departures.

 SELECT e.ename,e.salary	 
 FROM employee e
 WHERE e.salary	= ( SELECT MAX(e.salary)
    				FROM employee e JOIN certified c ON c.eid=e.eid 
    				WHERE c.aid IN	
    					(SELECT f.aid 
  						 FROM flights f JOIN routes r ON f.rID = r.routeID
    					 WHERE r.orig_airport =	
    					 	(SELECT orig_airport 
    						 FROM (SELECT r.orig_airport, COUNT(fl.departs)
   						   	 FROM routes r JOIN flights f ON r.routeID = f.rID JOIN fl_schedule fl ON fl.flno = f.flightNo
   							 GROUP BY r.orig_airport  
   							 ORDER BY COUNT(fl.departs) DESC) 
  						WHERE rownum = 1)));

REM ****** 11. Display the departure chart as follows:
REM ****** flight number, departure(date,airport,time), destination airport, arrival time, aircraft name
REM ****** for the flights from New York airport during 15 to 19th April 2005. Make sure that the route
REM ****** contains at least two flights in the above specified condition.

SELECT f.flightNo,fl.departs || ' ' || r.orig_airport || ' ' || fl.dtime AS "DEPARTURE",r.dest_airport,fl.atime,a.aname
FROM flights f JOIN fl_schedule fl ON f.flightNo = fl.flno JOIN routes r ON  r.routeID = f.rID JOIN aircraft a ON f.aid = a.aid
WHERE r.orig_airport = 'New York' AND	fl.departs BETWEEN TO_DATE('15/04/2005', 'DD/MM/YYYY') AND TO_DATE('19/04/2005', 'DD/MM/YYYY')
	AND (SELECT count(*)
		  FROM(SELECT fl.flno
				FROM fl_schedule fl JOIN flights f ON f.flightno=fl.flno JOIN routes r ON f.rid=r.routeid
				WHERE (fl.departs BETWEEN '15-APR-2005' AND '19-APR-2005')
				AND r.orig_airport='New York')) >= 2;


REM ****** 12. A customer wants to travel from Madison to New York with no more than two changes of 
REM ****** flight. List the flight numbers from Madison if the customer wants to arrive in New York by 
REM ****** 6.50 p.m.

SELECT f.flightNo
FROM flights f
WHERE f.flightNo IN((SELECT f0.flightNo
  					 FROM flights f0 JOIN routes r ON r.routeID = f0.rID JOIN fl_schedule fl ON f0.flightNo = fl.flno
  	 				 WHERE r.orig_airport = 'Madison' AND r.dest_airport = 'New York'	AND fl.atime <= 1850)
  	 						UNION
  	 						(SELECT	f0.flightNo
  	 						FROM flights f0,flights f1, routes r0, routes r1, fl_schedule fl0, fl_schedule fl1 
 	 						WHERE r0.routeID = f0.rID AND f0.flightNo = fl0.flno
 	 						AND r1.routeID = f1.rID	AND f1.flightNo = fl1.flno
 	 						AND	r0.orig_airport = 'Madison' AND r0.dest_airport <> 'New York'
 	 						AND	r1.orig_airport = r0.dest_airport AND r1.dest_airport = 'New York' 
 	 						AND fl1.atime <= 1850 AND fl1.dtime > fl0.atime)
 	 					);

REM ****** 13. Display the id and name  of employee(s) who are not pilots.

SELECT eid,ename	
FROM ((SELECT * 
       FROM employee) MINUS
	  (SELECT e.* 
       FROM employee e JOIN certified c ON e.eid = c.eid));

REM ****** 14. Display the id and name of employee(s) who pilots the aircraft from Los Angels and Detroit
REM ****** airport.

SELECT e.eid,e.ename
FROM employee e 
WHERE e.eid	IN ((SELECT	e.eid	
	  			 FROM employee e JOIN certified c ON e.eid = c.eid JOIN flights f ON f.aid = c.aid JOIN routes r ON r.routeID = f.rID
  	 			 WHERE r.orig_airport	= 'Los Angeles')	
				INTERSECT
  	 			 (SELECT	e.eid	
	  			 FROM employee e JOIN certified c ON e.eid = c.eid JOIN flights f ON f.aid = c.aid JOIN routes r ON r.routeID = f.rID
  	 			 WHERE r.orig_airport	= 'Detroit'));


REM ****** @Z:/A3/air_DML.sqlSSS
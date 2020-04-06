REM 3. An aircraft is assigned to a flight only if its cruising range is more than the distance of the flights’ route.

CREATE OR REPLACE TRIGGER distance_check
BEFORE INSERT OR UPDATE ON flights
FOR EACH ROW

	DECLARE
		range NUMBER(5);
		distance NUMBER(5);
	BEGIN
		SELECT a.cruisingrange INTO range FROM aircraft a WHERE a.aid=:NEW.aid;
		SELECT r.distance INTO distance FROM routes r WHERE r.routeID=:NEW.rID;

		IF range<distance THEN
			raise_application_error(-20000,'Cruising range must be greater than distance of journey.');
		END IF; 
	END;
/

INSERT INTO flights VALUES('SN-7777','LW100',16);

UPDATE flights SET aid=6 WHERE flightNo='DJ-2';
 

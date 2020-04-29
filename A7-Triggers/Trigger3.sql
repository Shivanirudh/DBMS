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

		IF range < distance THEN
			raise_application_error(-20000,'Cruising range must be greater than distance of journey.');
		END IF; 
	END;
/

-- Inserting instance where range < distance
INSERT INTO flights VALUES('LTF-543','LW104',4);

-- Inserting instance where range > distance
INSERT INTO flights VALUES('LTF-543','CN151',4);

-- Update instance to range < distance
UPDATE flights SET aid=7 WHERE flightNo='JJ-7456';

--Update instance to range > distance 
UPDATE flights SET aid=9 WHERE flightNo='JJ-7456';
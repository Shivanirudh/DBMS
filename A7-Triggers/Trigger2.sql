REM 2. Flight number CX7520 is scheduled only on Tuesday, Friday and Sunday.

CREATE OR REPLACE TRIGGER flight_check
BEFORE INSERT OR UPDATE ON fl_schedule
FOR EACH ROW
WHEN(NEW.flno LIKE 'CX-7520')	
	DECLARE
	dayofweek NUMBER;
	
	BEGIN
		SELECT  TO_CHAR(:NEW.departs,'D')  INTO dayofweek FROM DUAL;
		IF dayofweek NOT IN (1,3,6) THEN 
			dbms_output.put_line(dayofweek);
			RAISE_APPLICATION_ERROR(-20000,'Flight CX7520 is only scheduled on TUESDAY, FRIDAY AND SUNDAY');
		END IF;
	END;
/

-- Inserting flight other than CX-7520 to depart on a Wednesday
INSERT INTO fl_schedule VALUES('JJ-7456','22-APR-2020',0829,'22-APR-2020',1019,20);

-- Inserting flight CX-7520 to depart on a Wednesday
INSERT INTO fl_schedule VALUES('CX-7520','22-APR-2020',0829,'22-APR-2020',1019,20);

-- Inserting flight CX-7520 to depart on a Friday
INSERT INTO fl_schedule VALUES('CX-7520','24-APR-2020',0829,'24-APR-2020',1019,20);

--Updating above inserted flight CX-7520 to depart on a saturday
UPDATE fl_schedule SET departs='18-APR-2020' WHERE flno = 'CX-7520' AND arrives = '24-APR-2020';

--Updating above inserted flight CX-7520 to depart on a sunday
UPDATE fl_schedule SET departs='19-APR-2020' WHERE flno = 'CX-7520' AND arrives = '24-APR-2020';

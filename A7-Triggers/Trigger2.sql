REM 2. Flight number CX7520 is scheduled only on Tuesday, Friday and Sunday.

CREATE OR REPLACE TRIGGER fight_check
BEFORE INSERT OR UPDATE ON fl_schedule
FOR EACH ROW
WHEN(NEW.flno LIKE 'CX-7520')	
	DECLARE
	dayofweek NUMBER;
	
	BEGIN
		SELECT  TO_CHAR(:NEW.departs,'D')  INTO dayofweek FROM DUAL;
		IF dayofweek NOT IN (0,2,5) THEN 
			RAISE_APPLICATION_ERROR(-20000,'Flight CX7520 is only scheduled on TUESDAY FRIDAY AND SATURDAY');
		END IF;
	END;
/

INSERT INTO fl_schedule VALUES('AF-12','14-APR-2005',0923,'16-APR-2005',0947,345);

INSERT INTO fl_schedule VALUES('CX-7520','14-APR-2005',0923,'16-APR-2005',0947,345);

UPDATE fl_schedule SET departs='14-APR-2005' WHERE departs='12-APR-2005';

REM 1. The date of arrival should be always later than or on the same date of departure.

CREATE OR REPLACE TRIGGER date_check 
BEFORE INSERT OR UPDATE ON fl_schedule
FOR EACH ROW
WHEN(NEW.arrives<NEW.departs OR OLD.arrives<NEW.departs OR NEW.arrives<OLD.departs)
	BEGIN
		IF INSERTING THEN
			raise_application_error(-20000,'Insert error:arrival date is before the departure date.');
		ELSIF UPDATING THEN
			raise_application_error(-20000,'Update error:arrival date is before the departure date.');
		END IF;
	END;

/

UPDATE fl_schedule SET departs='19-JUN-05' WHERE arrives='19-APR-05';


UPDATE fl_schedule SET arrives='15-APR-05' WHERE departs='17-APR-05';


INSERT INTO fl_schedule VALUES('AF-12','20-JUN-2020',0829,'17-JUN-2020',1019,20);
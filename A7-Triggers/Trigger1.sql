REM 1. The date of arrival should be always later than or on the same date of departure.

CREATE OR REPLACE TRIGGER date_check 
BEFORE INSERT OR UPDATE ON fl_schedule
FOR EACH ROW
WHEN(NEW.arrives<NEW.departs OR OLD.arrives<NEW.departs OR NEW.arrives<OLD.departs)
	BEGIN
		IF INSERTING THEN
			raise_application_error(-20000,'Insert error:arrival date is before the departure date.');
		ELSIF UPDATING THEN
			raise_application_error(-20001,'Update error:arrival date is before the departure date.');
		END IF;
	END;

/

-- Insert error
INSERT INTO fl_schedule VALUES('JJ-7456','20-JUN-2020',0829,'17-JUN-2020',1019,20);

-- Proper insert
INSERT INTO fl_schedule VALUES('JJ-7456','17-JUN-2020',0829,'20-JUN-2020',1019,20);

-- Update error when updating departs
UPDATE fl_schedule SET departs='25-JUN-2020' WHERE arrives='20-JUN-2020' AND flno = 'JJ-7456';

-- Proper update when updating departs
UPDATE fl_schedule SET departs='17-JUN-2020' WHERE arrives='20-JUN-2020' AND flno = 'JJ-7456';

-- Update error when updating arrives
UPDATE fl_schedule SET arrives='14-JUN-2020' WHERE departs='17-JUN-2020' AND flno = 'JJ-7456';

-- Proper update when updating arrives
UPDATE fl_schedule SET arrives='22-JUN-2020' WHERE departs='17-JUN-2020' AND flno = 'JJ-7456';


REM Table for Employee Payroll Application
DROP TABLE Employee_Payroll;
CREATE TABLE Employee_Payroll(
	eid NUMBER(9) CONSTRAINT epr_pk PRIMARY KEY,
	ename VARCHAR2(20),
	dob DATE,
	sex CHAR,
	designation VARCHAR2(30),
	basic NUMBER(7,2),
	da NUMBER(7,2),	
	hra NUMBER(7,2),	
	pf NUMBER(7,2),	
	mc NUMBER(7,2),	
	gross NUMBER(7,2),	
	tot_deduc NUMBER(7,2),
	net_pay NUMBER(8,2)
);	
CREATE OR REPLACE PROCEDURE Emp_Payslip(empid IN emp_payroll.eid%TYPE,emp_basic IN emp_payroll.basic%TYPE ) IS
BEGIN
UPDATE Employee_Payroll
SET da = 0.6 * emp_basic,
    hra = 0.11 * emp_basic,
    pf = 0.04 * emp_basic,
    mc = 0.03 * emp_basic,
    gross = 1.71 * emp_basic,
    tot_deduc = 0.07 * emp_basic,
    net_pay = 1.64 * emp_basic
WHERE eid = empid;
END;
/

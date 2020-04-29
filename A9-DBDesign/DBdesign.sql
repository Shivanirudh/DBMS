REM Consider the following relation Company with the set of functional REM dependencies:
REM COMPANY(empid, name, address, bdate, sex, salary, dno, dname, mgr_id, pno, REM pname, pdno, hrs)
REM fd1: empid -> name, address, bdate, sex, salary, dno
REM fd2: dno -> dname, mgr_id
REM fd3: pno -> pname, pdno where pdno is the department controlling the project.
REM fd4: empid, pno -> hrs

REM primary key:(empid,pno)

REM ************ PART - A ******************

REM ************ 1NF TABLE *****************
REM *****************************************************************
REM 1) CREATE TABLE IN 1NF
REM *****************************************************************

DROP TABLE company;

CREATE TABLE company(
	empid NUMBER(9),
	name VARCHAR2(20),
	address VARCHAR2(25),
	bdate DATE,
	sex CHAR(1),
	salary NUMBER(6,1),
	dno NUMBER(1),
	dname VARCHAR2(15),
	mgr_id NUMBER(9),
	pno NUMBER(2),
	pname VARCHAR2(15),
	pdno NUMBER(1),
	hrs NUMBER(3,1),
	CONSTRAINT company_pk PRIMARY KEY(empid,pno)
);

REM ******************************************************************
REM 2) POPULATE 1NF TABLE
REM ******************************************************************

INSERT INTO company VALUES(
	123456789, 'John B Smith', '731 Fondren, Houston, TX', 
	'09-Jan-1965', 'M', 30000, 5, 'Research', 333445555, 
	1, 'ProductX', 5, 32.5
);

INSERT INTO company VALUES(
	123456789, 'John B Smith', '731 Fondren, Houston, TX', 
	'09-Jan-1965', 'M', 30000, 5, 'Research', 333445555, 
	2, 'ProductY', 5, 7.5
);

INSERT INTO company VALUES(
	333445555, 'Franklin T Wong', '638 Voss, Houston, TX', 
	'08-Dec-1955', 'M', 40000, 5, 'Research', 888665555, 
	2, 'ProductY', 5, 10.0
);

INSERT INTO company VALUES(
	333445555, 'Franklin T Wong', '638 Voss, Houston, TX', 
	'08-Dec-1955', 'M', 40000, 5, 'Research', 888665555, 
	3, 'ProductZ', 5, 10.0
);

INSERT INTO company VALUES(
	333445555, 'Franklin T Wong', '638 Voss, Houston, TX', 
	'08-Dec-1955', 'M', 40000, 5, 'Research', 888665555, 
	10, 'Computerization', 4, 10.0
);

INSERT INTO company VALUES(
	333445555, 'Franklin T Wong', '638 Voss, Houston, TX', 
	'08-Dec-1955', 'M', 40000, 5, 'Research', 888665555, 
	20, 'Reorganization', 1, 10.0
);

INSERT INTO company VALUES(
	999887777, 'Alicia J Zelaya', '3321 Castle, Spring, TX', 
	'19-Jan-1968', 'F', 25000, 4, 'Administration', 987654321,
	30, 'Newbenefits', 4, 30.0
);

INSERT INTO company VALUES(
	999887777, 'Alicia J Zelaya', '3321 Castle, Spring, TX', 
	'19-Jan-1968', 'F', 25000, 4, 'Administration', 987654321, 
	10, 'Computerization', 4, 10.0
);

INSERT INTO company VALUES(
	987654321, 'Jennifer S Wallace', '291 Berry, Bellaire, TX', 
	'20-Jun-1941', 'F', 43000, 4, 'Administration', 888665555, 
	30, 'Newbenefits', 4, 20.0
);

INSERT INTO company VALUES(
	987654321, 'Jennifer S Wallace', '291 Berry, Bellaire, TX', 
	'20-Jun-1941', 'F', 43000, 4, 'Administration', 888665555, 
	20, 'Reorganization', 1, 15.0
);

INSERT INTO company VALUES(
	666884444, 'Ramesh K Narayan', '975 Fire Oak, Humble, TX', 
	'15-Sep-1962', 'M', 38000, 5, 'Research', 333445555, 
	3, 'ProductZ', 5, 40.0
);

INSERT INTO company VALUES(
	453453453, 'Joyce A English', '5631 Rice, Houston TX', 
	'31-Jul-1972', 'F', 25000, 5, 'Research', 333445555, 
	1, 'ProductX', 5, 20.0
);

INSERT INTO company VALUES(
	453453453,'Joyce A English','5631 Rice, Houston TX', 
	'31-Jul-1972', 'F', 25000, 5, 'Research', 333445555, 
	2, 'ProductY', 5, 20.0
);

INSERT INTO company VALUES(
	987987987, 'Ahmad V Jabbar', '980 Dallas, Houston, TX', 
	'29-Mar-1969', 'M', 25000, 4, 'Administration', 987654321, 
	10, 'Computerization', 4, 35.0
);

INSERT INTO company VALUES(
	987987987,'Ahmad V Jabbar', '980 Dallas, Houston, TX', 
	'29-Mar-1969', 'M', 25000, 4, 'Administration', 987654321, 
	30, 'Newbenefits', 4, 5.0
);

INSERT INTO company VALUES(
	888665555, 'James E Borg', '450 Stone, Houston, TX', 
	'10-Nov-1937', 'M', 55000, 1, 'Headquarters', NULL,
	20, 'Reorganization', 1, NULL
);
REM *****************************************************************
REM 3) DISPLAY THE RECORDS - SELECT 1NF TABLE
REM *****************************************************************

SELECT *
FROM company;


REM *****************************************************************
REM ******************** 3NF TABLES *********************************

REM *****************************************************************
REM 4) CREATE ALL THE 3NF RELATIONS (TABLES)
REM *****************************************************************

DROP TABLE company_work;
DROP TABLE company_project;
DROP TABLE company_employee;
DROP TABLE company_department;

CREATE TABLE company_department(
	dno NUMBER(1) CONSTRAINT dept_pk PRIMARY KEY,
	dname VARCHAR2(15),
	mgr_id NUMBER(9)
);

CREATE TABLE company_employee(
	empid NUMBER(9) CONSTRAINT employee_pk PRIMARY KEY,
	name VARCHAR2(20),
	address VARCHAR2(25),
	bdate DATE,
	sex CHAR(1),
	salary NUMBER(6, 1),
	dno NUMBER(1) CONSTRAINT employee_fk references company_department(dno)
);

CREATE TABLE company_project(
	pno NUMBER(2) CONSTRAINT pjt_pk PRIMARY KEY,
	pname VARCHAR2(15),
	pdno NUMBER(1)
);

CREATE TABLE company_work(
	empid NUMBER(9),
	pno NUMBER(2),
	hrs NUMBER(3,1),
	CONSTRAINT work_pk PRIMARY KEY(empid,pno),
	CONSTRAINT work_fk1 FOREIGN KEY(empid) REFERENCES company_employee(empid),
	CONSTRAINT work_fk2 FOREIGN KEY(pno) REFERENCES company_project(pno)
);

REM ************************************************************
REM 5) POPULATE EACH AND EVERY RELATIONS
REM ************************************************************

INSERT INTO company_department VALUES(5, 'Research', 333445555);

INSERT INTO company_department VALUES(4, 'Administration', 987654321);

INSERT INTO company_department VALUES(1, 'Headquarters', 888665555);

REM ************************************************************

INSERT INTO company_employee VALUES(123456789, 'John B Smith', '731 Fondren, Houston, TX', '09-Jan-1965', 'M', 30000, 5);

INSERT INTO company_employee VALUES(333445555, 'Franklin T Wong', '638 Voss, Houston, TX', '08-Dec-1955', 'M', 40000, 5);

INSERT INTO company_employee VALUES(999887777, 'Alicia J Zelaya', '3321 Castle, Spring, TX', '19-Jan-1968', 'F', 25000, 4);

INSERT INTO company_employee VALUES(987654321, 'Jennifer S Wallace', '291 Berry, Bellaire, TX', '20-Jun-1941', 'F', 43000, 4);

INSERT INTO company_employee VALUES(666884444, 'Ramesh K Narayan', '975 Fire Oak, Humble, TX', '15-Sep-1962', 'M', 38000, 5);

INSERT INTO company_employee VALUES(453453453, 'Joyce A English', '5631 Rice, Houston, TX', '31-Jul-1972', 'F', 25000, 5);

INSERT INTO company_employee VALUES(987987987, 'Ahmad V Jabbar', '980 Dallas, Houston, TX', '29-Mar-1969', 'M', 25000, 4);

INSERT INTO company_employee VALUES(888665555, 'James E Borg', '450 Stone, Houston, TX', '10-Nov-1937', 'M', 55000, 1); 

REM ************************************************************

INSERT INTO company_project VALUES(1, 'ProductX', 5);

INSERT INTO company_project VALUES(2, 'ProductY', 5);

INSERT INTO company_project VALUES(3, 'ProductZ', 5);

INSERT INTO company_project VALUES(10, 'Computerization', 4);

INSERT INTO company_project VALUES(20, 'Reorganization', 1);

INSERT INTO company_project VALUES(30, 'Newbenefits', 4);

REM ************************************************************

INSERT INTO company_work VALUES(123456789, 1, 32.5);

INSERT INTO company_work VALUES(123456789, 2, 7.5);

INSERT INTO company_work VALUES(333445555, 2, 10.0);

INSERT INTO company_work VALUES(333445555, 3, 10.0);

INSERT INTO company_work VALUES(333445555, 10, 10.0);

INSERT INTO company_work VALUES(333445555, 20, 10.0);

INSERT INTO company_work VALUES(999887777, 30, 30.0);

INSERT INTO company_work VALUES(999887777, 10, 10.0);

INSERT INTO company_work VALUES(987654321, 30, 20.0);

INSERT INTO company_work VALUES(987654321, 20, 15.0);

INSERT INTO company_work VALUES(666884444, 3, 40.0);

INSERT INTO company_work VALUES(453453453, 1, 20.0);

INSERT INTO company_work VALUES(453453453, 2, 20.0);

INSERT INTO company_work VALUES(987987987, 10, 35.0);

INSERT INTO company_work VALUES(987987987, 30, 5.0);

INSERT INTO company_work VALUES(888665555, 20, NULL);

REM ************************************************************
REM 6) DISPLAY (SELECT) ALL 3NF RELATIONS
REM ************************************************************

SELECT * 
FROM company_employee;

REM ************************************************************

SELECT *
FROM company_department;

REM ************************************************************

SELECT *
FROM company_project;

REM ************************************************************

SELECT *
FROM company_work;

REM ************************************************************
REM TO PROVE LOSSLESS-JOIN PROPERTY:
REM 7) PERFORM JOIN / NATURAL JOIN ON ALL THE 3NF RELATIONS.
REM ************************************************************

SELECT *
FROM company_employee NATURAL JOIN company_department 
     NATURAL JOIN 
     company_project NATURAL JOIN company_work;

REM ************************************************************



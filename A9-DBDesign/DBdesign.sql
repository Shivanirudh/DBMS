REM Consider the following relation Company with the set of functional REM dependencies:
REM COMPANY(empid, name, address, bdate, sex, salary, dno, dname, mgr_id, pno, REM pname, pdno, hrs)
REM fd1: empid -> name, address, bdate, sex, salary, dno
REM fd2: dno -> dname, mgr_id
REM fd3: pno -> pname, pdno where pdno is the department controlling the project.
REM fd4: empid, pno -> hrs

REM primary key:(empid,pno)

drop table company;
drop table company_work;
drop table company_project;
drop table company_employee;
drop table company_department;

CREATE TABLE company(
	empid NUMBER(5),
	name VARCHAR2(20),
	address VARCHAR2(50),
	bdate DATE,
	sex CHAR(1),
	salary NUMBER(8,1),
	dno NUMBER(3),
	dname VARCHAR2(30),
	mgr_id NUMBER(5),
	pno NUMBER(3),
	pname VARCHAR2(30),
	pdno NUMBER(3),
	hrs NUMBER(3),
	CONSTRAINT company_pk PRIMARY KEY(empid,pno)
);

INSERT INTO company VALUES(
	12345,'John','731 Fondren, Houston, TX',
	'09-JAN-1965','M',30000,5,'Research',33344,
	1,'ProductX',5,32.5
);

INSERT INTO company VALUES(
	12345,'John','731 Fondren, Houston, TX',
	'09-JAN-1965','M',30000,5,'Research',33344,
	2,'ProductY',5,7.5
);

INSERT INTO company VALUES(
	33344,'Franklin','638 Voss, Houston, TX',
	'08-DEC-1955','M',40000,5,'Research',33344,
	2,'ProductY',5,10.0
);

INSERT INTO company VALUES(
	33344,'Franklin','638 Voss, Houston, TX',
	'08-DEC-1955','M',40000,5,'Research',33344,
	3,'ProductZ',5,10.0
);

INSERT INTO company VALUES(
	33344,'Franklin','638 Voss, Houston, TX',
	'08-DEC-1955','M',40000,5,'Research',33344,
	10,'Computerization',4,10.0
);

INSERT INTO company VALUES(
	33344,'Franklin','638 Voss, Houston, TX',
	'08-DEC-1955','M',40000,5,'Research',33344,
	20,'Reorganization',1,10.0
);

INSERT INTO company VALUES(
	99988,'Alicia','3321 Castle, Spring, TX',
	'19-Jan-1968','F',25000,4,'Administration',98765,
	30,'Newbenefits',4,30.0
);

INSERT INTO company VALUES(
	99988,'Alicia','3321 Castle, Spring, TX',
	'19-Jan-1968','F',25000,4,'Administration',98765,
	10,'Computerization',4,10.0
);

INSERT INTO company VALUES(
	98785,'Jennifer','291 Berry, Bellaire, TX',
	'20-Jun-1941','F',43000,4,'Administration',98765,
	30,'Newbenefits',4,20.0
);

INSERT INTO company VALUES(
	98785,'Jennifer','291 Berry, Bellaire, TX',
	'20-Jun-1941','F',43000,4,'Administration',98765,
	20,'Reorganization',1,15.0
);

INSERT INTO company VALUES(
	66688,'Ramesh','975 Fire Oak, Humble, TX',
	'15-Sep-1962','M',38000,5,'Research',33344,
	3,'ProductZ',5,40.0
);

INSERT INTO company VALUES(
	45345,'Joyce','5631 Rice, Houston TX',
	'31-Jul-1972','F',25000,5,'Research',33344,
	1,'ProductX',5,20.0
);

INSERT INTO company VALUES(
	45345,'Joyce','5631 Rice, Houston TX',
	'31-Jul-1972','F',25000,5,'Research',33344,
	2,'ProductY',5,20.0
);

INSERT INTO company VALUES(
	98798,'Ahmad','980 Dallas, Houston, TX',
	'29-Mar-1969','M',25000,4,'Administration',98765,
	30,'Newbenefits',4,5.0
);

INSERT INTO company VALUES(
	98798,'Ahmad','980 Dallas, Houston, TX',
	'29-Mar-1969','M',25000,4,'Administration',98765,
	10,'Computerization',4,35.0
);

INSERT INTO company VALUES(
	88866,'James','450 Stone, Houston, TX',
	'10-Nov-1937','M',55000,1,'Headquarters',88866,
	20,'Reorganization',1,NULL
);

REM **************************************************************************
CREATE TABLE company_project(
	pno NUMBER(3) CONSTRAINT pjt_pk PRIMARY KEY,
	pname VARCHAR2(30),
	pdno NUMBER(3)
);

CREATE TABLE company_department(
	dno NUMBER(3) CONSTRAINT dept_pk PRIMARY KEY,
	dname VARCHAR2(30),
	mgr_id NUMBER(5)
);

CREATE TABLE company_employee(
	empid NUMBER(5) CONSTRAINT employee_pk PRIMARY KEY,
	name VARCHAR2(20),
	address VARCHAR2(50),
	bdate DATE,
	sex CHAR(1),
	salary NUMBER(8,1),
	dno NUMBER(3),
	CONSTRAINT employee_fk 
	FOREIGN KEY(dno) references company_department(dno)
);

CREATE TABLE company_work(
	empid NUMBER(5),
	pno NUMBER(3),
	hrs NUMBER(3),
	CONSTRAINT work_pk PRIMARY KEY(empid,pno),
	CONSTRAINT work_fk1 FOREIGN KEY(empid) REFERENCES company_employee(empid),
	CONSTRAINT work_fk2 FOREIGN KEY(pno) REFERENCES company_project(pno)
);

REM ************************************************************
INSERT INTO company_project VALUES(1,'ProductX',5);

INSERT INTO company_project VALUES(2,'ProductY',5);

INSERT INTO company_project VALUES(3,'ProductZ',5);

INSERT INTO company_project VALUES(10,'Computerization',4);

INSERT INTO company_project VALUES(20,'Reorganization',1);

INSERT INTO company_project VALUES(30,'Newbenefits',4);

REM ************************************************************
 
INSERT INTO company_department VALUES(5,'Research',33344);

INSERT INTO company_department VALUES(4,'Administration',98765);

INSERT INTO company_department VALUES(1,'Headquarters',88866);

REM ************************************************************

INSERT INTO company_employee VALUES(	12345,'John','731 Fondren, Houston, TX','09-JAN-1965','M',30000,5);

INSERT INTO company_employee VALUES(	33344,'Franklin','638 Voss, Houston, TX','08-DEC-1955','M',40000,5);


INSERT INTO company_employee VALUES(99988,'Alicia','3321 Castle, Spring, TX','19-Jan-1968','F',25000,4);


INSERT INTO company_employee VALUES(98785,'Jennifer','291 Berry, Bellaire, TX',	'20-Jun-1941','F',43000,4);


INSERT INTO company_employee VALUES(66688,'Ramesh','975 Fire Oak, Humble, TX','15-Sep-1962','M',38000,5);


INSERT INTO company_employee VALUES(45345,'Joyce','5631 Rice, Houston TX','31-Jul-1972','F',25000,5);

INSERT INTO company_employee VALUES(98798,'Ahmad','980 Dallas, Houston, TX',	'29-Mar-1969','M',25000,4);


INSERT INTO company_employee VALUES(88866,'James','450 Stone, Houston, TX','10-Nov-1937','M',55000,1);

REM ************************************************************

INSERT INTO company_work VALUES(12345,1,32.5);

INSERT INTO company_work VALUES(12345,2,7.5);

INSERT INTO company_work VALUES(33344,2,10.0);

INSERT INTO company_work VALUES(33344,3,10.0);

INSERT INTO company_work VALUES(33344,10,10.0);

INSERT INTO company_work VALUES(33344,20,10.0);

INSERT INTO company_work VALUES(99988,30,30.0);

INSERT INTO company_work VALUES(99988,10,10.0);

INSERT INTO company_work VALUES(98785,30,20.0);

INSERT INTO company_work VALUES(98785,20,15.0);

INSERT INTO company_work VALUES(66688,3,40.0);

INSERT INTO company_work VALUES(45345,1,20.0);

INSERT INTO company_work VALUES(45345,2,20.0);

INSERT INTO company_work VALUES(98798,30,5.0);

INSERT INTO company_work VALUES(98798,10,35.0);

INSERT INTO company_work VALUES(88866,20,NULL);

REM ************************************************************

SELECT *
FROM company_employee NATURAL JOIN company_department 
	NATURAL JOIN company_project NATURAL JOIN company_work;

REM ************************************************************

SELECT *
FROM company;

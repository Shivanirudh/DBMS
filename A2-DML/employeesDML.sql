REM ******* 11. Display firsy name, job id and salary of all the employees.

SELECT first_name,job_id,salary
FROM employees;

REM*************************************************************************

REM ******* 12. Display the id, name(first & last), salary and annual salary of all the employees.
REM ******* Sort the employees by first name. Label the columns as shown below:
REM ******* (EMPLOYEE_ID, FULL NAME, MONTHLY SAL, ANNUAL SALARY)

SELECT employee_id AS "EMPLOYEE_ID",first_name||' '||last_name AS "FULL NAME",
       salary AS "MONTHLY SAL",12*salary AS "ANNUAL SALARY"
FROM employees
ORDER BY first_name;

REM*************************************************************************

REM ****** 13. List the different jobs in which the employees are working for.

SELECT DISTINCT job_id
FROM employees;

REM*************************************************************************

REM ****** 14. Display the id, first name, job id, salary and commission of employees who are earning
REM ****** commissions.

SELECT employee_id,first_name,job_id,salary,commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

REM*************************************************************************

REM ****** 15. Display the details (id, first name, job id, salary and dept id) of employees who are
REM ****** MANAGERS.

SELECT employee_id,first_name,last_name,job_id,salary
FROM employees
WHERE job_id LIKE '___MGR';

REM*************************************************************************

REM ****** 16. Display the details of employees other than sales representatives (id, first name, hire date,
REM ****** job id, salary and dept id) who are hired after ‘01May1999’ or whose salary is at least 10000.

SELECT employee_id,first_name,hire_date,job_id,salary,department_id
FROM employees
WHERE job_id <> 'SA_REP' AND
      (salary>=10000 OR hire_date > '01-MAY-1999');

REM*************************************************************************

REM ****** 17. Display the employee details (first name, salary, hire date and dept id) whose salary falls in
REM ****** the range of 5000 to 15000 and his/her name begins with any of characters (A,J,K,S). Sort
REM ****** the output by first name.

SELECT first_name,salary,hire_date,department_id
FROM employees
WHERE salary BETWEEN 5000 AND 15000 AND
      (first_name LIKE 'A%' OR first_name LIKE 'J%' OR
       first_name LIKE 'K%' OR first_name LIKE 'S%')
ORDER BY first_name;

REM*************************************************************************

REM ****** 18. Display the experience of employees in no. of years and months who were hired after 1998.
REM ****** Label the columns as: (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, EXPYRS, EXPMONTHS)

SELECT employee_id,first_name,hire_date,
       2020-EXTRACT(YEAR FROM hire_date) AS "EXPYRS",
       12-EXTRACT(MONTH FROM hire_date) AS "EXPMONTHS"
FROM employees;

REM*************************************************************************

REM ****** 19. Display the total number of departments.

SELECT COUNT(DISTINCT department_id)
FROM employees;

REM*************************************************************************

REM ****** 20. Show the number of employees hired by yearwise. Sort the result by yearwise.

SELECT COUNT(*) "NUMBER OF EMPLOYEES", EXTRACT (YEAR FROM hire_date) AS "YEAR"
FROM employees
GROUP BY EXTRACT(YEAR FROM hire_date);

REM*************************************************************************

REM ****** 21. Display the minimum, maximum and average salary, number of employees for each
REM ****** department. Exclude the employee(s) who are not in any department. Include the
REM ****** department(s) with at least 2 employees and the average salary is more than 10000. Sort the
REM ****** result by minimum salary in descending order.

SELECT MIN(salary) "MINIMUM SALARY",
       MAX(salary) "MAXIMUM SALARY",
       AVG(salary) "AVG SALARY",
       COUNT(*) "NUMBER OF EMPLOYEES"
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING (COUNT(*)>=2 AND AVG(salary) > 10000)
ORDER BY MIN(salary) DESC;
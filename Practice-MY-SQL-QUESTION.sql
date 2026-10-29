USE db;

-- 1.show all table 
show tables; 

SELECT *
FROM salaries;

-- 2.Display only job_title and salary_in_usd.

SELECT DISTINCT job_title, salary_in_usd
FROM salaries;

-- 3.Find all employees whose experience_level is 'SE'.

SELECT experience_level
FROM salaries
WHERE experience_level = 'SE';

-- 4.Show employees where salary_in_usd is greater than 100000.

SELECT salary_in_usd
FROM salaries
WHERE salary_in_usd > 100000;

-- 5.Display records where company_location is 'US'.

SELECT * 
FROM salaries
WHERE company_location = 'US';

-- 6.Sort employees by salary_in_usd in descending order.

SELECT salary_in_usd
FROM salaries
ORDER BY salary_in_usd DESC; 

-- 7.Show top 3 highest paid employees.

SELECT *
FROM salaries
ORDER BY salary_in_usd DESC
LIMIT 3;

-- 8.Count total number of employees.

SELECT COUNT(*) 
FROM salaries;

-- 9.Find minimum and maximum salary.

SELECT MAX(salary_in_usd) AS MAXIMUN
FROM salaries;

SELECT MIN(salary_in_usd) AS MINIMUN
FROM salaries;

-- 10.	Show employees whose remote_ratio is 0.

SELECT remote_ratio
FROM salaries
WHERE remote_ratio = '0';


-- 11.Count number of employees for each experience_level.

SELECT experience_level,
 COUNT(*) AS EMPLOYEES_COUNT
FROM salaries
group by experience_level;

-- 12.Find average salary for each job_title.

SELECT job_title,
AVG(salary_in_usd) AS AVG_SALARY
FROM salaries
GROUP BY job_title;

-- 13.	Show total salary paid per company_location.

SELECT company_location,
max(salary_in_usd)
FROM salaries
group BY company_location;

-- 14.	Find number of employees in each company_size.

SELECT company_size,
count(*) AS EMPLOYEES_COUNT
FROM salaries
GROUP BY company_size;

-- 15.	Show job titles where average salary is greater than 150000.

SELECT job_title,
AVG(salary_in_usd) 
FROM salaries
GROUP BY job_title;

-- 16.	Find highest salary for each company_location.

SELECT company_location,
MAX(salary_in_usd)
FROM salaries
GROUP BY company_location;

-- 17.	Show total employees working remotely (remote_ratio = 100).

SELECT remote_ratio
FROM salaries
WHERE remote_ratio='100';

-- 18.	Count employees grouped by employment_type.

SELECT employment_type,
COUNT(*) AS ALL_AMPLOYEE
FROM salaries
GROUP BY employment_type;

-- 19.	Find average salary for each experience_level.

SELECT experience_level,
AVG(salary_in_usd)
FROM salaries
GROUP BY experience_level;

-- 20.	Show top 2 highest paying job titles based on average salary.

SELECT job_title,
AVG(salary_in_usd) AS ARG_SALARY
FROM salaries
GROUP BY job_title
ORDER BY job_title DESC
LIMIT 2;

-- 21. Show the average salary of fully remote (100) and on-site (0) employees for each experience level.

SELECT 
    experience_level,
    remote_ratio,
    AVG(salary) AS average_salary
FROM salaries
WHERE remote_ratio IN (0, 100)
GROUP BY experience_level, remote_ratio
ORDER BY experience_level, remote_ratio;

-- Show employees with salary_in_usd between 90000 and 200000.

SELECT salary_in_usd
FROM salaries
where salary_in_usd > 90000 and salary_in_usd < 200000;

-- Display employees working location in 'AU'.

select *
from salaries
where company_location = 'au';

-- Count employees per employment_type.

select employment_type,
count(*) AS EMP_COUNT
from salaries
group by employment_type;

-- Show average salary per employment_type.

select employment_type,
AVG(salary_in_usd) as AVG_SALARY
from salaries
group by employment_type;

-- INTERMEDIATE (SUBQUERY + LOGIC BUILDING)

--  21.Find employees who earn more than overall average salary.

select salary_in_usd
from salaries
where salary_in_usd > (select 
AVG(salary_in_usd)from salaries);

-- 22.	Find employees who earn more than average salary of their own job_title.

select
AVG(salary_in_usd) 
from salaries;


select job_title,
avg(salary_in_usd) AS avg_salary
from salaries
 where salary_in_usd > (select
AVG(salary_in_usd) 
from salaries) 
group by job_title;

-- 23.	Find second highest salary in the table.

SELECT MAX(salary_in_usd) 
FROM salaries
WHERE salary_in_usd < (SELECT MAX(salary_in_usd) FROM salaries);


--  Subquery-Based Questions Start level 1 (10)
SELECT *
FROM salaries;

-- 1. Find employees whose salary_in_usd is greater than the average salary.

SELECT *
FROM salaries
where salary_in_usd > (SELECT 
AVG(salary_in_usd)
FROM salaries);

-- 2. Find employees who earn the maximum salary_in_usd.

select *
from salaries
where salary_in_usd = (select
max(salary_in_usd)
from salaries);

-- 3. Find employees who earn the minimum salary_in_usd.

select *
from salaries
where salary_in_usd = (SELECT 
MIN(salary_in_usd)
from salaries);

-- 4. Find the second highest salary_in_usd using subquery.

select max(salary_in_usd) AS SECEND_MAX
FROM salaries
where salary_in_usd < (SELECT 
max(salary_in_usd)
from salaries);

select *
from salaries
order by SALARY_IN_USD DESC
limit 1
offset 1;

-- 5. Find employees earning more than average salary in 2023.

select *
from salaries
where work_year = 2023
AND salary_in_usd > (select 
avg(salary_in_usd)
from salaries
where work_year = 2023);

-- 6. Find employees whose salary is above company overall (>) average.

select *
from salaries
where salary_in_usd > (select 
AVG(salary_in_usd)
FROM salaries);

-- 7. Find employees earning more than salary of a 'Data Scientist'.
select *
from salaries
where salary_in_usd > (select 
avg(salary_in_usd)
from salaries
where job_title = 'Data scientist');

-- 8. Find employees whose salary equals minimum salary in 2022.

select *
from salaries
where work_year = 2022
and salary_in_usd = (select
min(salary_in_usd)
from salaries);

-- 9. Find employees earning more than average salary of 'Full-time' employees.

select *
from salaries
where remote_ratio = '0'
and salary_in_usd > (select 
avg(salary_in_usd)
from salaries);

-- 10. Find employees whose salary is between minimum and maximum salary.

select *
from salaries
where salary_in_usd < (select 
max(salary_in_usd)
from salaries)
 and salary_in_usd > 
(select 
min(salary_in_usd)
from salaries);

SELECT *
FROM salaries
WHERE salary_in_usd > (SELECT MIN(salary_in_usd) FROM salaries)
AND salary_in_usd < (SELECT MAX(salary_in_usd) FROM salaries);

-- level 2 (10)

-- 11. Find employees whose salary is greater than ALL salaries of 'Junior' level employees.

select *
from salaries
where salary_in_usd > (select
salary_in_usd
from salaries
where experience_level = 'en');


select experience_level,
salary_in_usd
from salaries
where experience_level = 'en';

-- 12. Find employees whose salary is greater than ANY salary of 'Part-time' employees

SELECT *
FROM salaries
WHERE salary_in_usd > ANY (
    SELECT salary_in_usd
    FROM salaries
    WHERE employment_type = 'PT'
);

select employment_type, salary_in_usd
from salaries
where employment_type = 'PT'
ORDER BY salary_in_usd DESC;


-- 13. Find employees whose salary matches any salary of 'Data Analyst'.

select *
from salaries
where salary_in_usd = any(select salary_in_usd
from salaries
where job_title = 'Data Analyst');

-- 14. Find employees earning more than average salary in 'US'.

select *
from salaries
where salary_in_usd > (select 
avg(salary_in_usd)
from salaries
where company_location = 'US');

-- 15. Find employees whose salary is not equal to any salary in 2021

select *
from salaries
where salary_in_usd not in (select
salary_in_usd
from salaries
where work_year = '2021');

-- 16. Find job titles where average salary is greater than 100,000 USD.

select job_title,
avg(salary_in_usd) AS avg_salary
from salaries
group by job_title
having avg(salary_in_usd) > 100000;

-- 17. Find employees whose salary is higher than average salary of their country.

select company_location,
avg(salary_in_usd)
from salaries
group by company_location;




-- FUNCTION QUESTION START

--  NUMERIC QUESTION 

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    age INT,
    experience INT
);

INSERT INTO employees VALUES
(1, 'Amit', 5000.50, 500, 25, 2),
(2, 'Rahul', 7200.75, 800, 30, 5),
(3, 'John', 10000.20, 1000, 35, 8),
(4, 'Sara', 4500.10, 300, 28, 3),
(5, 'Ali', 9000.90, 1200, 40, 10),
(6, 'Neha', 6500.60, 700, 27, 4),
(7, 'Ravi', 3000.30, 200, 22, 1),
(8, 'Priya', 11000.80, 1500, 38, 9),
(9, 'Karan', 8000.40, 900, 33, 6),
(10, 'Anita', 5500.55, 600, 29, 4);

SELECT *
FROM employees;

-- 1. Round salary

SELECT salary AS ORG_SALARY,
round(salary) AS ROUND_SALARY
FROM employees;  

-- 2 Ceil salary

SELECT  
salary AS ORG_SALARY,
ceil(salary) AS CEIL_SALARY,
round(salary) AS ROUND_SALARY
FROM employees;

-- 3. Floor salary

SELECT  
salary AS ORG_SALARY,
ceil(salary) AS CEIL_SALARY,
round(salary) AS ROUND_SALARY,
floor(salary) AS FLOOR_SALARY
FROM employees;

--  4. ABSOLUTE (Abs) salary

SELECT  
salary AS ORG_SALARY,
abs(salary) AS ABSOLUTE_SALARY
FROM employees;

-- 5. Truncate salary

SELECT 
salary,
truncate(salary, 0) AS TRUNCATE_SALARY
FROM employees;

-- 6. Power salary
SELECT 
salary AS ORG_SALARY,
power(salary,2) AS POWER_SALARY,
power(salary,1/2) AS POWER2_SALARY
FROM employees;



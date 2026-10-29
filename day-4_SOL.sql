USE db;

SELECT *
FROM salaries;

-- all the entries from  company_location column
SELECT company_location
FROM salaries;

-- get all the unique entries from company_location column
SELECT DISTINCT company_location
FROM salaries;

SELECT DISTINCT work_year, experience_level
FROM salaries
ORDER BY work_year ASC, experience_level DESC;

-- Aggregate Functions
/*
MIN, MAX, SUM, COUNT, AVG
*/

-- GET THE MAXIMUM SALARY FROM THE TABLE

SELECT *
FROM salaries
ORDER BY salary_in_usd DESC
LIMIT 1;

SELECT MAX(salary_in_usd) AS MAXIMUM_SALARY
FROM salaries;  

SELECT job_title AS DESIGNATIONS
FROM salaries;

SELECT
MIN(salary_in_usd) AS MINIMUM_SALARY,
    MAX(salary_in_usd) AS MAXIMUM_SALARY,
    SUM(salary_in_usd) AS TOTAL_SALARY,
    AVG(salary_in_usd) AS AVERAGE_SALARY,
    COUNT(*) AS TOTAL_EMPLOYEES
FROM salaries;  

SELECT DISTINCT experience_level
FROM salaries;  

SELECT experience_level, AVG(salary_in_usd) AS AVERAGE_SALARY_PER_EXPERIENCE_LEVEL
FROM salaries
GROUP BY experience_level;  

SELECT
    job_title,
    MIN(salary_in_usd) AS MINIMUM_SALARY,
    MAX(salary_in_usd) AS MAXIMUM_SALARY,
    SUM(salary_in_usd) AS TOTAL_SALARY,
    AVG(salary_in_usd) AS AVERAGE_SALARY,
    COUNT(*) AS TOTAL_EMPLOYEES
FROM
    salaries
GROUP BY job_title
ORDER BY TOTAL_EMPLOYEES DESC;





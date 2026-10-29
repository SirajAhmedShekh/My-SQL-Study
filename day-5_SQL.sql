USE db;

SELECT * FROM salaries; 

SELECT work_year, COUNT(*) AS EMPLOYEE_COUNT_PER_YEAR
FROM salaries 
GROUP BY work_year 
ORDER BY EMPLOYEE_COUNT_PER_YEAR DESC
LIMIT 1; 

SELECT work_year
FROM salaries 
GROUP BY work_year 
ORDER BY COUNT(*) DESC
LIMIT 1; 

SELECT 
    job_title,
    AVG(salary_in_usd) AS AVERAGE_SALARY,
    COUNT(*) AS TOTAL_EMPLOYEES, 
    MIN(salary_in_usd) AS MINIMUM_SALARY, 
    MAX(salary_in_usd) AS MAXIMUM_SALARY 
FROM
    salaries
GROUP BY job_title
HAVING AVERAGE_SALARY >= 100000 AND TOTAL_EMPLOYEES >= 10
ORDER BY TOTAL_EMPLOYEES ASC; 

SELECT 
    job_title,
    AVG(salary_in_usd) AS AVERAGE_SALARY,
    COUNT(*) AS TOTAL_EMPLOYEES, 
    MIN(salary_in_usd) AS MINIMUM_SALARY, 
    MAX(salary_in_usd) AS MAXIMUM_SALARY 
FROM
    salaries
GROUP BY job_title
HAVING AVG(salary_in_usd) >= 100000 AND COUNT(*) >= 10
ORDER BY TOTAL_EMPLOYEES ASC; 


-- GET THE MINIMUM AND MAXIMUM SALARY FOR ALL THE JOB_ROLES WHO ARE HIRED IN THE YEAR 2023 such that the minimum salary must be greater than 100000 

SELECT job_title, MIN(salary_in_usd) AS MINIMUM_SALARY, MAX(salary_in_usd) AS MAXIMUM_SALARY 
FROM salaries 
WHERE work_year = 2023
GROUP BY job_title 
HAVING MIN(salary_in_usd) > 100000
ORDER BY MIN(salary_in_usd); 


SELECT job_title, count(*) 
FROM salaries 
GROUP BY job_title
ORDER BY count(*) DESC; 

-- Creating a variable to store the average salary of data engineers

SET @AVG_SAL_DE = (SELECT AVG(salary_in_usd)
FROM salaries 
WHERE job_title = 'Data Engineer'
);  

SELECT * 
FROM salaries 
WHERE job_title = 'Data Engineer' AND salary_in_usd > @AVG_SAL_DE;  

-- Alternative Approach --> Sub-Query (Not For Now)

SELECT * 
FROM salaries 
WHERE job_title = 'Data Engineer' AND salary_in_usd > (SELECT AVG(salary_in_usd)
FROM salaries 
WHERE job_title = 'Data Engineer');  


-- 

SET @EMP_THRESHOLD = 100; 

-- adding a new colome

SELECT work_year, experience_level, job_title, salary_in_usd, remote_ratio,
(salary_in_usd * 0.10) AS standard_salary_bonus,
(salary_in_usd * 1.10) AS final_salary
FROM 
salaries;


SELECT work_year, experience_level, job_title, salary_in_usd, remote_ratio,
CASE
WHEN remote_ratio = 100 THEN salary_in_usd * 0.15
WHEN remote_ratio = 50 THEN salary_in_usd * 0.11
ELSE salary_in_usd * 0.08
END AS CUSTOM_SALARY_BONUS
FROM 
salaries; 


SELECT job_title, COUNT(*) AS TOTAL_EMPLOYEES 
FROM salaries 
GROUP BY job_title
HAVING COUNT(*) > @EMP_THRESHOLD
ORDER BY COUNT(*) ASC; 

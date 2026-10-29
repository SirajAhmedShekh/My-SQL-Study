USE db;

SELECT * 
FROM salaries;

-- Adding a new column

SELECT 
 work_year, experience_level, job_title, salary_in_usd, remote_ratio, 
    (salary_in_usd * 0.10) AS standard_salary_bonus, 
    (salary_in_usd * 1.10) AS final_salary 
FROM
    salaries; 
    
SELECT 
work_year, experience_level, job_title, salary_in_usd, remote_ratio,
CASE
WHEN experience_level = 'EN' THEN salary_in_usd * 0.07
WHEN experience_level = 'MI' THEN salary_in_usd * 0.12
WHEN experience_level = 'SE' THEN salary_in_usd * 0.15
ELSE salary_in_usd * 0.20
END AS CUSTOM_SALARY_BOMUS
FROM 
salaries
HAVING 
CUSTOM_SALARY_BONUS > 5000;


SET @AVG_SAL_DE = (SELECT AVG(salary_in_usd)
FROM salaries
WHERE job_title = 'Data Engineer');


SELECT * 
FROM salaries 
WHERE job_title = 'Data Engineer' AND salary_in_usd > @AVG_SAL_DE;  


SET @AVG_SAL_MLE = (SELECT AVG(salary_in_usd)
FROM salaries 
WHERE job_title = 'Machine Learning Engineer'); 

SELECT * FROM salaries 
WHERE job_title = 'Machine Learning Engineer'
        AND salary_in_usd > 
        (SELECT AVG(salary_in_usd)
        FROM salaries
        WHERE job_title = 'Machine Learning Engineer'); 
       
SET @MLM_MAX = (SELECT MAX(salary_in_usd) FROM salaries WHERE job_title = 'Machine Learning Manager');  

SELECT @MLM_MAX AS MACHINE_LEARNING_MANAGER_MAXIMUM_SALARY;  
       
SELECT job_title
FROM salaries 
GROUP BY job_title 
HAVING MIN(salary_in_usd) > 
	(SELECT MAX(salary_in_usd) 
		FROM salaries 
        WHERE job_title = 'Machine Learning Manager');   

SELECT job_title 
FROM 
(SELECT job_title , COUNT(*) AS EMPLOYEE_COUNT 
FROM salaries 
GROUP BY job_title
HAVING EMPLOYEE_COUNT BETWEEN 10 AND 20 
) AS T; 

SELECT * 
FROM salaries 
WHERE job_title IN (SELECT job_title 
FROM 
(
SELECT job_title , COUNT(*) AS EMPLOYEE_COUNT 
FROM salaries 
GROUP BY job_title
HAVING EMPLOYEE_COUNT BETWEEN 10 AND 20 ) 
AS T
); 


-- Adding a new column 

SELECT 
    work_year, experience_level, job_title, salary_in_usd, remote_ratio, 
    (salary_in_usd * 0.10) AS standard_salary_bonus, 
    (salary_in_usd * 1.10) AS final_salary 
FROM
    salaries; 
    
SELECT 
    work_year, experience_level, job_title, salary_in_usd, remote_ratio, 
    CASE 
		WHEN experience_level = 'EN' THEN salary_in_usd * 0.07
        WHEN experience_level = 'MI' THEN salary_in_usd * 0.12
        WHEN experience_level = 'SE' THEN salary_in_usd * 0.15
        ELSE salary_in_usd * 0.20 
	END AS CUSTOM_SALARY_BONUS
FROM 
	salaries
HAVING 
	CUSTOM_SALARY_BONUS > 5000; 
    
    
SET @AVG_SAL_DE = (SELECT AVG(salary_in_usd)
FROM salaries 
WHERE job_title = 'Data Engineer'
);  

SELECT * 
FROM salaries 
WHERE job_title = 'Data Engineer' AND salary_in_usd > @AVG_SAL_DE;  


SET @AVG_SAL_MLE = (SELECT AVG(salary_in_usd)
FROM salaries 
WHERE job_title = 'Machine Learning Engineer'); 

SELECT * FROM salaries 
WHERE job_title = 'Machine Learning Engineer'
        AND salary_in_usd > 
        (SELECT AVG(salary_in_usd)
        FROM salaries
        WHERE job_title = 'Machine Learning Engineer'); 
       
SET @MLM_MAX = (SELECT MAX(salary_in_usd) FROM salaries WHERE job_title = 'Machine Learning Manager');  

SELECT @MLM_MAX AS MACHINE_LEARNING_MANAGER_MAXIMUM_SALARY;  
       
SELECT job_title
FROM salaries 
GROUP BY job_title 
HAVING MIN(salary_in_usd) > 
	(SELECT MAX(salary_in_usd) 
		FROM salaries 
        WHERE job_title = 'Machine Learning Manager');   

SELECT job_title 
FROM 
(
SELECT job_title , COUNT(*) AS EMPLOYEE_COUNT 
FROM salaries 
GROUP BY job_title
HAVING EMPLOYEE_COUNT BETWEEN 10 AND 20 
) AS T; 

SELECT * 
FROM salaries 
WHERE job_title IN (SELECT job_title 
FROM 
(
SELECT job_title , COUNT(*) AS EMPLOYEE_COUNT 
FROM salaries 
GROUP BY job_title
HAVING EMPLOYEE_COUNT BETWEEN 10 AND 20 
) AS T
); 


SELECT * FROM salaries; 

-- Get the top 5 countries where you can get the highest average salary for the year 2024 


SELECT company_location 
FROM 
(
SELECT company_location, AVG(salary_in_usd)  
FROM salaries
WHERE work_year = 2024
GROUP BY company_location
ORDER BY AVG(salary_in_usd) DESC
LIMIT 5
) AS T; 


SELECT 
    *
FROM
    salaries
WHERE
    company_location = 'MX'
        OR company_location = 'US'
        OR company_location = 'CA'
        OR company_location = 'EG'
        OR company_location = 'NZ'; 

SELECT 
    *
FROM
    salaries
WHERE
    company_location IN ("MX", "CA", "US", "EG", "NZ"); 


SELECT * FROM salaries 
WHERE company_location IN 
(SELECT company_location 
FROM 
(
SELECT company_location, AVG(salary_in_usd)  
FROM salaries
WHERE work_year = 2024
GROUP BY company_location
ORDER BY AVG(salary_in_usd) DESC
LIMIT 5
) AS T); 


SELECT * FROM salaries;  

-- FETCH TOP 5 JOB ROLES WHERE MAXIMUM EMPLOYEES GET WORK FROM HOME 

SELECT job_title, salary_in_usd, company_location 
FROM salaries 
WHERE job_title IN 
(
SELECT job_title 
FROM 
(
SELECT job_title, COUNT(*) AS EMPLOYEE_COUNT 
FROM salaries 
WHERE remote_ratio = 100 
GROUP BY job_title 
ORDER BY COUNT(*) DESC
LIMIT 5
) AS T
);

    


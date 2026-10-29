USE db;


SELECT *
FROM salaries;

-- CHECK ALL THE EXISTING TABLES 
SHOW TABLES;  

-- check a few entries 

SELECT * 
FROM salaries; 

-- Logical Operator 

/*
	DISPLAY ALL EMPLOYESS WHOSE EXPERIENCE LEVEL IS 
	ENTRY LEVEL AND SALARY GREATER THAN 100000.  
*/

SELECT * 
FROM salaries 
WHERE experience_level = 'EN'; 

SELECT * 
FROM salaries 
WHERE salary_in_usd > 100000; 

SELECT 
    DISTINCT job_title
FROM
    salaries
WHERE
    salary_in_usd > 100000
        AND experience_level = 'EN'
        AND work_year = 2024; 
        
/*
DISPLAY ALL EMPLOYEES WHOSE EXPERIENCE LEVEL IS EITHER EN OR MI
*/

SELECT *
FROM salaries 
WHERE experience_level = 'EN' OR experience_level = 'MI'; 

/*
DISPLAY ALL EMPLOYESS WHO EITHER HAVE WORK FROM HOME
 OR HAVE SALARY GREATER THAN 100000. 
*/

SELECT * 
FROM salaries 
WHERE salary_in_usd > 100000 OR remote_ratio = 100;

/*
DISPLAY EMPLOYEE HAVING SALARY GREATER THAN 100000 AND
 ENJOY FULLY REMOTE JOB
*/

SELECT * 
FROM salaries 
WHERE remote_ratio = 100 AND salary_in_usd > 100000; 

/*
display all all employees who does not work in small company 
*/

SELECT DISTINCT company_size 
FROM salaries;

SELECT * 
FROM salaries 
WHERE NOT company_size = 's';  

SELECT * 
FROM salaries 
WHERE company_size != 's';  

/*
DISPLAY ALL EMPLOYEES HAVING SALARY GREATER THAN 100000 
BUT JOB TITLE COUNT BE EITHER DATA ANALYST OR DATA SCIENTIST
*/




-- Range Operator 

-- Select All EmpLoyees having salary greater than 1 lakh and less than 2 lakh 

SELECT * 
FROM salaries 
WHERE salary_in_usd > 100000 AND salary_in_usd < 200000;

-- Select All EmpLoyees having salary between 1 lakh and 2 lakh 

SELECT * 
FROM salaries 
WHERE salary_in_usd >= 100000 AND salary_in_usd <= 200000;

SELECT * 
FROM salaries 
WHERE salary_in_usd BETWEEN 100000 AND 200000; 

-- membership operator 

SELECT * 
FROM salaries 
WHERE job_title = 'AI Engineer'; 

SELECT * 
FROM salaries 
WHERE job_title = 'Data Scientist'; 

SELECT * 
FROM salaries 
WHERE job_title = 'Data Analyst'; 

SELECT * 
FROM salaries 
WHERE job_title = 'AI Engineer'; 

SELECT *
FROM salaries
WHERE job_title = 'AI Engineer' OR job_title = 'Data Analyst' OR job_title = 'Data Scientist'; 

SELECT * 
FROM salaries 
WHERE job_title NOT IN ('AI Engineer', 'Data Analyst', 'Data Scientist'); 

-- Searching 

SELECT * 
FROM salaries; 

SELECT DISTINCT job_title
FROM salaries 
WHERE job_title LIKE '%Analyst'; 

SELECT DISTINCT job_title
FROM salaries 
WHERE job_title LIKE 'Data%'; 

SELECT DISTINCT job_title
FROM salaries 
WHERE job_title LIKE '%Data%'; 

SELECT DISTINCT employment_type 
FROM salaries;  

SELECT DISTINCT employment_type 
FROM salaries
WHERE employment_type LIKE '_T';  

SELECT DISTINCT employment_type 
FROM salaries
WHERE NOT employment_type LIKE '_T';

SELECT *
FROM salaries
WHERE NOT employment_type LIKE '_T';    

-- Sorting 

SELECT * 
FROM salaries
ORDER BY salary_in_usd ; 

SELECT * 
FROM salaries
ORDER BY salary_in_usd DESC; 

-- mULTIPLE SORTING 

SELECT * 
FROM salaries 
ORDER BY work_year, job_title DESC, salary_in_usd; 

-- GET THE TOP 5 SALARY EARNERS  FROM THE GIVEN TABLE 

SELECT * 
FROM salaries
ORDER BY salary_in_usd DESC
LIMIT 5;  

-- GET THE SALARY RANKING FROM 6 TO 10 

SELECT * 
FROM salaries
ORDER BY salary_in_usd DESC
LIMIT 5
OFFSET 5;  

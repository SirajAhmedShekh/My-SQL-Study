USE db;

/*
Case Study 

*/

/*
1.You're a Compensation analyst employed by a 
multinational corporation. Your Assignment is to 
Pinpoint Countries who give work fully remotely, 
for the title 'managers’ Paying salaries Exceeding 
$90,000 USD
*/

SELECT DISTINCT
    company_location
FROM
    salaries
WHERE
    salary_in_usd > 90000
        AND remote_ratio = 100
        AND job_title LIKE '%manager%'; 
        
        
/*
2.AS a remote work advocate Working for a progressive HR tech 
startup who place their freshers’ clients IN large tech firms. 
you're tasked WITH Identifying top 5 Country Having greatest 
count of large companies.
*/

SELECT company_location
FROM 
(
SELECT company_location, COUNT(company_size) AS LARGE_TECH_FIRM_COUNT
FROM salaries 
WHERE experience_level = 'EN' AND company_size = 'L'
GROUP BY company_location
ORDER BY LARGE_TECH_FIRM_COUNT DESC
LIMIT 5
) AS T ; 

-- ALTERNATIVE APPROACH 

SELECT company_location
FROM salaries 
WHERE experience_level = 'EN' AND company_size = 'L'
GROUP BY company_location
ORDER BY COUNT(company_size) DESC
LIMIT 5; 

/*
3.Picture yourself AS a data scientist Working for a workforce 
management platform. Your objective is to calculate the percentage 
of employees. Who enjoy fully remote roles WITH salaries Exceeding 
$100,000 USD, Shedding light ON the attractiveness of high-paying 
remote positions IN today's job market.
*/
SELECT 
(
SELECT COUNT(*) 
FROM salaries
WHERE salary_in_usd >= 100000 AND remote_ratio = 100) /
(
SELECT COUNT(*) 
FROM salaries
WHERE salary_in_usd >= 100000 
) * 100 AS RATIO ;  

-- ALTERNATIVE METHOD 

SET @WFH_EMP = (SELECT COUNT(*) 
FROM salaries
WHERE salary_in_usd >= 100000 AND remote_ratio = 100);  


SET @TOTAL_EMP = (SELECT COUNT(*) 
FROM salaries
WHERE salary_in_usd >= 100000 );  

SET @PERCENTAGE = (@WFH_EMP / @TOTAL_EMP) * 100; 

SELECT 
    @WFH_EMP AS WORK_FROM_HOME_EMPLOYEES,
    @TOTAL_EMP AS TOTAL_EMPLOYEES, 
	CONCAT(ROUND(@PERCENTAGE, 2), '%') AS PERCENTAGE; 


/*
4.Imagine you're a data analyst Working for a global 
recruitment agency. Your Task is to identify the Locations 
where entry-level average salaries exceed the average salary 
for that job title in the market for entry level, helping your agency 
guide candidates towards lucrative(attractive) opportunities.
*/

SELECT T1.job_title, T2.company_location 
FROM 
(
SELECT job_title, ROUND(AVG(salary_in_usd), 2) AS GLOBAL_AVERAGE_SALARY 
FROM salaries 
WHERE experience_level = 'EN'
GROUP BY job_title
) AS T1 
JOIN 
( 
SELECT job_title, company_location, ROUND(AVG(salary_in_usd), 2) AS COUNTRY_WISE_AVERAGE_SALARY 
FROM salaries 
WHERE experience_level = 'EN'
GROUP BY job_title, company_location
) AS T2 
ON T1.job_title = T2.job_title
WHERE COUNTRY_WISE_AVERAGE_SALARY > GLOBAL_AVERAGE_SALARY; 
   
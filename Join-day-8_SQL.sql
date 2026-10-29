use db2;
show tables;

SELECT * FROM naruto; 

SELECT * FROM dragon_ball; 

-- LEFT JOIN 

SELECT *
FROM naruto 
LEFT JOIN dragon_ball 
ON naruto.ranking = dragon_ball.ranking ; 

SELECT * 
FROM naruto AS N 
LEFT JOIN dragon_ball AS D
ON N.ranking = D.ranking; 

-- RIGHT JOIN 

SELECT *
FROM naruto 
RIGHT JOIN dragon_ball 
ON naruto.ranking = dragon_ball.ranking;  

SELECT *
FROM naruto AS N
RIGHT JOIN dragon_ball AS D
ON N.ranking = D.ranking;  

-- INNER JOIN 

SELECT naruto.ranking, naruto.name, dragon_ball.ninja_level
FROM naruto 
INNER JOIN dragon_ball 
ON naruto.ranking = dragon_ball.ranking;  

SELECT N.ranking, N.name, D.ninja_level
FROM naruto AS N 
INNER JOIN dragon_ball AS D 
ON N.ranking = D.ranking;  

SELECT N.ranking, N.name, D.ninja_level
FROM naruto AS N 
JOIN dragon_ball AS D 
ON N.ranking = D.ranking;  

-- FULL OUTER JOIN 

SELECT * 
FROM naruto AS N 
LEFT JOIN dragon_ball AS D 
ON N.ranking = D.ranking; 


SELECT * 
FROM naruto AS N 
RIGHT JOIN dragon_ball AS D 
ON N.ranking = D.ranking;  

-- Set Operation (UNION, UNION ALL, EXCEPT, INTERSECT) 

SELECT * 
FROM naruto AS N 
LEFT JOIN dragon_ball AS D 
ON N.ranking = D.ranking 
UNION ALL 
SELECT * 
FROM naruto AS N 
RIGHT JOIN dragon_ball AS D 
ON N.ranking = D.ranking;  

SELECT * 
FROM naruto AS N 
LEFT JOIN dragon_ball AS D 
ON N.ranking = D.ranking 
UNION 
SELECT * 
FROM naruto AS N 
RIGHT JOIN dragon_ball AS D 
ON N.ranking = D.ranking; 

-- LEFT EXCLUSIVE JOIN 

SELECT * 
FROM naruto AS N 
LEFT JOIN dragon_ball AS D 
ON N.ranking = D.ranking
WHERE D.ranking IS NULL; 

-- RIGHT EXCLUSIVE JOIN 

SELECT * 
FROM naruto AS N 
RIGHT JOIN dragon_ball AS D 
ON N.ranking = D.ranking
WHERE N.ranking IS NULL; 

-- FULL OUTER EXCLUSIVE JOIN 

SELECT * 
FROM naruto AS N 
LEFT JOIN dragon_ball AS D 
ON N.ranking = D.ranking
WHERE D.ranking IS NULL

UNION 

SELECT * 
FROM naruto AS N 
RIGHT JOIN dragon_ball AS D 
ON N.ranking = D.ranking
WHERE N.ranking IS NULL; 


-- Connection of Tables 

SELECT T3.name, T3.email, T3.phone_number, PR.product_name, PR.category, T3.total_amount, T3.payment_date, T3.payment_type, T3.rating, T3.review_text, T3.review_date 
FROM 
(
SELECT T2.name, T2.email, T2.phone_number, T2.order_date, T2.total_amount, T2.payment_type, T2.payment_date, R.rating, R.review_text, R.review_date, R.product_id  
FROM 
(
SELECT T.customer_id, T.name, T.email, T.phone_number, T.order_date, T.total_amount, P.payment_type, P.payment_date 
FROM 
(
SELECT C.name, C.email, C.phone_number, O.order_date, O.total_amount, C.customer_id, O.order_id
FROM customers AS C 
JOIN orders AS O 
ON C.customer_id = O.customer_id
) AS T
JOIN payments AS P 
ON P.order_id = T.order_id
) AS T2
JOIN reviews AS R 
ON T2.customer_id = R.customer_id
) AS T3
JOIN products AS PR
ON T3.product_id = PR.product_id;  


-- FINAL APPROACH 

SELECT *
FROM customers AS C 
JOIN orders AS O
ON C.customer_id = O.customer_id  
JOIN payments AS P 
ON O.order_id = P.order_id 
JOIN reviews AS R 
ON R.customer_id = C.customer_id 
JOIN products AS PR 
ON PR.product_id = R.product_id; 



-- Display all the employees who earn more than the average salary for that designation 

SELECT job_title, AVG(salary_in_usd) AS AVERAGE_SALARY 
FROM salaries 
GROUP BY job_title; 

SELECT * 
FROM salaries
JOIN (SELECT job_title, AVG(salary_in_usd) AS AVERAGE_SALARY 
FROM salaries 
GROUP BY job_title) AS T 
ON salaries.job_title = T.job_title
WHERE salary_in_usd > AVERAGE_SALARY;   
 

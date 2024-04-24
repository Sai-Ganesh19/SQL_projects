
-- 1) show all column and row in the table
SELECT * FROM salaries;

-- 2) Show only employee name and job title columns
SELECT EmployeeName,JobTitle
FROM salaries;

-- 3) show the number of employees in the table
SELECT count(*) from salaries;

-- 4) show the unique job titles in the table
SELECT DISTINCT JobTitle
FROM salaries;

-- 5) show the job title and overview pay for all employees with
-- overtime pay greater than 50000

SELECT JobTitle,OvertimePay
FROM salaries
WHERE OvertimePay > 50000;

-- 6)show the average base pay for all employees

SELECT AVG(BasePay) AS avg_base_pay
FROM salaries;

-- 7) show top 10 highest paid employees
SELECT EmployeeName,TotalPay
FROM salaries
ORDER BY TotalPay DESC
LIMIT 10;

-- 8) show the avg of basepay,overtimepay,and otherpay for each employee

SELECT EmployeeName,avg(BasePay),avg(OvertimePay),avg(OtherPay)
FROM salaries
group by EmployeeName;

SELECT EmployeeName,(BasePay+OvertimePay+OtherPay)/3
FROM salaries;

-- 9) show all employees who have the word "manager" in their job title

SELECT EmployeeName,JobTitle
FROM salaries
wHERE JobTitle LIKE '%Manager%';

-- 10) show all employees with a job title not equal to "mamnager"

SELECT EmployeeName,JobTitle
FROM salaries
wHERE JobTitle !='%Manager%';

-- 11) SHOW ALL EMPLOYEES WITH A TOTAL PAY BETWEEN 50,000 AND 75,000

SELECT*
FROM salaries
WHERE TotalPay BETWEEN 50000 AND 75000;

-- 12) show all  employees with a base pay less than 50,000
-- or a total pay greater than 100,000

SELECT *
FROM salaries
WHERE BasePay<50000 OR TotalPay>100000;

-- 13) show all the employees with a total pay benefits values
-- between 125,000 and 150,000 and a job title containing the word "director".

 SELECT *
 FROM salaries
 WHERE TotalPayBenefits BETWEEN 125000 AND 150000
 AND JobTitle like '%Director%';
 
 -- 14) show all employees order by their total pay benefits in descending order;
 SELECT *
 FROM salaries
 ORDER BY TotalPayBenefits DESC;
 
 -- 15) show all job titles with an average base pay of
 -- atleast 100,000 and order them by the average base pay in descending order
SELECT JobTitle,AVG(BasePay) avg_base_pay
FROM salaries
GROUP BY JobTitle
HAVING AVG(BasePay)>=100000
ORDER BY avg_base_pay DESC;

-- 16) delete the column
SELECT *FROM salaries;
ALTER TABLE salaries
DROP COLUMN Notes;
SELECT *FROM salaries;

-- 17) update the basee pay of all employees with
-- the job title containing "manager" by increasing it by 10%
SET SQL_SAFE_UPDATES = 0;

UPDATE salaries
set BasePay=BasePay*1.1
where JobTitle like '%Manager%';
SELECT *FROM salaries;

-- 18)delete all employees who have no overtimepay
SELECT count(*) FROM salaries
where OvertimePay=0;

delete from salaries
where OvertimePay =0;












CREATE DATABASE titanic_project;
-- 1. show the first 10 rows of the dataset.
SELECT * 
FROM titanic
LIMIT 10;

-- LAST 10 ROWS
SELECT * 
FROM titanic
ORDER BY ï»¿PassengerId DESC
LIMIT 10;

-- 2. find the number of passengers who survived.
SELECT COUNT(Survived) as pass_survived
from titanic
WHERE Survived=1
;

-- 3. find the average age of all passenger
SELECT * 
FROM titanic;

SELECT AVG(age) as avg_age
from titanic;

-- 4.find the number of passengers in each class

SELECT Pclass,count(Pclass)
from titanic
group by Pclass;

-- 5. find the first 10 rows of the dataset sorted by passenger class in descending order

SELECT *
from titanic
ORDER BY Pclass DESC
limit 10;

-- 6. find the number of passengers in each class sorted by class in assending order
SELECT Pclass,count(Pclass)
FROM titanic
group by Pclass
ORDER BY Pclass asc;

-- 7. find the average fare paid by passenger in each class
select * from titanic;

select Pclass,AVG(Fare)
from titanic
group by Pclass;

-- 8. find the name of the passenger with the highest fare
SELECT max(fare)
from titanic;

select name,fare from titanic
where fare=(select max(fare) from titanic);

-- 9. Find the name of the passenger who had the highest age among the survivors
SELECT * FROM titanic;
select name,age from titanic
where age=(select max(age) from titanic where survived=1);

-- 10. find the number of passenger who paid more than average fare.

select count(*) as no_passengers from titanic
where fare > (select avg(fare) from titanic);

-- 11. find the name of the passenger who had the most parents or children on board
select*from titanic ;
select name from titanic
where parch=(select max(parch) from titanic);

-- 12. find the number of male and female passengers who survived
-- and order the result by sex in ascending order

select  sex,count(*)  as no_survived from titanic
where survived =1
group by sex
order by sex asc;

-- 13. find the name,age, and fare of the oldest passenger who survived.

select name,age,fare from titanic
where age=(select max(age) from titanic where survived=1);

-- 14. find the name and age of the youngest female passenger who survived in third class.
select name,age from titanic
where  sex='female'  and survived=1 and Pclass=3 and age=(select min(age) from titanic where  sex='female' and survived=1 and Pclass=3);

-- 15.find the number of male and female passengers.
select sex, count(*) from titanic
group by sex;

-- using case statement
select 
sum(case when sex='male' then 1 else 0 end) as no_male,
sum(case when sex='female' then 1 else 0 end) as no_female
from titanic;

-- 16. select all passengers who travelled in a cabin that was not shared by other passengers.
select * from titanic where cabin not in (select cabin from titanic group by cabin
having count(*)>1);














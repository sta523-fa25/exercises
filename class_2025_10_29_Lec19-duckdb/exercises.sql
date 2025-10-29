# Exercise 1

## 1. The total costs in payroll for this company

SELECT SUM(salary) FROM employees;

SELECT dept, SUM(salary) FROM employees GROUP BY dept;

## 2. The average salary within each department

SELECT dept, MEAN(salary) FROM employees GROUP BY dept;

SELECT dept, ROUND(AVG(salary),2) FROM employees GROUP BY dept;

# Exercise 2

SELECT name, email, 
  ROUND(avg_salary,2) AS avg_salary, 
  ROUND(salary-avg_salary,2) AS abv_avg
  FROM employees 
  NATURAL JOIN (
    SELECT dept, MEAN(salary) AS avg_salary FROM employees GROUP BY dept
  );





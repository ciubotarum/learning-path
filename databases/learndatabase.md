
# LEARN DATABASES

## Database

Definition:
* any collection of related information

### Types of Databases

#### Relational Databases

* helps organize data into tables
* each table has rows and columns and unique key that identufies each rows

#### Non-Relational Databases

* NoSQL or Not Just SQL
* organize data into everything but traditional tables
    * key-value stores
    * JSON
    * XML
    * graph

## Database Management System (DBMS)

Definition:
* software program that helps you create and maintain databases

When/why use it:
* C.R.U.D (Create,Read/Retrive, Update, Delete)
* security
* backups
* import/expor data

## Approaches to processing data

### OLTP (Online Transaction Processing)
Focuses on day to day operations.
Uses operational databases

* Use cases
    * find the price of a book
    * update latest customer transaction
    * keep track of employee hours
  

### OLAP (Online Analytical Processing)
Focused on bussiness decision making
Uses a data warehouse

* Use cases
    * calculate books with best profit margin
    * find most loyal customers
    * decide employee of the month

## Queries

Definition:
* requests to the database management system for specific information
* the more complex a database is the more difficult to request information

## Create a Database

1. Create a database
```sh
CREATE DATABASE name_of_database;
```
2. Delete a database
```sh
DROP DATABASE name_of_database;
```
1. To put tables in database/schema (to can use it)
```sh
USE name_of_database;
```

## Create Tables

1. Create employees table
```sh
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    hire_date DATE,
    gender VARCHAR(1), -- "M"/"F" (male/female)
    salary INT,
    coffeeshop_id INT
);
```
2. Create shops table
```sh
CREATE TABLE shops (
    coffeeshop_id INT PRIMARY KEY,
    coffeeshop_name VARCHAR(50),
    city_id INT
);
```
3. Add foreign key to the employees table
```sh
ALTER TABLE employees
ADD FOREIGN KEY (coffeeshop_id)
REFERENCES shops(coffeeshop_id)
ON DELETE SET NULL;
```
4. Add more columns to an existing table (some lannguage may require COLUMN after ADD)
```sh
ALTER TABLE table_name
ADD column_name1 data_type1 [constraints],
ADD column_name2 data_type2 [constraints],
ADD column_name3 data_type3 [constraints];
```

## Insert Into Tables

1. Insert first two entries into employees table
```sh
INSERT INTO employees VALUES (501559, 'Carson', 'Mosconi', 'cmosconi0@census.gov', '2015/08/29', 'M', 32973, NULL);
INSERT INTO employees VALUES (144108, 'Khalil', 'Corr', 'kcorr1@github.io', '2014/04/23', 'M', 52802, NULL);
```
2. Insert the shop with coffeeshop_id = 1 into the shops table
```sh
INSERT INTO shops VALUES(1, 'Common Grounds', NULL);
```
3. Update an existig value in the table with another, or change values
```sh
UPDATE groceries
SET aisle = 7
WHERE id = 1;
```

4. Now set the coffeeshop_id for the first two employees we inserted to 1 
```sh
UPDATE employees
SET coffeeshop_id = 1 
WHERE employee_id IN (501559, 144108);
```

## Show Tables

1. See all the table
```sh
SELECT * FROM employees;
```

2. See certain columns
```sh
SELECT emplyee_id, firs_name FROM employees;
```

3. Select employees who make more than 50k
```sh
SELECT *
FROM employees
WHERE salary > 50000;
```

4. Select employees who make more than 50k and are males
```sh
SELECT *
FROM employees
WHERE salary > 50000
AND gender = 'M';
```
5. Select employees with no missing addressses
```sh
SELECT *
FROM employees
WHERE NOT email IS NULL;
```

6. Select salary between 35k and 50k
```sh
SELECT *
FROM employees
WHERE salary BETWEEN 35000 AND 50000;
```

7. Order by salary ascending
```sh 
SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary;
```

8. Extract
```sh
SELECT
    hire_date,
    EXTRACT(YEAR FROM hire_date) AS year,           # AS - shortkey to use alias for a column
    EXTRACT(MONTH FROM hire_date) AS month,
    EXTRACT(Day FROM hire_date) AS day
FROM employees;
```

9. Uppercase first and last names
```sh
SELECT
    first_name,
    UPPER(first_name) AS first_name_upper,
    last_name
    UPPER(last_name) AS last_name_upper
FROM employees;
```

10. Concatenations 
```sh
SELECT
 first_name || ' ' || last_name AS full_name
FROM employee;
```

11. Substring & Position to find the email client
```sh
SELECT
    email,
    SUBSTRING(email FROM POSITION('@' IN email)) -- add 1 to see without @
FROM employees;
```

12. Select the maximum salary (or the minimum `MIN(salary)`)
```sh
SELECT MAX(salary) as max_sal
FROM employees;
```

13. Average salary
```sh
SELECT AVG(salary)
FROM employees;
```

14. Return the number of employees for each coffeeshop (any column in the 
SELECT statement that is not an aggregate function must be in GROUP BY)
```sh
SELECT coffeeshop_id, COUNT(employee_id)
FROM employees
GROUP BY coffeeshop_id;
```
15.  To select the distinct values
```sh
SELECT DISTINCT year_hired
FROM employees;
```
16.  View is a virtual table (when accessed it automatically updates in the underlying data)
```sh
CREATE VIEW employee_hire_years AS
SELECT id, name, year_hired
FROM employees;
```
17.  Limit the number of results (show only 2 rows of data) not for oracle
<!-- PostgreSQL -->
```sh                       
SELECT id, name
FROM employees
LIMIT 2;
```
<!-- SQL Server -->
```sh
SELECT TOP(2) id, name
FROM employees;
```
18.  Use 'HAVING' when need to filter based on an agregate function
```sh
SELECT release_year, COUNT(title) AS title_count
FROM films
GROUP BY release_year
HAVING COUNT(title) > 10;
```

## ORACLE SQL
1. Manipulate strings, concatenation
```sh
SELECT LAST_NAME || q'[ This employee's id is: ]' || EMPLOYEE_ID
FROM EMPLOYEES
```
2. The operator not equal `<>`
3. SUM function
```sh
SELECT SUM(Milliseconds)
FROM Track
```
4. Average (mean) and median value
```sh
SELECT AVG(Milliseconds), MEDIAN(Milliseconds)
FROM Track
```

## JOINS

* Used to combine rows from 2 or more tables on a related column

1. INNER JOIN 
   - returns only the rows that have matching values in both tables
```sh
SELECT s.coffeeshop_name, l.city, l.country
FROM shops s
INNER JOIN locations l
ON s.city_id = l.city_id;

SELECT s.coffeeshop_name, l.city, l.country
FROM shops s
JOIN locations l
ON s.city_id = l.city_id;
```

2. LEFT JOIN
    - retuns all the rows from the left table and the matched rows from the right table
    - if there is no match, the resukt in NULL on the side of the right table
```sh
SELECT s.coffeeshop_name, l.city, l.country
FROM shops s
LEFT JOIN locations l
ON s.city_id = l.city_id;
```

3. RIGHT JOIN
    - retuns all the rows from the right table and the matched rows from the left table
    - if there is no match, the resukt in NULL on the side of the left table
```sh
SELECT s.coffeeshop_name, l.city, l.country
FROM shops s
RIGHT JOIN locations l
ON s.city_id = l.city_id;
```

4. FULL OUTER JOIN
    - returns all rows when there is a match in one of the tables
    - if there is no match, the result in NULL on the side that does not have a match
```sh
SELECT s.coffeeshop_name, l.city, l.country
FROM shops s
FULL OUTER JOIN locations l
ON s.city_id = l.city_id;
```

## UNION

* To stack data on top each other
* Combine the result sets of two or more `SELECT` statements into a single result result set
* Removes all the duplicates
* `UNION ALL` keeps all the duplicates

1. Return all cities and countries
```sh
SELECT city FROM locations
UNION
SELECT country FROM locations;
```

## SUBQUERIES

* A query nested inside another query

1. Select subqueries with subqueries in the FROM clause
```sh
SELECT *
FROM (SELECT * FROM employees where coffeeshop_id IN (3,4)) a;

SELECT a.employee_id, a.first_name, a.last_name
FROM (SELECT * FROM employees where coffeeshop_id IN (3,4)) a;
```


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

3. Now set the coffeeshop_id for the first two employees we inserted to 1
```sh
UPDATE employees
SET coffeeshop_id = 1 
WHERE employee_id IN (501559, 144108);
```
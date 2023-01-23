-- Explain how to establish a database connection? what are the requirements?

-- Auto Increment
CREATE TABLE animals (
     id MEDIUMINT NOT NULL AUTO_INCREMENT,
     name CHAR(30) NOT NULL,
     PRIMARY KEY (id)
);
INSERT INTO animals (name) VALUES
    ('dog'),('cat'),('penguin'),
    ('lax'),('whale'),('ostrich');
SELECT * FROM animals;

CREATE TABLE animals (
    grp ENUM('fish','mammal','bird') NOT NULL,
    id MEDIUMINT NOT NULL AUTO_INCREMENT,
    name CHAR(30) NOT NULL,
    PRIMARY KEY (grp,id)
) ENGINE=MyISAM;
INSERT INTO animals (grp,name) VALUES
    ('mammal','dog'),('mammal','cat'),
    ('bird','penguin'),('fish','lax'),('mammal','whale'),
    ('bird','ostrich');
SELECT * FROM animals ORDER BY grp,id;


USE classicmodels;
SELECT * FROM customers;
SELECT lastName FROM employees;
SELECT lastName, firstName, jobTitle FROM employees;
SELECT * FROM employees;

SELECT contactLastname, contactFirstname
FROM customers
ORDER BY contactLastname;

SELECT contactLastname, contactFirstname
FROM customers
ORDER BY contactLastname DESC;

-- Using MySQL ORDER BY clause to sort the result set by multiple columns
SELECT contactLastname, contactFirstname
FROM customers
ORDER BY contactLastname DESC , contactFirstname ASC;

-- The following query selects the order line items from the orderdetails table. 
-- It calculates the subtotal for each line item and sorts the result set based on the subtotal.
SELECT 
    orderNumber, 
    orderlinenumber, 
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY 
   quantityOrdered * priceEach DESC;
   
-- To make the query more readable, you can assign the expression in the SELECT clause a column alias 
-- and use that column alias in the ORDER BY clause
SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY subtotal DESC;

-- Using MySQL WHERE clause with equality operator example
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';


-- Using MySQL WHERE clause with the AND operator
SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND 
    officeCode = 1;

-- Using MySQL WHERE clause with OR operator
SELECT 
    lastName, 
    firstName, 
    jobTitle, 
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 1
ORDER BY 
    officeCode , 
    jobTitle;
    
   -- Using MySQL WHERE clause with the BETWEEN operator example 
    SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY officeCode;


-- Using MySQL WHERE clause with the LIKE operator example
SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY firstName;

-- Using MySQL WHERE clause with the IN operator example
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (1 , 2, 3)
ORDER BY 
    officeCode;
    
-- Using MySQL WHERE clause with the IS NULL operator
SELECT 
    lastName, 
    firstName, 
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;
    
-- Using MySQL WHERE clause with comparison operators
-- =	Equal to. You can use it with almost any data type.
-- <> or !=	Not equal to
-- <	Less than. You typically use it with numeric and date/time data types.
-- >	Greater than.
-- <=	Less than or equal to
-- >=	Greater than or equal to
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle <> 'Sales Rep';

SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode > 5;

SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode <= 4;

-- Select unique last names by adding the DISTINCT
SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY 
    lastname;

SELECT DISTINCT state
FROM customers;

SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;
    
SELECT 
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state , 
    city;
    
-- AND
SELECT 
    customername, 
    country, 
    state
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA';
    
SELECT 
    customername, 
    country, 
    state, 
    creditlimit
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA' AND 
    creditlimit > 100000;

-- OR
SELECT    
	customername, 
	country
FROM    
	customers
WHERE country = 'USA' OR 
      country = 'France';

-- with paranthesis
SELECT   
	customername, 
	country, 
	creditLimit
FROM   
	customers
WHERE(country = 'USA'
		OR country = 'France')
	  AND creditlimit > 100000;
      
-- without paranthesis 
SELECT    
    customername, 
    country, 
    creditLimit
FROM    
    customers
WHERE 
    country = 'USA'
    OR country = 'France'
    AND creditlimit > 100000;
    
-- IN 
SELECT 
    officeCode, 
    city, 
    phone, 
    country
FROM
    offices
WHERE
    country IN ('USA' , 'France');

-- without IN 
SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country = 'USA' OR country = 'France';

-- NOT IN 
SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country NOT IN ('USA' , 'France')
ORDER BY 
    city;

-- BETWEEN
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;

SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice >= 90 AND buyPrice <= 100;


SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice NOT BETWEEN 20 AND 100;
    
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice < 20 OR buyPrice > 100;

SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requireddate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);

-- LIKE
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstName LIKE 'a%';

SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName LIKE '%on';

SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastname LIKE '%on%';

SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstname LIKE 'T_m';

SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName NOT LIKE 'B%';

-- ESCAPE operator
-- Sometimes the pattern may contain the wildcard characters e.g., 10%, _20, etc.
-- In this case, you can use the ESCAPE clause to specify the escape character so that 
-- the LIKE operator interprets the wildcard character as a literal character.
-- If you don’t specify the escape character explicitly, 
-- the backslash character (\) is the default escape character.
-- For example, if you want to find products whose product codes contain the string _20 , 
-- you can use the pattern %\_20% with the default escape character:
-- you can specify a different escape character 
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%\_20%';
    
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%$_20%' ESCAPE '$';


-- LIMIT 
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;

SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit, 
    customerNumber
LIMIT 5;
-- This query uses the LIMIT clause to get rows of page 1 which contains the first 10 customers 
-- sorted by the customer name:
SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10;

-- This query uses the LIMIT clause to get the rows of the second page that include rows 11 – 20:

 SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10, 10;

-- IS NULL
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NULL
ORDER BY 
    customerName; 

-- IS NOT NULL
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NOT NULL
ORDER BY 
   customerName;
   

-- Treatment of date ‘0000-00-00’
--  If a DATE or DATETIME column has a NOT NULL constraint and contains a special date '0000-00-00', 
-- you can use the IS NULL operator to find such rows.
CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT,
    title VARCHAR(255),
    begin_date DATE NOT NULL,
    complete_date DATE NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO projects(title,begin_date, complete_date)
VALUES('New CRM','2020-01-01','0000-00-00'),
      ('ERP Future','2020-01-01','0000-00-00'),
      ('VR','2020-01-01','2030-01-01');
-- IS NULL
SELECT * 
FROM projects
WHERE complete_date IS NULL;

SELECT 
    customerName, country, salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NULL
ORDER BY customerName; 


-- CONCAT_WS() function to concatenate first name and last name into full name.
SELECT 
    CONCAT_WS(', ', lastName, firstname)
FROM
    employees;
 
 SELECT
   CONCAT_WS(', ', lastName, firstname) AS `Full name`
FROM
   employees;
   

SELECT
	CONCAT_WS(', ', lastName, firstname) `Full name`
FROM
	employees
ORDER BY
	`Full name`;
    

SELECT
	orderNumber `Order no.`,
	SUM(priceEach * quantityOrdered) total
FROM
	orderDetails
GROUP BY
	`Order no.`
HAVING
	total > 60000;

-- Alias for tables
SELECT * FROM employees e;

SELECT 
    e.firstName, 
    e.lastName
FROM
    employees e
ORDER BY e.firstName;


SELECT
	customerName,
	COUNT(o.orderNumber) total
FROM
	customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY
	customerName
ORDER BY
	total DESC;
    

SELECT
	customers.customerName,
	COUNT(orders.orderNumber) total
FROM
	customers
INNER JOIN orders ON customers.customerNumber = orders.customerNumber
GROUP BY
	customerName
ORDER BY
	total DESC
    
-- JOINS
-- Setting up the table 
CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);

INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');


-- INNER JOIN
SELECT column_list
FROM table_1
INNER JOIN table_2 ON join_condition;

-- If the join condition uses the equality operator (=) and the column names in 
-- both tables used for matching are the same, and you can use the USING clause instead
SELECT column_list
FROM table_1
INNER JOIN table_2 USING (column_name);

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
INNER JOIN committees c ON c.name = m.name;


SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
INNER JOIN committees c USING(name);

SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
INNER JOIN productlines t2 
    ON t1.productline = t2.productline;
    
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products
INNER JOIN productlines USING (productline);

SELECT 
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2 
    ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;

SELECT 
    orderNumber,
    status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders
INNER JOIN orderdetails USING (orderNumber)
GROUP BY orderNumber;

-- JOIN 3 Tables
SELECT 
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN
    orderdetails USING (orderNumber)
INNER JOIN
    products USING (productCode)
ORDER BY 
    orderNumber, 
    orderLineNumber;
    
-- JOIN 4 Tables
SELECT 
    orderNumber,
    orderDate,
    customerName,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
INNER JOIN products 
    USING (productCode)
INNER JOIN customers 
    USING (customerNumber)
ORDER BY 
    orderNumber, 
    orderLineNumber;
    
SELECT 
    orderNumber, 
    productName, 
    msrp, 
    priceEach
FROM
    products p
INNER JOIN orderdetails o 
   ON p.productcode = o.productcode
      AND p.msrp > o.priceEach
WHERE
    p.productcode = 'S10_1678';
    


-- LEFT JOIN
SELECT column_list 
FROM table_1 
LEFT JOIN table_2 ON join_condition;

SELECT column_list 
FROM table_1 
LEFT JOIN table_2 USING (column_name);

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
LEFT JOIN committees c USING(name);

-- find members who are not the committee members, you add a WHERE clause and IS NULL operator.
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
LEFT JOIN committees c USING(name)
WHERE c.committee_id IS NULL;

SELECT 
    customers.customerNumber, customerName, orderNumber, status
FROM
    customers
        LEFT JOIN
    orders ON orders.customerNumber = customers.customerNumber;
    

SELECT
	customerNumber,
	customerName,
	orderNumber,
	status
FROM
	customers
LEFT JOIN orders USING (customerNumber);

-- LEFT JOIN clause to find unmatched rows
SELECT 
    c.customerNumber, 
    c.customerName, 
    o.orderNumber, 
    o.status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;

-- for 3 tables
SELECT 
    lastName, 
    firstName, 
    customerName, 
    checkNumber, 
    amount
FROM
    employees
LEFT JOIN customers ON 
    employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = customers.customerNumber
ORDER BY 
    customerName, 
    checkNumber;


-- Condition in WHERE clause vs. ON clause
SELECT 
    o.orderNumber, 
    customerNumber, 
    productCode
FROM
    orders o
LEFT JOIN orderDetails 
    USING (orderNumber)
WHERE
    orderNumber = 10123;

-- if you move the condition from the WHERE clause to the ON clause
SELECT 
    o.orderNumber, 
    customerNumber, 
    productCode
FROM
    orders o
LEFT JOIN orderDetails d 
    ON o.orderNumber = d.orderNumber AND 
       o.orderNumber = 10123;
    

-- RIGHT JOIN
SELECT column_list 
FROM table_1 
RIGHT JOIN table_2 ON join_condition;

SELECT column_list 
FROM table_1 
RIGHT JOIN table_2 USING (column_name);

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c on c.name = m.name;

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c USING(name);


-- To find rows in the right table that does not have corresponding rows in the left table, you also use a WHERE clause with the IS NULL
SELECT column_list 
FROM table_1 
RIGHT JOIN table_2 USING (column_name)
WHERE column_table_1 IS NULL;

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c USING(name)
WHERE m.member_id IS NULL;


SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees 
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
	employeeNumber;
    
-- RIGHT JOIN to find unmatching rows
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees ON 
	salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;


-- self join using INNER JOIN clause
-- To perform a self join, you must use table aliases to not repeat 
-- the same table name twice in a single query. Note that referencing a table 
-- twice or more in a query without using table aliases will cause an error.
SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;
    
-- self join using LEFT JOIN clause
SELECT 
    IFNULL(CONCAT(m.lastname, ', ', m.firstname),
            'Top Manager') AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM
    employees e
LEFT JOIN employees m ON 
    m.employeeNumber = e.reportsto
ORDER BY 
    manager DESC;
    
-- GROUP BY
SELECT 
    c1, c2,..., cn, aggregate_function(ci)
FROM
    table
WHERE
    where_conditions
GROUP BY c1 , c2,...,cn;

SELECT 
    status
FROM
    orders
GROUP BY status;

SELECT 
    status, COUNT(*)
FROM
    orders
GROUP BY status;

SELECT DISTINCT
    status
FROM
    orders;
    
SELECT 
    status, 
    SUM(quantityOrdered * priceEach) AS amount
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
GROUP BY 
    status;
    
-- query returns the order numbers and the total amount of each order.
SELECT 
    orderNumber,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orderdetails
GROUP BY 
    orderNumber;
    
-- you can group rows by expressions. The following query gets the total sales for each year.
SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    YEAR(orderDate);
    
-- GROUP BY clause, you use a  HAVING clause. The following query uses the 
-- HAVING clause to select the total sales of the years after 2003
SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    year
HAVING 
    year > 2003;
    
-- The SQL standard does not allow you to use an alias in the GROUP BY clause whereas MySQL supports this.
SELECT 
    YEAR(orderDate) AS year, 
    COUNT(orderNumber)
FROM
    orders
GROUP BY 
    year;

SELECT 
    status, 
    COUNT(*)
FROM
    orders
GROUP BY 
    status DESC;
    
-- The HAVING clause is often used with the GROUP BY clause to 
-- filter groups based on a specified condition. If you omit the GROUP BY clause, 
-- the HAVING clause behaves like the WHERE clause.
SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;

SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber;

-- you can find which order has total sales greater than 1000 by using the HAVING clause as follows:
SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY 
   ordernumber
HAVING 
   total > 1000;
   

-- The following example uses the HAVING clause to find orders that have 
-- total amounts greater than 1000 and contain more than 600 items:
SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber
HAVING 
    total > 1000 AND 
    itemsCount > 600;
    
-- Suppose that you want to find all orders that already shipped and 
-- have a total amount greater than 1500, you can join the orderdetails 
-- table with the orders table using the INNER JOIN clause and apply a condition 
-- on status column and total aggregate as shown in the following query
SELECT 
    a.ordernumber, 
    status, 
    SUM(priceeach*quantityOrdered) total
FROM
    orderdetails a
INNER JOIN orders b 
    ON b.ordernumber = a.ordernumber
GROUP BY  
    ordernumber, 
    status
HAVING 
    status = 'Shipped' AND 
    total > 1500;
    
-- SUB QUERY
-- the following query uses a subquery to return the employees who work in the offices located in the USA.
SELECT 
    lastName, firstName
FROM
    employees
WHERE
    officeCode IN (SELECT 
            officeCode
        FROM
            offices
        WHERE
            country = 'USA');

-- the following query returns the customer who has the highest payment
SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (SELECT MAX(amount) FROM payments);
    
-- you can find customers whose payments are greater than the average payment using a subquery:
SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount > (SELECT 
            AVG(amount)
        FROM
            payments);
            
-- you can use a subquery with NOT IN operator to find the customers who have not placed any orders as follows
SELECT 
    customerName
FROM
    customers
WHERE
    customerNumber NOT IN (SELECT DISTINCT
            customerNumber
        FROM
            orders);
            

-- following subquery finds the maximum, minimum, and average number of items in sale orders
-- Note that the FLOOR() is used to remove decimal places from the average values of items.
SELECT 
    MAX(items), 
    MIN(items), 
    FLOOR(AVG(items))
FROM
    (SELECT 
        orderNumber, COUNT(orderNumber) AS items
    FROM
        orderdetails
    GROUP BY orderNumber) AS lineitems;
    
-- subquery to select products whose buy prices are greater than the average buy 
-- price of all products in each product line.
SELECT 
    productname, 
    buyprice
FROM
    products p1
WHERE
    buyprice > (SELECT 
            AVG(buyprice)
        FROM
            products
        WHERE
            productline = p1.productline);
            
-- The following query finds sales orders whose total values are greater than 60K.

SELECT 
    orderNumber, 
    SUM(priceEach * quantityOrdered) total
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
GROUP BY orderNumber
HAVING SUM(priceEach * quantityOrdered) > 60000;

-- DERIVED TABLE
-- A derived table is a virtual table returned from a SELECT statement. 
-- A derived table is similar to a temporary table, but using a derived table in 
-- the SELECT statement is much simpler than a temporary table because it does not 
-- require creating the temporary table.
-- Every derived table must have its own alias.
SELECT 
    select_list
FROM
    (SELECT 
        select_list
    FROM
        table_1) derived_table_name
WHERE 
    derived_table_name.c1 > 0;

-- query gets the top five products by sales revenue in 2003 from the orders and orderdetails tables
SELECT 
    productCode, 
    ROUND(SUM(quantityOrdered * priceEach)) sales
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY productCode
ORDER BY sales DESC
LIMIT 5;

-- You can use the result of this query as a derived table and join it with the products table as follows:
-- First, the subquery is executed to create a result set or derived table.
-- Then, the outer query is executed that joined the top5product2003 derived table 
-- with the products table using the productCode column.
SELECT 
    productName, sales
FROM
    (SELECT 
        productCode, 
        ROUND(SUM(quantityOrdered * priceEach)) sales
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY productCode
    ORDER BY sales DESC
    LIMIT 5) top5products2003
INNER JOIN
    products USING (productCode);


-- Suppose you have to classify the customers who bought products in 2003 into 
-- 3 groups: platinum, gold, and silver. And you need to know the number of customers 
-- in each group with the following conditions:

-- Platinum customers who have orders with the volume greater than 100K.
-- Gold customers who have orders with the volume between 10K and 100K.
-- Silver customers who have orders with the volume less than 10K.
-- To form this query, you first need to put each customer into the respective group using 
-- CASE expression and GROUP BY clause as follows:
SELECT 
    customerNumber,
    ROUND(SUM(quantityOrdered * priceEach)) sales,
    (CASE
        WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
        WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
        WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
    END) customerGroup
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY customerNumber;

-- Then, you can use this query as the derived table and perform grouping as follows:
SELECT 
    customerGroup, 
    COUNT(cg.customerGroup) AS groupCount
FROM
    (SELECT 
        customerNumber,
            ROUND(SUM(quantityOrdered * priceEach)) sales,
            (CASE
                WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
                WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
                WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
            END) customerGroup
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY customerNumber) cg
GROUP BY cg.customerGroup;    



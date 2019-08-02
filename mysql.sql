-- # Source: https://www.youtube.com/watch?v=7S_tz1z_5bA&list=PLTjRvDozrdlynYXGUfyyMZdrQ0Sz27aud
# download mysql installer (mysql-installer-web-community-x.x.x.x.msi) from https://dev.mysql.com/downloads/mysql/
# install the downloaded file with most default and set user name & password
# now run mysql workbench and create a new connection or use existing one
# to comment a query use -- before query line;

# Create data or execute below queries:

  drop database if exists 'sql_invoicing'; -- will drop/delete sql_invoicing named db if exists;
  create database 'sql_invoicing'; -- to create new db named sql_invoicing;
  use 'sql_invoicing'; -- to make active sql_invoicing db
  set names utf8; --  It is needed whenever you want to send data to the server having characters that cannot be represented in 
                      -- pure ASCII, like 'ñ' or 'ö'.
                      -- That if the MySQL instance is not configured to expect UTF-8 encoding by default from client 
                       -- connections (many are, depending on your location and platform.
  set character_set_client = utfmb4; -- The utf8mb4 Character Set (4-Byte UTF-8 Unicode Encoding)
                                        -- The utfmb4 character set has these characteristics:
                                        -- 1. Supports BMP and supplementary characters.
                                        -- 2. Requires a maximum of four bytes per multibyte character. 
                                         -- utf8mb4 contrasts with the utf8mb3 character set, which supports only BMP characters 
                                        -- and uses a maximum of three bytes per character:
                                        -- 3. For a BMP character, utf8mb4 and utf8mb3 have identical storage 
                                         --  characteristics: same code values, same encoding, same length.

CREATE TABLE `payment_methods`(
  `payment_method_id` tinyint(4) NOT NULL AUTO_INCREMENT,
   `name` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO payment_methods values(1,'UPI'); --  insert new data in payment_methods table

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `clients` VALUES (1,'Vinte','3 Nevada Parkway','Syracuse','NY','315-252-7305');

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `number` varchar(50) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_total` decimal(9,2) NOT NULL,
  `payment_total` decimal(9,2) NOT NULL DEFAULT '0.00',
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `FK_client_id` (`client_id`),
  CONSTRAINT `FK_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `invoices` VALUES (1,'91-953-3396',2,101.79,0.00,'2019-03-09','2019-03-29',NULL);

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `payment_method` tinyint(4) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_client_id_idx` (`client_id`),
  KEY `fk_invoice_id_idx` (`invoice_id`),
  KEY `fk_payment_payment_method_idx` (`payment_method`),
  CONSTRAINT `fk_payment_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_payment_method` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `payments` VALUES (1,5,2,'2019-02-12',8.18,1);

SELECT * FROM table_a; -- will selelct all data from table_a
SELECT column_a from table_a; -- will select column_a from table_a
SELECT column_a, column_b from table_a; -- will select column_a and column_b from table_a
SELECT column_a * 10 from table_a; -- will select column_a and multiply each row with 10 from table_a 
                                       -- and return new column named column_a*10
SELECT column_a, column_b * 10 from table_a; -- will select column_a and column_b and multiply each row of column_b with 10 from 
                                       -- table_a  and return new column named column_b * 10
SELECT column_a * 10 AS new_column from table_a; -- will select column_a and multiply each row with 10 from table_a and return 
                                                   -- new column named new_column
SELECT DISTINCT column_a from table_a; -- will select all row of column_a and ignore repeated data

SELECT * FROM table_a WHERE points_value = 10; -- equal
SELECT * FROM table_a WHERE points_value > 10; -- grater
SELECT * FROM table_a WHERE points_value >= 10; -- greater & equal
SELECT * FROM table_a WHERE points_value < 10; -- lesser
SELECT * FROM table_a WHERE points_value <= 10; -- lesser & equal
SELECT * FROM table_a WHERE points_value != 10; -- not equal
SELECT * FROM table_a WHERE points_value <> 10; -- not equal
SELECT * FROM table_a WHERE state_name = 'Delhi'; -- equal
SELECT * FROM table_a WHERE birth_date > '1990-01-01'; -- greater


SELECT * FROM customers WHERE birth_date > '1990-01-01';

SELECT * FROM customers WHERE birth_date > '1990-01-01' AND points > 1000;
SELECT * FROM customers WHERE birth_date > '1990-01-01' OR points > 1000;

SELECT * FROM customers WHERE birth_date > '1990-01-01' OR points > 1000 AND state = 'VA';
SELECT * FROM customers WHERE birth_date > '1990-01-01' OR (points > 1000 AND state = 'VA');

SELECT * FROM customers WHERE NOT (birth_date > '1990-01-01' OR points > 1000); 
SELECT * FROM customers WHERE birth_date <= '1990-01-01' AND points <= 1000 ; -- similar to above one (i.e. having not operatOR)

SELECT * FROM ORder_items WHERE ORder_id = 6 AND unit_price * quantity > 30;

SELECT * FROM customers WHERE state = 'VA' OR state = 'GA' OR state = 'FL'; -- similar and better one is below
SELECT * FROM customers WHERE state IN ('VA', 'GA', 'FL'); -- its better to use IN operator instead of multiple OR

SELECT * FROM customers WHERE NOT (state = 'VA' OR state = 'GA' OR state = 'FL'); -- better one is below
SELECT * FROM customers WHERE state NOT IN ('VA', 'GA', 'FL'); -- its better to use IN operator instead of multiple OR

SELECT * FROM products WHERE quantity_IN_stock IN (49,38,72);

SELECT * FROM customers WHERE points >= 1000 AND points <= 3000; -- similar and better one is below
SELECT * FROM customers WHERE points BETWEEN 1000 AND 3000; -- use BETWEEN for range selection
SELECT * FROM customers WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'; -- also works for date range selection

-- **The LIKE operator** --

SELECT * FROM customers WHERE last_name LIKE 'b%'; -- select all rows where last_name starts with b (uppercase or lowercase)
SELECT * FROM customers WHERE last_name LIKE 'brush%'; -- select all rows where last_name starts with brush 

SELECT * FROM customers WHERE last_name LIKE '%b%'; -- select all rows where last_name contains b at any position 
SELECT * FROM customers WHERE last_name LIKE '%be%'; -- select all rows where last_name contains be at any position 

SELECT * FROM customers WHERE last_name LIKE '%y'; -- select all rows where last_name ends with y 
SELECT * FROM customers WHERE last_name LIKE '%yo'; -- select all rows where last_name ends with yo 

SELECT * FROM customers WHERE last_name LIKE '_y'; -- select all rows where last_name has 2 chars and ends with y 
SELECT * FROM customers WHERE last_name LIKE '_____y'; -- select all rows where last_name has 6 chars and ends with y 
SELECT * FROM customers WHERE last_name LIKE '____yo'; -- select all rows where last_name has 6 chars and ends with yo
SELECT * FROM customers WHERE last_name LIKE 'a____y'; -- select all rows where last_name has 6 chars and starts with a and ends with y

-- here % sign is for any number of character and _ sign is for single character;

SELECT *  FROM customers WHERE addresses LIKE '%trail%' OR '%avenue'; -- # get customers whose addresses contains trail or avenue 

SELECT * FROM customers WHERE phone LIKE '%9'; -- select all phone numbers ended with 9
SELECT * FROM customers WHERE phone NOT LIKE '%9'; -- select all phone numbers not ended with 9

-- ** The REGEXP operator** --

SELECT * FROM customers WHERE last_name REGEXP 'field'; -- select all rows where last_name contains field
SELECT * FROM customers WHERE last_name REGEXP '^field'; -- caret sign at start select all rows where last_name must starts with field
SELECT * FROM customers WHERE last_name REGEXP 'field$'; -- dollor sign at end select all rows where last_name must ends with field
SELECT * FROM customers WHERE last_name REGEXP 'field|mac'; -- pipe sign separated words select rows where last_name contains any of that words
SELECT * FROM customers WHERE last_name REGEXP 'field|mac|rose'; -- select rows where last_name contains field or mac or rose
SELECT * FROM customers WHERE last_name REGEXP '^field|mac|rose'; -- select rows where last_name contains mac or rose or  starts with field
SELECT * FROM customers WHERE last_name REGEXP 'field$|^rose'; -- select rows where last_name start with rose or ends with field
SELECT * FROM customers WHERE last_name REGEXP '[gim]e'; -- select rows where last_name contains ge or ie or me
SELECT * FROM customers WHERE last_name REGEXP 'e[gim]'; -- select rows where last_name contains eg or ei or em
SELECT * FROM customers WHERE last_name REGEXP '[a-h]e'; -- select rows where last_name contains ae or be or ce or ...... he


-- * The IS NULL operator* --

SELECT * FROM customers WHERE phone IS NULL; -- only select rows where phone is null;
SELECT * FROM customers WHERE phone IS NOT NULL; -- only select rows where phone is  not null;


-- * The ORDER BY Clause* --

SELECT * FROM customers ORDER BY last_name; -- order by last_name (Default ascending order)
SELECT * FROM order_items ORDER BY unit_price * quantity; -- order by some expression
SELECT * FROM order_items ORDER BY unit_price*quantity AS new_value; -- order by some alias of expression
SELECT * FROM customers ORDER BY last_name DESC; -- order by last_name in descending order
SELECT * FROM customers ORDER BY last_name, state; -- order by last_name and state 
SELECT * FROM customers ORDER BY last_name DESC, state; -- order by last_name in descending order and  by state
SELECT * FROM customers ORDER BY last_name DESC, state DESC; -- -- order by last_name in descending order and by state in descending order
SELECT first_name, last_name FROM customers ORDER BY birth_date; -- select data from other column and order by some other column
SELECT first_name, last_name, 10 AS new_points FROM customers ORDER BY new_points; -- order by alias column (new_points)
SELECT first_name, last_name, 10 AS new_points FROM customers ORDER BY new_points, first_name; -- order by alias (new_points) and first_name
SELECT first_name, last_name FROM customers ORDER BY 1,2; -- select data and order by firstSelection and secondSelection then first_name 
															-- (Not convenient as selection order will affect sorting)
SELECT *, unit_price * quantity as total_price from order_items WHERE order_id = 2 ORDER BY total_price DESC;

-- * The LIMIT Clause* --
SELECT * FROM customers LIMIT 3; -- select first 3 rows
SELECT * FROM customers LIMIT 6,3; -- skip first 6 rows then select 3 rows
SELECT * FROM customers ORDER BY points DESC LIMIT 3; -- select 3 rows with higher points


-- * INNER JOIN and OUTER JOINT to select data from multiple table or multiple databases* --

SELECT * FROM orders JOIN customers ON orders.customer_id = customers.customer_id; -- select joint data form orders table and also the
												-- customers details from customers table based on customer_id available in order table
SELECT order_id, first_name, last_name FROM orders JOIN customers ON orders.customer_id = customers.customer_id; 
								-- select joint data (order_id, first_name, last_name) form orders table and customers table
								
SELECT order_id, customer_id, first_name, last_name FROM orders JOIN customers ON orders.customer_id = customers.customer_id; 
								-- Error Code: 1052. Column 'customer_id' in field list is ambiguous
								-- means customer_id is available in multiple table.
								-- solution: prefix column with table name i.e. orders.customer_id) 
								
SELECT order_id, orders.customer_id, first_name, last_name FROM orders JOIN customers ON orders.customer_id = customers.customer_id; 
								-- select joint data (order_id, customer_id, first_name, last_name) form orders table and customers table
								
-- as orders and customers are repeating in above queries. to simplify them we can use alias for the as blow one
	SELECT order_id, o.customer_id, first_name, last_name FROM orders o JOIN customers c on o.order_id = c.customer_id; 
			-- using o as alias for orders and c for customers


SELECT * FROM order_items oi JOIN sql_inventory.products p ON oi.product_id = p.product_id; 
					-- sql_store is in use and order_items table from sql_store will be joining products table data from sql_inventory
					-- in case if selecting table from the db that is not currently in use the the table name need to be prefixed with db name as below query
-- made	sql_inventory in use so order_items table is prefixed with sql_store (db name)
	SELECT * FROM sql_store.order_items oi JOIN products p ON oi.product_id = p.product_id;


-- * SELF JOIN * ---
	use sql_hr; -- made sql_hr in use

	SELECT emp.employee_id, CONCAT(emp.first_name,' ', emp.last_name) AS Employee, CONCAT(mngr.first_name , ' ' , mngr.last_name )AS Manager
		FROM employees emp JOIN employees mngr ON emp.reports_to = mngr.employee_id;
			-- selecting employees with their manager details. manager is also an employee so we joining data from same table(employees)


-- * joining all data from more then two table * --
	SELECT * FROM orders o JOIN customers c ON o.customer_id = c.customer_id JOIN order_statuses os ON o.status = os.order_status_id;
		-- Joins data from orders table with customers table based on customer_id and with order_statuses table based on order_status_id

-- * joining some columns data from more then two table * --
	SELECT o.order_id, o.order_date, c.first_name, c.last_name, os.name FROM orders o 
		JOIN customers c ON o.customer_id = c.customer_id 
		JOIN order_statuses os ON o.status = os.order_status_id;
			-- Joins some columns from orders table with customers table based on customer_id 
				-- and with order_statuses table based on order_status_id
				
-- * Compound Join Condition (Joins different table data based on multiple conditions)* -- 
	SELECT * FROM order_items oi JOIN order_item_notes oin ON oi.order_id = oin.order_id AND oi.product_id = oin.product_id;

-- * another way to join two tables data ( called as Implicit Join Syntax)* --
	SELECT * FROM orders o, customers c WHERE o.customer_id = c.customer_id; 
			-- not usefull as if forgot to put WHERE it will select all from  orders & customers tabels

-- ** OUTER JOIN (LEFT OUTER JOIN and RIGHT OUTER JOIN as OUTER keyword is optional so we can write LEFT JOIN & RIGHT JOIN) ** --
	SELECT c.customer_id, c.first_name, o.order_id FROM orders o LEFT JOIN customers c ON c.customer_id = o.customer_id; 
		-- select all from left i.e. customers table with their order_id if no orders then it return null value
	SELECT c.customer_id, c.first_name, o.order_id FROM orders o RIGHT JOIN customers c ON c.customer_id = o.customer_id; 
		-- select all from right i.e. orders table with their customer_id and first_name.
	
	-- swap table name --
	SELECT c.customer_id, c.first_name, o.order_id FROM orders o RIGHT JOIN customers c ON c.customer_id = o.customer_id; 
		-- select all from right i.e. orders table with their customer_id and first_name.



-- # LEFT JOIN for multiple tables
	SELECT  c.customer_id, c.first_name, o.order_id, o.shipper_id, sh.name AS shipper FROM customers c 
	LEFT JOIN orders o ON c.customer_id= o.customer_id 
	LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id;
		-- selects all customers with order_id and shipper details
	-- *Best practice: try avoiding RIGHT JOIN while joining multiple tables data
	
	-- one more example
		SELECT o.order_date, o.order_id, c.first_name, sh.name AS shipper, os.name as status FROM orders o 
		JOIN customers c ON o.customer_id = c.customer_id
		LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id
		JOIN order_statuses os ON os.order_status_id = o.status;

-- # SELF OUTER JOIN
	SELECT e.employee_id, e.first_name as employee, m.first_name as manager FROM  employees e 
	JOIN employees m ON e.reports_to = m.employee_id; 
		-- select only employees having manager
	SELECT e.employee_id, e.first_name as employee, m.first_name as manager FROM  employees e 
	LEFT JOIN employees m ON e.reports_to = m.employee_id;  
		-- select all employees with or without manager

-- # The USING Clause
	-- if joining condition is like [ON o.customer_id =  c.customer_id] then we can use USING clause as USING(customer_id)
	-- example 1: 
	SELECT o.order_id, c.first_name FROM orders o JOIN customers c USING(customer_id);
	-- example 2: 
	SELECT o.order_id, c.first_name, sh.name as shipper FROM orders o 
	JOIN customers c USING(customer_id) LEFT JOIN shippers sh USING(shipper_id);

	-- * USING keyword only work if the column name across differetn tables will be same

-- # The USING Clause for multi conditional JOIN
	-- joing by ON keyword:
	SELECT * FROM order_items oi JOIN order_item_notes oin ON oi.order_id = oin.order_id AND oi.product_id = oin.product_id;
	
	-- joing by USING keyword:
	SELECT * FROM order_items oi JOIN order_item_notes oin USING(order_id, product_id);
	
-- # JOIN multi tables data with ON and USING keyword
	SELECT p.date, c.name as client, p.amount, pm.name as payment_method FROM payments p JOIN clients c USING(client_id) JOIN payment_methods pm ON  pm.payment_method_id = p.payment_method;

-- # NATURAL JOIN (In mqsql another simpler way to join two tables. Its called natural join. 
	-- (not reccomended as sometimes it produces unexpected result)
	SELECT o.order_id, c.first_name FROM orders o NATURAL JOIN customers c; -- do join based on same name column in both table
		
	-- *Natural joins are easier to code but it can be a little bit dangerous because we are letting the DB Engine guess the join, 
		-- we dont have dont have control on it.  
		-- For this very reason natural joins can produce unexpected results and thats why i discourage you to use them.

-- # CROSS JOIN (we use CROSS JOIN to combine or every record from first table, with every record in a second table)
	SELECT * FROM customers c CROSS JOIN products p; -- explicit syntax
	SELECT * FROM customers c, products p; -- implicit syntax
		-- * explicit syntax are more preferred
		-- * above query will combine every record in customers table with every record in products table
		-- * As it joins every record in both tables so conditions are not required in CROSS JOIN

-- # UNIONS

	SELECT order_id, order_date, 'Active' AS status FROM orders WHERE order_date >= '2019-01-01' 
	UNION  SELECT order_id, order_date, 'Archived' AS status FROM orders WHERE order_date < '2019-01-01';
	
	-- another ex:
	SELECT customer_id, first_name, points, 'Bronze' AS type FROM customers WHERE points < 2000
	UNION SELECT customer_id, first_name, points, 'Silver' AS type FROM customers WHERE points BETWEEN 2000 AND 3000
	UNION SELECT customer_id, first_name, points, 'Gold' AS type FROM customers WHERE points > 3000
	ORDER BY first_name;

-- # INSERT data in table
	-- Inserting data without specifying column name:
		INSERT INTO customers VALUES(DEFAULT, 'Ron', 'Max', '1990-01-01', default, 'address', 'City', 'CA', DEFAULT);
		INSERT INTO customers VALUES(DEFAULT, 'Ron', 'Max', '1990-01-01', NULL, 'address', 'City', 'CA', DEFAULT);
			-- * data should be in same order as column in table
			-- * WE have to pass DEFAULT keyword for Auto-incriment Field (passing value will generate error if same value will be in column)
			-- * We have to pass DEFAULT or some value for Field where default values are given for column 
			-- * WE have to pass DEFAULT or NULL or some value where null is allowed
	
	-- Inserting data by specifying column name:
		INSERT INTO customers (first_name, last_name, birth_date, address, city, state) 
		VALUES('Ron', 'Max', '1990-01-01', 'address', 'City', 'CA');
			-- * we can change the orrders of values by changing columns order i.e. values order will be according to columns order
	
	-- Inserting multiple rows at once:
		INSERT INTO products (name, quantity_in_stock, unit_price) 
		VALUES('product 1', 21, 11.90),('product 2', 11, 20.90),('product 3', 10, 10.90);
	-- get the last inserted id
		LAST_INSERT_ID();
		
	-- hierarchical insert
		INSERT INTO orders (customer_id, order_date, status) values(1, '2019-01-01',1);    
		INSERT INTO order_items values (last_insert_id(), 1,1,2.2),(last_insert_id(), 2,2,5.0);
		
-- # Creating a copy of table:
	CREATE TABLE orders_archived AS SELECT * FROM orders;
		-- create new table named orders_archived with same data as orders but ignores the config of column as Primary key and Auto-incriment
	-- * In the above query SELECT * FROM orders is known as sub-query.
	-- * We can use sub-query to copy some  data from orders table and insert into orders_archived table as shown below:
		-- first turncate orders_archived table then run below query:
		INSERT INTO orders_archived SELECT * FROM orders  WHERE order_date < '2019-01-01';

-- # Update method:
	UPDATE invoices SET payment_total = 10, payment_date: '2019-03-01' WHERE invoice_id = 1;
	
	-- * update with some expression or value from some other column:
		UPDATE invoices SET  payment_total = invoice_total * 0.5, payment_date = due_date WHERE invoice_id = 3;
			-- payment_total value will be updated by half of invoice_total value and payment_date by value of due_date

-- # Updating multiple rows:
	UPDATE invoices SET  payment_total = invoice_total * 0.5, payment_date = due_date WHERE client_id = 3;
	
	-- Q: Give extra 50 points to all customers born before 1990.
		UPDATE customers SET points = points + 50 WHERE birth_date < '1990-01-01';
		
-- # Using Subqueries in Updates:
	UPDATE invoices SET  payment_total = invoice_total * 0.5, payment_date = due_date 
	WHERE client_id = (SELECT client_id FROM clients WHERE name='Myworks');
	
	-- if Subqueries returns multiple ids:
	UPDATE invoices SET  payment_total = invoice_total * 0.5, payment_date = due_date 
	WHERE client_id IN (SELECT client_id FROM clients WHERE state IN ('CA','NY'));

-- # Deleting rows:
	DELETE * FROM invoices WHERE invoice_id = 2; -- deleting by id
	DELETE * FROM invoices WHERE invoice_id = (SELECT * FROM clients WHERE name = 'Myworks'); -- deleting by subqueries

		




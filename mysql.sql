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








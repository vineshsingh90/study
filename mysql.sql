# download mysql installer (mysql-installer-web-community-x.x.x.x.msi) from https://dev.mysql.com/downloads/mysql/
# install the downloaded file with most default and set user name & password
# now run mysql workbench and create a new connection or use existing one
# to comment a query use -- before query line;

#Execute create data or execute below queries:
  drop database if exists 'sql_invoicing'; -- will drop/delete sql_invoicing named db if exists;
  create database 'sql_invoicing'; -- to create new db named sql_invoicing;
  use 'sql_invoicing'; -- to make active sql_invoicing db
  set names utf8; --  It is needed whenever you want to send data to the server having characters that cannot be represented in 
                      pure ASCII, like 'ñ' or 'ö'.
                      That if the MySQL instance is not configured to expect UTF-8 encoding by default from client 
                      connections (many are, depending on your location and platform.
  set character_set_client = utfmb4; -- The utf8mb4 Character Set (4-Byte UTF-8 Unicode Encoding)
                                        The utfmb4 character set has these characteristics:
                                        1. Supports BMP and supplementary characters.
                                        2. Requires a maximum of four bytes per multibyte character. 
                                          utf8mb4 contrasts with the utf8mb3 character set, which supports only BMP characters and uses
                                          a maximum of three bytes per character:
                                        3. For a BMP character, utf8mb4 and utf8mb3 have identical storage 
                                           characteristics: same code values, same encoding, same length.

CREATE TABLE `payment_methods`(
  `payment_method_id` tinyint(4) NOT NULL AUTO_INCREMENT,
   `name` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


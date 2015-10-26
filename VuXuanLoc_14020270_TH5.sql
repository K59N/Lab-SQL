-- Creat by Loc VU
-- Date 26/10/2015

use classicmodels;

SELECT productDescription, substring(productDescription FROM 1 FOR 50) AS TitleOfProducts FROM products;

SELECT CONCAT_WS(' ', firstName, lastName ) AS Fullname,jobTitle FROM employees;

SET FOREIGN_KEY_CHECKS=0;
UPDATE products SET productLine = REPLACE(productLine, 'Cars', 'Automobiles');
UPDATE productlines SET productLine = REPLACE(productLine, 'Cars', 'Automobiles');
SET FOREIGN_KEY_CHECKS=1;

SELECT orderNumber, orderDate, requiredDate, shippedDate, status, DATEDIFF(requiredDate, shippedDate) AS dayLeft FROM orders WHERE shippedDate IS NOT NULL ORDER BY dayLeft DESC LIMIT 5;

SELECT orderNumber, orderDate, requiredDate, shippedDate, status  FROM orders WHERE EXTRACT(YEAR FROM orderDate) = 2005 and EXTRACT(MONTH FROM orderDate) = 5 and shippedDate IS NULL;

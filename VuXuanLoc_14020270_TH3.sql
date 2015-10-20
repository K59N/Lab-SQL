-- Creat by Loc VU
-- Date 12/10/2015

use classicmodels;

SELECT * FROM customers WHERE city IN ("Nantes","Lyon");

SELECT * FROM orders WHERE shippedDate BETWEEN '2003-01-10' AND '2003-03-10';

SELECT * FROM products WHERE productLine LIKE '%cars%';

SELECT * FROM products ORDER BY quantityInStock  LIMIT 10;

SELECT productName, (quantityInStock * buyPrice) AS moneyBacklog FROM products;
-- Creat by Loc VU
-- Date 12/10/2015

use classicmodels;

SELECT * FROM employees WHERE reportsTo is NULL;

SELECT customerNumber FROM payments;

SELECT * FROM orders WHERE requiredDate = '2003-01-18';

SELECT * FROM orders WHERE orderDate >= '2005-04-01' and orderDate <= '2005-04-30' and status = 'In Process'; 

SELECT * FROM products WHERE productLine = 'Classic Cars';

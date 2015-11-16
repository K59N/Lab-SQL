-- Creat by Loc VU
-- Date 16/11/2015

use classicmodels

SELECT productCode, productName FROM products
WHERE productCode in 
(SELECT productCode FROM orderdetails WHERE orderNumber in 
	(SELECT orderNumber FROM orders 
		WHERE EXTRACT(YEAR FROM orderDate) = 2005 and EXTRACT(MONTH FROM orderDate) = 3));

SELECT DISTINCT P.productCode, P.productName FROM products P
INNER JOIN orderdetails OD ON OD.productCode = P.productCode
INNER JOIN orders O ON O.orderNumber =  OD.orderNumber
WHERE EXTRACT(YEAR FROM orderDate) = 2005 and EXTRACT(MONTH FROM orderDate) = 3;


-- SELECT * FROM orders WHERE EXTRACT(YEAR FROM orderDate) = (SELECT MAX(EXTRACT(YEAR FROM orderDate)) FROM orders) and 
-- EXTRACT(MONTH FROM orderDate) = (SELECT MAX(EXTRACT(MONTH FROM orderDate)) FROM orders 
-- 	WHERE EXTRACT(YEAR FROM orderDate) = (SELECT MAX(EXTRACT(YEAR FROM orderDate)) FROM orders)); 
SELECT * FROM orders WHERE EXTRACT(YEAR FROM orderDate) = EXTRACT(YEAR FROM (SELECT MAX(orderDate) FROM orders)) and
EXTRACT(MONTH FROM orderDate) = EXTRACT(MONTH FROM (SELECT MAX(orderDate) FROM orders))

SELECT orderNumber, orderDate, (SELECT SUM(quantityOrdered*priceEach) FROM orderdetails WHERE orderNumber = O.orderNumber) AS TotalCost
FROM orders O;


SELECT C.customerNumber, C.customerName, totalOrder, totalPayment
FROM 
	customers C, 
	
	(SELECT customerNumber , SUM(amount) as totalPayment 
	FROM payments 
	GROUP BY customerNumber) as Sum_amount, 

	(SELECT  OD.orderNumber, SUM(quantityOrdered*priceEach) as totalOrder, customerNumber 
	FROM orderdetails OD, orders O 
	WHERE OD.orderNumber = O.orderNumber 
	GROUP BY customerNumber) as  Sum_order 
WHERE C.customerNumber = Sum_amount.customerNumber AND C.customerNumber = Sum_order.customerNumber;
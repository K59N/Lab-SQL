-- Creat by Loc VU
-- Date 2/11/2015

use classicmodels

SELECT e.employeeNumber, e.firstName, e.lastName, of.city 
FROM employees e JOIN offices of ON e.officeCode = of.officeCode;

SELECT C.customerName, P.productName FROM customers C 
INNER JOIN orders O ON C.customerNumber = O.customerNumber 
INNER JOIN orderdetails OD ON O.orderNumber = OD.orderNumber 
INNER JOIN products P ON OD.productCode = P.productCode;

SELECT productName FROM products 
LEFT JOIN orderdetails ON products.productCode = orderdetails.productCode 
WHERE orderNumber is NULL;

SELECT O.orderDate, O.requiredDate, O.status, sum(OD.priceEach*OD.quantityOrdered) as total 
FROM orders O 
INNER JOIN orderdetails OD ON O.orderNumber	 = OD.orderNumber 
WHERE EXTRACT(YEAR FROM orderDate) = 2005 and EXTRACT(MONTH FROM orderDate) = 3
GROUP BY O.orderNumber;

SELECT P.productLine, sum(P.quantityInStock + OD.quantityOrdered) AS number 
FROM products P JOIN orderdetails OD ON P.productCode = OD.productCode 
GROUP BY P.productLine ORDER BY number DESC;
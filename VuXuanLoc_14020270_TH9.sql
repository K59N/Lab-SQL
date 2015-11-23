-- Creat by Loc VU
-- Date 16/11/2015

use classicmodels


INSERT INTO `productlines` (`productLine`,`textDescription`,`htmlDescription`, `image`) VALUES
('Bicycle','A bicycle, often called a bike or cycle, is a human-powered, pedal-driven, single-track vehicle, having two wheels attached to a frame, one behind the other.', NULL, NULL),
('Cyclo-cross','Cyclo-cross (sometimes cyclocross, CX, CCX, cyclo-X or \'​cross) is a form of bicycle racing.',NULL,NULL);

INSERT INTO `products` VALUES
('S9_1879', '1890 Lamborghini Aventador', 'Classic Cars', '1:9', 'Cars City Classic', 'Model features, official Harley Davidson logos and insignias', '6783', '100.25','200.50'),
('S9_1890', 'P45 Ferrali', 'Classic Cars','1:9', 'Cars Silicon', 'Ferrari S.p.A. is an Italian luxury sports car manufacturer based in Maranello. Founded by Enzo Ferrari in 1929', '3232','65.23','100.23');


INSERT INTO `orders` (`orderNumber`, `orderDate`, `requiredDate`, `shippedDate`, `status`, `comments`, `customerNumber`) VALUES
(10099, '2003-01-14', '2003-01-19','2003-01-15', 'Shipped', NULL, 201);

INSERT INTO `orderdetails` (`orderNumber`,`productCode`, `quantityOrdered`, `priceEach`, `orderLineNumber`) VALUES
(10099, 'S18_4409', 21, 121, 3);



CREATE TABLE temp_orderdetails
( `orderNumber` int(11) NOT NULL,
  `productCode` varchar(15) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `priceEach` double NOT NULL,
  `orderLineNumber` smallint(6) NOT NULL,
  PRIMARY KEY (`orderNumber`,`productCode`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO classicmodels.temp_orderdetails
SELECT * FROM classicmodels.orderdetails OD
WHERE orderNumber in
(SELECT orderNumber FROM orders WHERE orderDate = (SELECT MAX(orderDate) FROM orders O));

SELECT * FROM temp_orderdetails;


UPDATE employees
SET jobTitle = 'Sales Representative'
WHERE jobTitle =  'Sales Rep';

SELECT * FROM employees;

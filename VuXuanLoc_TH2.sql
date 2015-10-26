-- CREATE By Vu Xuan Loc --- 14020270 - sql 2
-- Database: `My_classicmodels`
CREATE TABLE IF NOT EXISTS `orders` (
  `orderNumber` int(11) NOT NULL AUTO_INCREMENT,
  `orderdate` DATETIME NOT NULL,
  `requiredDate` DATETIME NOT NULL,
  `shippedDate` DATETIME NOT NULL,
  `status` varchar(15) NOT NULL,
  `comments` text NOT NULL,
  `customerNumber` int(11) NOT NULL,
  PRIMARY KEY (`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `productlines` (
  `productLine` varchar(50) NOT NULL,
  `textDescription` varchar(4000) NOT NULL,
  `htmlDescription` mediumtext NOT NULL,
  `image` mediumblob NOT NULL,
  PRIMARY KEY (`productLine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `buyPrice` double NOT NULL,
  PRIMARY KEY (`productCode`),
  FOREIGN KEY (`productLine`) REFERENCES productlines(productLine) ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `orderNumber` int(11) NOT NULL AUTO_INCREMENT,
  `productCode` varchar(15) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `priceEach` double NOT NULL,
  `orderLineNumber` smallint(6) NOT NULL,
  PRIMARY KEY (`orderNumber`, `productCode`),
  FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber) ON UPDATE CASCADE,
  FOREIGN KEY (productCode) REFERENCES products(productCode)  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





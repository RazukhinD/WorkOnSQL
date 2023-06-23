USE myfirstdatabase;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	orderid SERIAL PRIMARY KEY, 
    emploeeid VARCHAR(50) NOT NULL,
    amount DECIMAL(7,2),
    orderstatus VARCHAR(45) NOT NULL
   );
INSERT INTO orders (emploeeid, amount, orderstatus)
VALUES 
('e03',15.00,'OPEN'),
('e01',25.50,'OPEN'),
('e05',100.70,'CLOSED'),
('e02',22.18,'OPEN'),
('e04',9.50,'CANCELLED'),
('e04',99.99,'OPEN');

SELECT * FROM orders;

SELECT orderid,orderstatus,
CASE orderstatus
WHEN 'OPEN' THEN 'Order is in open state'
WHEN 'CLOSED' THEN 'Order is closed'
WHEN 'CANCELLED' THEN 'Order is cancelled'
END AS order_summary
FROM orders;
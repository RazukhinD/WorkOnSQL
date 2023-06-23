USE myfirstdatabase;
DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
id int,
order_date date,
bucket varchar(45)
);
INSERT INTO sales (Id, order_date, bucket)
VALUES 
(1,'2021-01-01','101 to 300'),
(1,'2021-01-02','101 to 300'),
(1,'2021-01-03','less than equal to 100'),
(1,'2021-01-04','101 to 300'),
(1,'2021-01-01','greater than 300');
SELECT * FROM sales;
SELECT *,
IF(bucket='101 to 300','medium size',IF(bucket='less than equal to 100','small size','big size'))
AS size_of_order
FROM sales;
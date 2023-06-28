USE myfirstdatabase;
DROP TABLE IF EXISTS salespeople;
CREATE TABLE salespeople (
	snum INT primary KEY, 
	sname VARCHAR(45),
	city VARCHAR(45),
	comm VARCHAR(45)
);

INSERT INTO salespeople (snum, sname, city, comm)
VALUES
('1001','Peel','London','.12'),
('1002','Serres','San Jose','.13'),
('1004','Motika','London','.11'),
('1007','Rifkin','Barcelona','.15'),
('1003','Axelrod','New York','.10');

SELECT * from salespeople;

SELECT city, sname, snum, comm from salespeople;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	cnum INT primary key, 
	cname VARCHAR(45),
	city VARCHAR(45),
	rating VARCHAR(45),
    snum INT NOT NULL,
    CONSTRAINT custonmers_sales_fk
	foreign key (snum) REFERENCES salespeople (snum)
);

INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES
('2001','Hoffman','London','100','1001'),
('2002','Giovanni','Rome','200','1003'),
('2003','Liu','SanJose','200','1002'),
('2004','Grass','Berlin','300','1002'),
('2006','Clemens','London','100','1001'),
('2008','Cisneros','SanJose','300','1007'),
('2007','Pereira','Rome','100','1004');

SELECT * FROM customers;

Select rating from customers
Where city='SanJose';

Select distinct cname, snum from customers;

SELECT * FROM customers WHERE cname LIKE 'G%';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	onum INT, 
	amt DECIMAL(7,2),
	odate VARCHAR(45),
	cnum INT NOT NULL,
    snum INT NOT NULL,
    CONSTRAINT orders_custonmers_fk
	foreign key (cnum) REFERENCES customers (cnum),
    CONSTRAINT orders_sales_fk
	foreign key (snum) REFERENCES salespeople (snum)
);

INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES
('3001','18.69','10/03/1990','2008','1007'),
('3003','767.19','10/03/1990','2001','1001'),
('3002','1900.10','10/03/1990','2007','1004'),
('3005','5160.45','10/03/1990','2003','1002'),
('3006','1098.16','10/03/1990','2008','1007'),
('3009','1713.23','10/04/1990','2002','1003'),
('3007','75.75','10/04/1990','2004','1002'),
('3008','4723.00','10/05/1990','2006','1001'),
('3010','1309.95','10/06/1990','2004','1002'),
('3011','9891.88','10/06/1990','2006','1001');

SELECT * from orders;

SELECT * from orders
WHERE amt>1000;


SELECT MIN(amt) 
from orders;

Select * from customers
Where rating>100 and not city='Rome';


USE myfirstdatabase;
DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);

-- Наполнение данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);


SELECT * FROM staff;

Select * FROM staff order by salary;

Select * FROM staff order by salary LIMIT 5;

Select post,SUM(salary) AS SUM_salary FROM staff
GROUP BY post
HAVING SUM_Salary>100000;






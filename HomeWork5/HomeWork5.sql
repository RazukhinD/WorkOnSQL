use myfirstdatabase;
DROP TABLE IF EXISTS AUTOsecond;
CREATE TABLE AUTOsecond (
id int auto_increment primary key,
Name VARCHAR(45),
Cost int);

insert into AUTOsecond (Name,Cost) VALUES
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);


Select * from AUTOsecond;

Create view cost_before_25000
AS Select * from AUTOsecond
where Cost<25000;

select * from cost_before_25000;

ALTER VIEW cost_before_25000
as select * from AUTOsecond
Where Cost<30000;

select * from cost_before_25000;

Create view skoda_and_audi
as select Name, cost from AUTOsecond
Where Name='Audi' or Name='Skoda';

Select * from skoda_and_audi;

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

-- Есть таблица анализов Analysis:
-- an_id — ID анализа;
-- an_name — название анализа;
-- an_cost — себестоимость анализа;
-- an_price — розничная цена анализа;
-- an_group — группа анализов.
-- Есть таблица групп анализов Groups:
-- gr_id — ID группы;
-- gr_name — название группы;
-- gr_temp — температурный режим хранения.
-- Есть таблица заказов Orders:
-- ord_id — ID заказа;
-- ord_datetime — дата и время заказа;
-- ord_an — ID анализа.

SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_id
AND Orders.ord_datetime >= '2020-02-05'
AND Orders.ord_datetime <= '2020-02-12';


-- Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы вычитаем время станций для пар смежных станций.
-- Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD .
-- Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.

SELECT SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY train_id), station_time)
AS time_to_next_station
FROM Trains;


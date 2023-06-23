SELECT * FROM myfirstdatabase.phonevolume;
SELECT ProductName,Manufacture,Price
FROM phonevolume
WHERE ProductCount>2;
SELECT * FROM phonevolume
WHERE Manufacture='Samsung';
SELECT * FROM phonevolume
WHERE ProductCount*Price>100000 AND ProductCount*Price<145000;
SELECT * from phonevolume
WHERE ProductName RLIKE 'iPhone';
SELECT * from phonevolume
WHERE ProductName RLIKE 'Galaxy';
SELECT * from phonevolume
WHERE ProductName RLIKE '[0-9]';
SELECT * from phonevolume
WHERE ProductName RLIKE '[8]';

-- Задание 4
-- Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997
SELECT Customers.CompanyName
FROM Customers
INNER JOIN Orders
		ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate NOT BETWEEN '15.11.1996' AND '18.02.1997';

-- Вывести названия компаний поставщиков, которые находятся в México D.F.
SELECT CompanyName,
	   City
FROM Customers
WHERE City = 'México D.F.';

-- Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997
SELECT Customers.CompanyName,
	   Orders.OrderDate,
       Orders.OrderSum
FROM Customers
INNER JOIN Orders
		ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate BETWEEN '12.12.1996' AND '18.02.1997';

-- Вывести только тех заказчиков,  название компании которых начинаются с ‘An’
SELECT CompanyName
FROM Customers
WHERE CompanyName LIKE 'An%'
ORDER BY CompanyName;

-- Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц
SELECT Customers.CompanyName,
	   Orders.OrderDate,
       Orders.OrderSum
FROM Customers
INNER JOIN Orders
		ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderSum > 17000;

-- Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания
SELECT Customers.CompanyName,
	   SUM(Orders.OrderSum) AS Sum
FROM Customers
INNER JOIN Orders
		ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CompanyName
ORDER BY Customers.CompanyName DESC;

-- Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов
SELECT Customers.CompanyName,
	   Orders.OrderDate
FROM Customers
LEFT JOIN Orders
	   ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CompanyName;



       


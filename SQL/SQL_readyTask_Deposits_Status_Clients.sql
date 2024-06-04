-- Написать запрос, выводящий количество работающих счетов (депозитов) с остатком более 0 по каждому клиенту
SELECT Clients.ClientName,
	   SUM(IF((Deposits.Currency = 'RUB'), 1, 0)) AS 'Рубли',
       SUM(IF((Deposits.Currency = 'USD'), 1, 0)) AS 'Доллары',
       SUM(IF((Deposits.Currency = 'EUR'), 1, 0)) AS 'Евро'
FROM Deposits
INNER JOIN Status
		ON Deposits.StatusID = Status.StatusID
INNER JOIN Clients
		ON Deposits.ClientID = Clients.ClientID
WHERE Status.StatusName = 'Работает'
	  AND Deposits.Saldo > 0
GROUP BY Clients.ClientName;
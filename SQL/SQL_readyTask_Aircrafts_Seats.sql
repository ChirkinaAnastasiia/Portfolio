/*
Есть две таблицы: aircrafts и seats

Суть задания: вывести количество мест в каждом конкретном самолете из моделей компании “Боинг”.
Синтаксис написания запроса - PostgreSQL. В ответе на задание - приложить запрос.
*/

SELECT aircrafts.model,
	   COUNT(seats.seat_no)
FROM aircrafts
JOIN seats
	ON aircrafts.aircraft_code = seats.aircraft_code
WHERE aircrafts.model LIKE '%Боинг%'
GROUP BY aircrafts.model
ORDER BY aircrafts.model;
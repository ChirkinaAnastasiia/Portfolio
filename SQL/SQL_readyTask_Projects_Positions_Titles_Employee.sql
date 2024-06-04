/* 
Вывести среднюю заработную плату всех тестировщиков на проекте “ПУМЧД”.
Ответ должен содержать столбцы:
	- Название проекта
	- Название должности
	- Средняя заработная плата 
*/

SELECT projects.project_name,
	   titles.titel_name,
       ROUND(AVG(positions.salary), 2) AS avg_salary
FROM positions
INNER JOIN employee
		ON positions.employee_id = employee.employee_id
INNER JOIN projects
		ON positions.project_id = projects.project_id
INNER JOIN titles
		ON positions.title_id = titles.id
WHERE projects.project_name =  'ПУМЧД'
	  AND titles.titel_name LIKE '%естировщик%'
GROUP BY projects.project_name, titles.titel_name
ORDER BY projects.project_name;
       
       
/*
Вывести всех работников, которые работают сразу на нескольких проектах.
Ответ должен содержать следующие столбцы:
	- Имя и фамилия сотрудника
    - Название должности
*/ 
    
SELECT CONCAT(employee.first_name, ' ', employee.last_name) AS full_name,
	   titles.titel_name
FROM positions
INNER JOIN employee
		ON positions.employee_id = employee.employee_id
INNER JOIN titles
		ON positions.title_id = titles.id
GROUP BY full_name, titles.titel_name
HAVING COUNT(positions.project_id > 1)
ORDER BY full_name;


-- Есть 2 таблицы: users и personal_data
-- 1. найти количество всех юзеров с почтой yandex
SELECT COUNT(personal_data.users_id) AS users_count
FROM personal_data
JOIN users
	 ON personal_data.users_id = users.ID
WHERE users.email LIKE '%@yandex.ru%' 
	  OR users.email LIKE '%@ya.ru%';

-- 2. найти всех юзеров с датой рождения с 1995 по 2000 года с сортировкой по возрастанию (в выводе отобразить поля birthday_date, email, mobile_number)
SELECT personal_data.birthday_date,
	   users.email,
	   users.mobile_number
FROM personal_data
JOIN users 
	 ON personal_data.users_id = users.ID
WHERE personal_data.birthday_date BETWEEN '1995-01-01'
								  AND '2000-12-31'
ORDER BY personal_data.birthday_date;


-- 3. вывести последнего добавленного в бд юзера, у которого нет даты рождения
-- первый вариант
SELECT max_table.max_id AS user_id,
	   users.email,
       users.mobile_number
FROM (
	  SELECT MAX(users_id) AS max_id
	  FROM personal_data
      WHERE personal_data.birthday_date IS NULL
      ) max_table
JOIN users
	 ON users.ID = max_table.max_id;

-- второй вариант
SELECT users_id
FROM personal_data
WHERE birthday_date IS NULL
ORDER BY users_id DESC
LIMIT 1;

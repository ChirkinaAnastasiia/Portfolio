-- Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а
SELECT *
FROM user
WHERE level_id = 1
      AND skill > 799000
      AND user_name LIKE '%a%';	

-- Удалить всех пользователей, у которых skill меньше 100000
DELETE FROM user
WHERE skill < 100000;
								
-- Вывести все данные из таблицы user в порядке убывания по полю skill
SELECT *
FROM user
ORDER BY skill DESC;
 								
-- Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill = 10
-- если в столбец id заполняется через auto increment
INSERT INTO user(user_name, level_id, skill)
VALUES ('Oleg', 4, 10);

-- если нет автозаполнения столбца id
INSERT INTO user(id, user_name, level_id, skill)
VALUES (7, 'Oleg', 4, 10);
								
-- Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000	
UPDATE user
SET skill = 2000000
WHERE level_id < 2;
							
-- Выбрать user_name всех пользователей уровня admin используя подзапрос
SELECT user_name
FROM user
WHERE level_id IN (
				   SELECT id
				   FROM level
				   WHERE level_name = 'admin'
				  );
								
-- Выбрать user_name всех пользователей уровня admin используя join
SELECT user.user_name
FROM user
INNER JOIN level
	    ON user.level_id = level.id
WHERE level.level_name = 'admin';
	
							
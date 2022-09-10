-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
-- (критерии активности необходимо определить самостоятельно).

SELECT id, SUM(activ) AS total_activ FROM (
	SELECT id, 0 AS activ FROM users
	UNION
	SELECT user_id AS id, COUNT(*) AS activ FROM media GROUP BY user_id
	UNION
	SELECT user_id, COUNT(*) FROM likes GROUP BY user_id
	UNION
	SELECT from_user_id, COUNT(*) FROM messages GROUP BY from_user_id) AS activities
GROUP BY id ORDER BY total_activ LIMIT 10;
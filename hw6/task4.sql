-- 4. Подсчитать количество лайков которые получили 10 самых молодых пользователей.

SELECT COUNT(id) FROM likes WHERE user_id IN (
  SELECT * FROM (
    SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10
    ) as smth
);
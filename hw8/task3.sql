-- 3. Найти 10 пользователей, которые проявляют наименьшую активность в
-- использовании социальной сети.

SELECT users.id, users.first_name, users.last_name,
   COUNT(DISTINCT messages.id) + 
   COUNT(DISTINCT likes.id) + 
   COUNT(DISTINCT media.id) AS activity
  FROM users
    LEFT JOIN messages 
      ON users.id = messages.from_user_id
    LEFT JOIN likes
      ON users.id = likes.user_id
    LEFT JOIN media
      ON users.id = media.user_id
  GROUP BY users.id
  ORDER BY activity 
  LIMIT 10;
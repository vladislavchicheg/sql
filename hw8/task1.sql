-- 1. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT profiles.gender, count(*) as total
	FROM likes
		JOIN profiles ON profiles.user_id = likes.user_id 
    GROUP BY profiles.gender
    ORDER BY total DESC
    LIMIT 1;
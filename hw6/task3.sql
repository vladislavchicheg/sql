-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT COUNT(*) AS target_id, gender FROM likes, profiles
WHERE likes.target_id = profiles.user_id
GROUP BY gender;

-- 2. Создать все необходимые внешние ключи и диаграмму отношений.

-- Смотрим структуру таблицы profiles
DESC profiles;

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      ON DELETE SET NULL;
     
-- Смотрим структуру таблицы messages
DESC messages;

ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);

-- Смотрим структуру таблицы communities_users
DESC communities_users;

ALTER TABLE communities_users
	ADD CONSTRAINT communities_users_community_id_fk
		FOREIGN KEY (community_id) REFERENCES communities(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	ADD CONSTRAINT communities_users_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE;

-- Смотрим структуру таблицы friendships
DESC friendships;

ALTER TABLE friendships
	ADD CONSTRAINT friendships_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE,			
	ADD CONSTRAINT friendships_friend_id_fk
		FOREIGN KEY (friend_id) REFERENCES users(id)
			ON DELETE CASCADE;

-- Смотрим структуру таблицы media
DESC media;
	
ALTER TABLE media
	ADD CONSTRAINT media_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE  -- Возможны варианты, SET NULL если мы храним медиа файлы пользователя 
			ON UPDATE CASCADE,
	ADD CONSTRAINT media_media_type_id_fk
		FOREIGN KEY (media_type_id) REFERENCES media_types(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE;

-- Смотрим структуру таблицы likes
DESC likes;

ALTER TABLE likes
	ADD CONSTRAINT likes_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE   
			ON UPDATE CASCADE,
	ADD CONSTRAINT likes_target_id_fk
		FOREIGN KEY (target_id) REFERENCES target_types(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE;
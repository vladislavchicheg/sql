/**
 *	2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени. *
 */

hset user_email name email
hset email_user email name

hget user_email "name" -- поиск почты
hget email_user "email" -- поиск имени
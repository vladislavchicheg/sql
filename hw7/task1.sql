-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

INSERT INTO orders (user_id)
SELECT id FROM users WHERE name = 'Геннадий';

INSERT INTO orders_products (order_id, product_id, total)
SELECT LAST_INSERT_ID(), id, 2 FROM products
WHERE name = 'Intel Core i5-7400';

INSERT INTO orders (user_id)
SELECT id FROM users WHERE name = 'Наталья';

INSERT INTO orders_products (order_id, product_id, total)
SELECT LAST_INSERT_ID(), id, 1 FROM products
WHERE name IN ('Intel Core i5-7400', 'Gigabyte H310M S2H');

INSERT INTO orders (user_id)
SELECT id FROM users WHERE name = 'Иван';

INSERT INTO orders_products (order_id, product_id, total)
SELECT LAST_INSERT_ID(), id, 1 FROM products
WHERE name IN ('AMD FX-8320', 'ASUS ROG MAXIMUS X HERO');

SELECT 
	u.id AS user_id, u.name,
	o.id AS order_id
FROM 
	users AS u
RIGHT JOIN
	orders AS o 
ON
	u.id = o.user_id;
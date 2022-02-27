DROP DATABASE IF EXISTS stroi_store;
CREATE DATABASE stroi_store;

USE stroi_store;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	email VARCHAR(120) UNIQUE,
	password_hash VARCHAR(100),
	phone BIGINT UNSIGNED UNIQUE,
	INDEX users_lastname_firstname_idx(lastname, firstname)
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

INSERT INTO media_types VALUES 
	(1,'Photo'),
	(2,'Video'),
	(3,'Documents');

-- таблица где хранятся все медиа файлы
DROP TABLE IF EXISTS media;
CREATE TABLE media (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	filename VARCHAR(255),
	media_size INT,
	metadata JSON,
	media_type_id BIGINT UNSIGNED,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_type_id) REFERENCES media_types(id) 
	ON UPDATE CASCADE ON DELETE CASCADE
); 

-- профиль для физических лиц, кто ищет работу
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id SERIAL PRIMARY KEY,
	firstname VARCHAR(100) COMMENT 'Имя',
	lastname VARCHAR(100) COMMENT 'Фамилия',
	skills VARCHAR (255) COMMENT 'Навыки работника',
	birthday DATE,
	about_me TEXT COMMENT 'Несколько слов о себе',
	photo_id BIGINT UNSIGNED,
	town VARCHAR(100) COMMENT 'Город в котором ищете работу',
	created_at DATETIME DEFAULT NOW(),
INDEX profiles_lastname_firstname_idx(lastname, firstname),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (photo_id) REFERENCES media(id)
ON UPDATE CASCADE ON DELETE CASCADE
);
	
-- профиль для юредических лиц, кто ищет работника
DROP TABLE IF EXISTS profiles_business;
CREATE TABLE profiles_business (
	user_id SERIAL PRIMARY KEY,
	company_name VARCHAR (255),
	requirements VARCHAR (255) COMMENT 'Требования от работника',
	about_company TEXT COMMENT 'Несколько слов о компании',
	inn BIGINT UNSIGNED UNIQUE, -- ИНН
	kpp BIGINT UNSIGNED UNIQUE, -- КПП
	photo_id BIGINT UNSIGNED,
	town VARCHAR(100) COMMENT 'Город в котором ищете работника',
	created_at DATETIME DEFAULT NOW(),
INDEX profiles_business_company_name_idx(company_name),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (photo_id) REFERENCES media(id)
ON UPDATE CASCADE ON DELETE CASCADE
);

-- сообщения
DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (from_user_id) REFERENCES users(id),
	FOREIGN KEY (to_user_id) REFERENCES users(id)
);

-- группы товаров
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	poduct_name_id VARCHAR (255)
);

INSERT INTO products VALUES 
	(1,'Instruments'), -- инструмент
	(2,'Power tool'), -- электроинструмент
	(3,'Paints'), -- краски
	(4,'Storage'), -- хранение
	(5,'Hardware'), -- скобянные изделия
	(6,'Construction Materials'), -- строительные материалы
	(7,'Tile'), -- плитка, черепица
	(8,'Lighting'), -- освещение
	(9,'Metal products'), -- металические изделия
	(10,'Consumables') -- расхоные материалы для инструмента
;

-- промежуточная таблица выбора товара
DROP TABLE IF EXISTS purchase_selection; -- промежуточная таблица выбора товара
CREATE TABLE purchase_selection (
	id SERIAL PRIMARY KEY,
	product_name varchar (255),
	INDEX product_name_idx(product_name)
);
	
-- Отдельные таблицы для каждого вида продукции (products). 
-- В них будет неизвестное пока число строк (для каждого наименования).
-- Чтобы не было мешанины.

 -- инструмент
DROP TABLE IF EXISTS instruments;
CREATE TABLE instruments (
	id SERIAL PRIMARY KEY,
	instruments_name varchar (255), -- название продукта
	product_image_id BIGINT UNSIGNED NOT NULL UNIQUE,
	price decimal(9,2) UNSIGNED NOT NULL, -- цена продукта
	quantity_prod int UNSIGNED NOT NULL, -- количество продукта
	comment_prod text, -- коментарий к продукту
	update_time datetime DEFAULT current_timestamp ON UPDATE current_timestamp,
	products_id BIGINT UNSIGNED NOT NULL UNIQUE, -- id группы товаров (products)
	FOREIGN KEY (products_id) REFERENCES products(id),
	FOREIGN KEY (id) REFERENCES purchase_selection(id),
	FOREIGN KEY (instruments_name) REFERENCES purchase_selection(product_name),
	FOREIGN KEY (product_image_id) REFERENCES media(id)
);
	
-- электроинструмент
DROP TABLE IF EXISTS power_tool; 
CREATE TABLE power_tool (
	id SERIAL PRIMARY KEY,
	power_tool_name varchar (255),
	product_image_id BIGINT UNSIGNED NOT NULL UNIQUE,
	price decimal(9,2) UNSIGNED NOT NULL,
	quantity_prod int UNSIGNED NOT NULL,
	comment_prod text,
	update_time datetime DEFAULT current_timestamp ON UPDATE current_timestamp,
	products_id BIGINT UNSIGNED NOT NULL UNIQUE,
	FOREIGN KEY (products_id) REFERENCES products(id),
	FOREIGN KEY (id) REFERENCES purchase_selection(id),
	FOREIGN KEY (power_tool_name) REFERENCES purchase_selection(product_name),
	FOREIGN KEY (product_image_id) REFERENCES media(id)
);
	
-- краски
DROP TABLE IF EXISTS paints;
CREATE TABLE paints (
	id SERIAL PRIMARY KEY,
	paints_name varchar (255),
	product_image_id BIGINT UNSIGNED NOT NULL UNIQUE,
	price decimal(9,2) UNSIGNED NOT NULL,
	quantity_prod int UNSIGNED NOT NULL,
	comment_prod text,
	update_time datetime DEFAULT current_timestamp ON UPDATE current_timestamp,
	products_id BIGINT UNSIGNED NOT NULL UNIQUE,
	FOREIGN KEY (products_id) REFERENCES products(id),
	FOREIGN KEY (id) REFERENCES purchase_selection(id),
	FOREIGN KEY (paints_name) REFERENCES purchase_selection(product_name),
	FOREIGN KEY (product_image_id) REFERENCES media(id)
	);
	
-- хранение
DROP TABLE IF EXISTS storage;
CREATE TABLE storage (
	id SERIAL PRIMARY KEY,
	storage_name varchar (255),
	product_image_id BIGINT UNSIGNED NOT NULL UNIQUE,
	price decimal(9,2) UNSIGNED NOT NULL,
	quantity_prod int UNSIGNED NOT NULL,
	comment_prod text,
	update_time datetime DEFAULT current_timestamp ON UPDATE current_timestamp,
	products_id BIGINT UNSIGNED NOT NULL UNIQUE,
	FOREIGN KEY (products_id) REFERENCES products(id),
	FOREIGN KEY (id) REFERENCES purchase_selection(id),
	FOREIGN KEY (storage_name) REFERENCES purchase_selection(product_name),
	FOREIGN KEY (product_image_id) REFERENCES media(id)
	);
	
-- скобянные изделия
DROP TABLE IF EXISTS hardware;
CREATE TABLE hardware (
	id SERIAL PRIMARY KEY,
	hardware_name varchar (255),
	product_image_id BIGINT UNSIGNED NOT NULL UNIQUE,
	price decimal(9,2) UNSIGNED NOT NULL,
	quantity_prod int UNSIGNED NOT NULL,
	comment_prod text,
	update_time datetime DEFAULT current_timestamp ON UPDATE current_timestamp,
	products_id BIGINT UNSIGNED NOT NULL UNIQUE,
	FOREIGN KEY (products_id) REFERENCES products(id),
	FOREIGN KEY (id) REFERENCES purchase_selection(id),
	FOREIGN KEY (hardware_name) REFERENCES purchase_selection(product_name),
	FOREIGN KEY (product_image_id) REFERENCES media(id)
);
	
-- строительные материалы
DROP TABLE IF EXISTS construction_materials;
CREATE TABLE construction_materials (
	id SERIAL PRIMARY KEY,
	construction_materials_name varchar (255),
	product_image_id BIGINT UNSIGNED NOT NULL UNIQUE,
	price decimal(9,2) UNSIGNED NOT NULL,
	quantity_prod int UNSIGNED NOT NULL,
	comment_prod text,
	update_time datetime DEFAULT current_timestamp ON UPDATE current_timestamp,
	products_id BIGINT UNSIGNED NOT NULL UNIQUE,
	FOREIGN KEY (products_id) REFERENCES products(id),
	FOREIGN KEY (id) REFERENCES purchase_selection(id),
	FOREIGN KEY (construction_materials_name) REFERENCES purchase_selection(product_name),
	FOREIGN KEY (product_image_id) REFERENCES media(id)
);
	
-- плитка, черепица
DROP TABLE IF EXISTS tile;
CREATE TABLE tile (
	id SERIAL PRIMARY KEY,
	tile_name varchar (255),
	product_image_id BIGINT UNSIGNED NOT NULL UNIQUE,
	price decimal(9,2) UNSIGNED NOT NULL,
	quantity_prod int UNSIGNED NOT NULL,
	comment_prod text,
	update_time datetime DEFAULT current_timestamp ON UPDATE current_timestamp,
	products_id BIGINT UNSIGNED NOT NULL UNIQUE,
	FOREIGN KEY (products_id) REFERENCES products(id),
	FOREIGN KEY (id) REFERENCES purchase_selection(id),
	FOREIGN KEY (tile_name) REFERENCES purchase_selection(product_name),
	FOREIGN KEY (product_image_id) REFERENCES media(id)
);
	
-- освещение
DROP TABLE IF EXISTS lighting;
CREATE TABLE lighting (
	id SERIAL PRIMARY KEY,
	lighting_name varchar (255),
	product_image_id BIGINT UNSIGNED NOT NULL UNIQUE,
	price decimal(9,2) UNSIGNED NOT NULL,
	quantity_prod int UNSIGNED NOT NULL,
	comment_prod text,
	update_time datetime DEFAULT current_timestamp ON UPDATE current_timestamp,
	products_id BIGINT UNSIGNED NOT NULL UNIQUE,
	FOREIGN KEY (products_id) REFERENCES products(id),
	FOREIGN KEY (id) REFERENCES purchase_selection(id),
	FOREIGN KEY (lighting_name) REFERENCES purchase_selection(product_name),
	FOREIGN KEY (product_image_id) REFERENCES media(id)
);
	
-- металические изделия
DROP TABLE IF EXISTS metal_products;
CREATE TABLE metal_products (
	id SERIAL PRIMARY KEY,
	metal_products_name varchar (255),
	product_image_id BIGINT UNSIGNED NOT NULL UNIQUE,
	price decimal(9,2) UNSIGNED NOT NULL,
	quantity_prod int UNSIGNED NOT NULL,
	comment_prod text,
	update_time datetime DEFAULT current_timestamp ON UPDATE current_timestamp,
	products_id BIGINT UNSIGNED NOT NULL UNIQUE,
	FOREIGN KEY (products_id) REFERENCES products(id),
	FOREIGN KEY (id) REFERENCES purchase_selection(id),
	FOREIGN KEY (metal_products_name) REFERENCES purchase_selection(product_name),
	FOREIGN KEY (product_image_id) REFERENCES media(id)
);

-- расхоные материалы для инструмента
DROP TABLE IF EXISTS consumables;
CREATE TABLE consumables (
	id SERIAL PRIMARY KEY,
	consumables_name varchar (255),
	product_image_id BIGINT UNSIGNED NOT NULL UNIQUE,
	price decimal(9,2) UNSIGNED NOT NULL,
	quantity_prod int UNSIGNED NOT NULL,
	comment_prod text,
	update_time datetime DEFAULT current_timestamp ON UPDATE current_timestamp,
	products_id BIGINT UNSIGNED NOT NULL UNIQUE,
	FOREIGN KEY (products_id) REFERENCES products(id),
	FOREIGN KEY (id) REFERENCES purchase_selection(id),
	FOREIGN KEY (consumables_name) REFERENCES purchase_selection(product_name),
	FOREIGN KEY (product_image_id) REFERENCES media(id)
);
-- Закончились таблицы для отдельных продуктов (prodacts).

-- покупательская корзина
DROP TABLE IF EXISTS shopping_cart;
CREATE TABLE shopping_cart (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	purchase_selection_id BIGINT UNSIGNED NOT NULL UNIQUE, -- id товара
	product_name varchar (255), -- название товара
	quantity int NOT NULL, -- количество	
	price decimal(9,2) UNSIGNED NOT NULL, -- цена
	stock_id int NOT NULL, -- скидка
	discount_amount int UNSIGNED NOT NULL, -- размер скидки
	total decimal(9,2) UNSIGNED NOT NULL, -- общая сумма покупки
	update_time datetime DEFAULT current_timestamp ON UPDATE current_timestamp,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (purchase_selection_id) REFERENCES purchase_selection(id),
	FOREIGN KEY (product_name) REFERENCES purchase_selection(product_name)
);

UPDATE shopping_cart SET total = quantity * price; -- считает общую сумм скидки
































	




















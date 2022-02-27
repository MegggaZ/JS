/* Проект базы данных сайта. Данный сай призван упростить поиск рабочих и самой работу в сферре строительства.
 * Найти нормальных рабочих, ну или наоборот нормальную работу (не на постоянку, а как подработка), бывает очень сложно. 
 * Есть конечно много сайтов которые специализируются на этом, но мне хочется сделать более специализированный сайт
 * направленный конкретно на строительство. В дальнейшем появиться интернет магазин. То есть "не отхдя от кассы" 
 * можно и народ найти и купить все что понадобиться. 
 */

DROP DATABASE IF EXISTS stroi;
CREATE DATABASE stroi;

USE stroi;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	email VARCHAR(120) UNIQUE,
	password_hash VARCHAR(100),
	phone BIGINT UNSIGNED UNIQUE
);
	
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id SERIAL PRIMARY KEY,
	firstname VARCHAR(100) COMMENT 'Имя',
	lastname VARCHAR(100) COMMENT 'Фамилия',
	skills VARCHAR (255), COMMENT 'Навыки работника',
	birthday DATE,
	about_me TEXT COMMENT 'Несколько слов о себе',
	photo_id BIGINT UNSIGNED,
	town VARCHAR(100) COMMENT 'Город в котором ищете работу',
	created_at DATETIME DEFAULT NOW(),
INDEX profiles_lastname_firstname_idx(lastname, firstname),
FOREIGN KEY (user_id) REFERENCES users(id)
ON UPDATE CASCADE ON DELETE CASCADE
);
	
DROP TABLE IF EXISTS profiles_business;
CREATE TABLE profiles_business (
	user_id SERIAL PRIMARY KEY,
	company_name VARCHAR (255),
	requirements VARCHAR (255), COMMENT 'Требования от работника',
	about_company TEXT COMMENT 'Несколько слов о компании',
	inn BIGINT UNSIGNED UNIQUE, -- ИНН
	kpp BIGINT UNSIGNED UNIQUE, -- КПП
	photo_id BIGINT UNSIGNED,
	town VARCHAR(100) COMMENT 'Город в котором ищете работника',
	created_at DATETIME DEFAULT NOW(),
INDEX profiles_business_company_name_idx(company_name),
FOREIGN KEY (user_id) REFERENCES users(id)
ON UPDATE CASCADE ON DELETE CASCADE
);

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

-- Отправка сообщения сразу на email. Пока в разработке)

-- DROP TABLE IF EXISTS emails;
-- CREATE TABLE emails (
-- 	id SERIAL PRIMARY KEY,
-- 	from_user_email_id BIGINT UNSIGNED NOT NULL,
-- 	to_user_email_id BIGINT UNSIGNED NOT NULL,
-- 	body TEXT,
-- 	created_at DATETIME DEFAULT NOW(),
-- 	FOREIGN KEY (from_user_email_id) REFERENCES users(id),
-- 	FOREIGN KEY (to_user_email_id) REFERENCES users(id)
-- );

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

INSERT INTO media_types VALUES 
	(1,'Photo'),
	(2,'Video'),
	(3,'Documents');

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
	(7,'Tile'), -- Плитка, черепица
	(8,'Lighting'), -- освещение
	(9,'Metal products'), -- Металические изделия
	(10,'Consumables') -- расхоные материалы для инструмента
;
	



























DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;

USE vk;
-- таблица пользователей
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	firstname VARCHAR(100),
	lastname VARCHAR(100) COMMENT 'Фамилия',
	email VARCHAR(120) UNIQUE,
	password_hash VARCHAR(100),
	phone BIGINT UNSIGNED UNIQUE,
	is_deleted BIT DEFAULT 0,
	INDEX users_lastname_firstname_idx(lastname, firstname)
);

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id SERIAL PRIMARY KEY,
	gender CHAR(1),
	birthday DATE,
	photo_id BIGINT UNSIGNED,
	home_town VARCHAR(100),
	created_at DATETIME DEFAULT NOW()
);
ALTER TABLE profiles ADD CONSTRAINT fk_user_id
	FOREIGN KEY (user_id) REFERENCES users(id) 
	ON UPDATE CASCADE ON DELETE CASCADE;
	
DROP TABLE IF EXISTS messages;
CREATE TABLE messages(
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (from_user_id) REFERENCES users(id),
	FOREIGN KEY (to_user_id) REFERENCES users(id)
); 

DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
	PRIMARY KEY (initiation_user_id, target_user_id),
	initiation_user_id BIGINT UNSIGNED NOT NULL,
	target_user_id BIGINT UNSIGNED NOT NULL,
	status ENUM('requested', 'approved', 'declined', 'unfriended'),
	requestede_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE  NOW(),
	CHECK (initiation_user_id <> target_user_id),
	FOREIGN KEY (initiation_user_id) REFERENCES users(id),
	FOREIGN KEY (target_user_id) REFERENCES users(id)
);
	
DROP TABLE IF EXISTS communities;
CREATE TABLE communities (
	id SERIAL PRIMARY KEY,
	name VARCHAR(150)
);

DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities (
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (user_id, community_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (community_id) REFERENCES communities(id)
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

DROP TABLE IF EXISTS media;
CREATE TABLE media (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	filename VARCHAR(255),
	media_size INT,
	metadata JSON,
	media_type_id BIGINT UNSIGNED,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_type_id) REFERENCES media_types(id) 
	ON UPDATE CASCADE ON DELETE SET NULL
); 

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_id) REFERENCES media(id) 
);

DROP TABLE IF EXISTS photo_albums;
CREATE TABLE photo_albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) DEFAULT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
	id SERIAL PRIMARY KEY,
	album_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (album_id) REFERENCES photo_albums(id),
	FOREIGN KEY (media_id) REFERENCES media(id)
);

/*
Практическое задание по теме “Введение в проектирование БД”
Написать cкрипт, добавляющий в БД vk, которую создали на 3 вебинаре, 3-4 новые таблицы (с перечнем полей, указанием индексов и внешних ключей).
*/

DROP TABLE IF EXISTS films; -- фильмы
CREATE TABLE films (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) DEFAULT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS gift_album; -- альбом подарков
CREATE TABLE gift_album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	media_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS gifts; -- подарки
CREATE TABLE gifts (
	id SERIAL PRIMARY KEY,
	send_user_id BIGINT UNSIGNED NOT NULL,
	accept_user_id BIGINT UNSIGNED NOT NULL,
	gift_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (send_user_id) REFERENCES users(id),
	FOREIGN KEY (accept_user_id) REFERENCES users(id),
	FOREIGN KEY (gift_id) REFERENCES gift_album(id)
); 













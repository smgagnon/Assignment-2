CREATE DATABASE ticketing;

USE ticketing;

CREATE TABLE IF NOT EXISTS users (
    user_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    email VARCHAR(100) NOT NULL DEFAULT '',
    password TEXT NOT NULL,
    first_name VARCHAR(100) NOT NULL DEFAULT '',
    last_name VARCHAR(100) NOT NULL DEFAULT '',
    isStaff BOOLEAN DEFAULT 0
);

CREATE TABLE IF NOT EXISTS tickets (
    ticket_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    status BOOLEAN DEFAULT 1,
    subject VARCHAR (100), 
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS details (
ticket_id INT UNSIGNED NOT NULL,
details TEXT NOT NULL,
date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (ticket_id) REFERENCES tickets (ticket_id)
);
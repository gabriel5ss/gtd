CREATE DATABASE IF NOT EXISTS gtd_base;

USE gtd_base;

CREATE TABLE IF NOT EXISTS gtd_user(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,
    senha VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS gtd_card(
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES gtd_user(user_id),
    card_title VARCHAR(32) NOT NULL,
    card_body VARCHAR(255) NOT NULL,
    card_status VARCHAR(16) NOT NULL
);

INSERT INTO gtd_user (nome, email, senha) 
VALUES ('Gabriel', 'teste@teste.com', '123456')

INSERT INTO gtd_card (user_id, card_title, card_body, card_status) 
VALUES (
    (SELECT user_id FROM gtd_user WHERE email = "teste@teste.com" 
    AND senha = "123456"), 
    'Esse é o primeiro titulo do gtd', 
    'Esse é o primeiro Body de cartão gtd', 
    'ATIVO')

INSERT INTO gtd_card (user_id, card_title, card_body, card_status) 
VALUES (
    (SELECT user_id FROM gtd_user WHERE email = "teste@teste.com" 
    AND senha = "123456"), 
    'Esse é o segundo titulo do gtd', 
    'Esse é o segundo Body de cartão gtd', 
    'ATIVO');

INSERT INTO gtd_card (user_id, card_title, card_body, card_status) 
VALUES (
    (SELECT user_id FROM gtd_user WHERE email = "teste@teste.com" 
    AND senha = "123456"), 
    'Esse é o terceiro titulo do gtd', 
    'Esse é o terceiro Body de cartão gtd', 
    'ATIVO');

INSERT INTO gtd_card (user_id, card_title, card_body, card_status) 
VALUES (
    (SELECT user_id FROM gtd_user WHERE email = "teste@teste.com" 
    AND senha = "123456"), 
    'Esse é o quarto titulo do gtd', 
    'Esse é o quarto Body de cartão gtd', 
    'ATIVO');

INSERT INTO gtd_card (user_id, card_title, card_body, card_status) 
VALUES (
    (SELECT user_id FROM gtd_user WHERE email = "teste@teste.com" 
    AND senha = "123456"), 
    'Esse é o quinto titulo do gtd', 
    'Esse é o quinto Body de cartão gtd', 
    'ATIVO');
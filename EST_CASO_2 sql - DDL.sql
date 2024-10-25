#CREATE DATABASE EXERCICIO2;
USE EXERCICIO2;

CREATE TABLE IF NOT EXISTS GRUPOS(
ID_GRUPO INT PRIMARY KEY,
NOME_GRUPO VARCHAR(100) NOT NULL,
DESCRICAO_GRUPO TEXT NOT NULL);

CREATE TABLE IF NOT EXISTS USUARIOS(
ID_USUARIO INT PRIMARY KEY,
NOME_USUARIO VARCHAR(100) NOT NULL,
SOBRENOME VARCHAR(100) NOT NULL,
EMAIL VARCHAR(20) NOT NULL);

CREATE TABLE IF NOT EXISTS POSTAGENS(
ID_POST INT PRIMARY KEY,
TEXTO_POST TEXT,
IMAGEM_POST BLOB,
DATA_HORA DATETIME NOT NULL,
USUARIO INT NOT NULL,
CONSTRAINT FK_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIOS(ID_USUARIO));

CREATE TABLE IF NOT EXISTS COMENTARIOS(
ID_COMENTARIO INT PRIMARY KEY,
TEXTO TEXT NOT NULL,
DATAHORA DATETIME NOT NULL,
USUARIO INT NOT NULL,
POST INT NOT NULL,
CONSTRAINT FK_COMM_USUARIO FOREIGN KEY(USUARIO) REFERENCES USUARIOS(ID_USUARIO),
CONSTRAINT FK_COMM_POST FOREIGN KEY(POST) REFERENCES POSTAGENS(ID_POST));

CREATE TABLE IF NOT EXISTS USUARIOS_GRUPOS(
UG_USUARIO INT,
UG_GRUPO INT,
PRIMARY KEY(UG_USUARIO,UG_GRUPO),
CONSTRAINT FK_UG_USUARIO FOREIGN KEY(UG_USUARIO) REFERENCES USUARIOS(ID_USUARIO),
CONSTRAINT FK_UG_GRUPO FOREIGN KEY(UG_GRUPO) REFERENCES GRUPOS(ID_GRUPO));

CREATE TABLE IF NOT EXISTS USUARIOS_SEGUIDORES(
US_USUARIO INT,
US_SEGUIDOR INT,
PRIMARY KEY(US_USUARIO,US_SEGUIDOR),
CONSTRAINT FK_US_USUARIO FOREIGN KEY(US_USUARIO) REFERENCES USUARIOS(ID_USUARIO),
CONSTRAINT FK_US_SEGUIDOR FOREIGN KEY(US_SEGUIDOR) REFERENCES USUARIOS(ID_USUARIO));
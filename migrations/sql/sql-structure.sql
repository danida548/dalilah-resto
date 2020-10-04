CREATE DATABASE IF NOT exists delilah;


DROP DATABASE delilah;


use delilah;

CREATE TABLE IF NOT exists users (
    ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    USER_NAME varchar(30) NOT NULL,
    FULL_NAME varchar(60) NOT NULL,
    EMAIL varchar(100) NOT NULL,
    PHONE_COUNTRY_CODE INT NOT NULL,
    PHONE_NUMBER INT NOT NULL,
    ADDRES varchar(200),
    PASSWORD varchar(100) NOT NULL
);


select * from users;
alter table users add column ADDRESS varchar(250) not null;
alter table users drop column ADDRES;

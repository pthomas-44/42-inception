/* WORDPRESS DATABASE */
create database if not exists WORDPRESS;

/* DATABASE USERS */
create user 'pthomas'@'localhost' identified by 'pthomas44';

/* APPLY CHANGES */
flush privileges;

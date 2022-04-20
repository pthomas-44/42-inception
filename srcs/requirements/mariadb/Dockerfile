
FROM	debian:buster

ARG		MYSQL_ROOT_PASSWORD
ARG		MYSQL_DATABASE
ARG		MYSQL_USER
ARG		MYSQL_PASSWORD

# SYSTEM UPDATE AND DEPENDENCIES
RUN		echo $MYSQL_ROOT_PASSWORD > test.txt
RUN		apt-get update -y && apt upgrade -y

# MARIADB
RUN		apt-get install -y mariadb-server

# CREATE WORDRPRESS DATABASE
RUN		service mysql start \
&&		mysql -e "create database if not exists wordpress;\
alter user 'root'@'localhost' identified by 'root44';\
create user 'pthomas'@'localhost' identified by 'pthomas44';\
flush privileges;"


# START
CMD		["mysqld"]

#RUN		service mysql start \
#&&		mysql -e "create database if not exists $MYSQL_DATABASE;\
#alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';\
#create user '$MYSQL_USER'@'localhost' identified by '$MYSQL_PASSWORD';\
#flush privileges;"

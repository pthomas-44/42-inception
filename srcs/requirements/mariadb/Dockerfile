
FROM	debian:buster

# SYSTEM UPDATE AND DEPENDENCIES
RUN		apt-get update -y && apt upgrade -y

# MARIADB
RUN		apt-get install -y mariadb-server

# CREATE WORDRPRESS DATABASE
COPY	./tools/wordpress.sql /tmp
RUN		service mysql start && mysql < /tmp/wordpress.sql

#CMD		["service", "mysql", "start;"]
CMD		mysqld

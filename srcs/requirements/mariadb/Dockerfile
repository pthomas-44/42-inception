# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/20 14:43:46 by pthomas           #+#    #+#              #
#    Updated: 2022/05/20 14:43:48 by pthomas          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

# RETRIEVE DB CREDS FROM ENV
ARG		MYSQL_ROOT_PASSWORD
ARG		MYSQL_DATABASE
ARG		MYSQL_USER
ARG		MYSQL_PASSWORD

# SYSTEM UPDATE AND DEPENDENCIES
RUN		apt-get update -y && apt upgrade -y

# MARIADBñ
RUN		apt-get install -y mariadb-server mariadb-client

# CREATE WORDRPRESS DATABASE
RUN		service mysql start \
&&		mysql -e "create database if not exists $MYSQL_DATABASE;\
alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';\
grant all privileges on $MYSQL_DATABASE.* to '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';\
flush privileges;"

# PORTS
EXPOSE	3306

# START
ENTRYPOINT	["mysqld", "--bind-address=0.0.0.0"]

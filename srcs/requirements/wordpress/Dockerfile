# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/15 11:51:05 by pthomas           #+#    #+#              #
#    Updated: 2022/04/15 11:51:07 by pthomas          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

# SYSTEM UPDATE AND DEPENDENCIES
RUN		apt-get update -y && apt-get upgrade -y && apt-get install -y tar

# PHPMYADMIN
RUN		apt-get install -y php-fpm php-mysql

# WORDPRESS
ADD		"https://wordpress.org/latest.tar.gz" /tmp/wordpress.tar.gz
RUN		mkdir -p /var/www /var/www/html
RUN		tar -xvf /tmp/wordpress.tar.gz -C /var/www/html \
&&		rm -f /tmp/wordpress.tar.gz

# CONFIG
#COPY	./srcs/wp-config.php ./var/www/html/wordpress

#RUN		chown -R www-data:www-data /var/www/html/wordpress \

# START
#CMD		["service", "php-fpm", "start;"]

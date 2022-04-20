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

ARG		MYSQL_DATABASE
ARG		MYSQL_USER
ARG		MYSQL_PASSWORD

# SYSTEM UPDATE AND DEPENDENCIES
RUN		apt-get update -y && apt-get upgrade -y && apt-get install -y tar

# PHPMYADMIN
RUN		apt-get install -y php-fpm php-mysql \
&&		mkdir -p /run/php

# WORDPRESS
ADD		"https://wordpress.org/latest.tar.gz" /tmp/wordpress.tar.gz
RUN		mkdir -p /var/www /var/www/html
RUN		tar -xvf /tmp/wordpress.tar.gz -C /var/www/html \
&&		rm -f /tmp/wordpress.tar.gz

# CONFIG
RUN		cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php \
&&		sed -i "s/database_name_here/$MYSQL_DATABASE/" /var/www/html/wordpress/wp-config.php \
&&		sed -i "s/username_here/$MYSQL_USER/" /var/www/html/wordpress/wp-config.php \
&&		sed -i "s/password_here/$MYSQL_PASSWORD/" /var/www/html/wordpress/wp-config.php && touch AUSECOURSMONDIEU

#RUN		chown -R www-data:www-data /var/www/html/wordpress

# START
CMD		["php-fpm7.3", "-F"]

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

# PHP
RUN		apt-get install -y php-fpm php-mysql \
&&	 	service php7.3-fpm start && service php7.3-fpm stop \
&&		sed -i "s/\/run\/php\/php7.3-fpm.sock/wordpress:9000/" /etc/php/7.3/fpm/pool.d/www.conf

# WORDPRESS
ADD		"https://wordpress.org/latest.tar.gz" /tmp/wordpress.tar.gz
RUN		mkdir -p /var/www /var/www/html
RUN		tar -xvf /tmp/wordpress.tar.gz -C /var/www/html \
&&		rm -f /tmp/wordpress.tar.gz

# CONFIG
RUN		cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php \
&&		sed -i "s/database_name_here/$MYSQL_DATABASE/" /var/www/html/wordpress/wp-config.php \
&&		sed -i "s/username_here/$MYSQL_USER/" /var/www/html/wordpress/wp-config.php \
&&		sed -i "s/password_here/$MYSQL_PASSWORD/" /var/www/html/wordpress/wp-config.php \
&&		sed -i "s/localhost/mariadb:3306/" /var/www/html/wordpress/wp-config.php

# PORTS
EXPOSE	9000

# START
CMD		["php-fpm7.3", "-F"]

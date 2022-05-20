# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/15 11:51:05 by pthomas           #+#    #+#              #
#    Updated: 2022/05/20 16:31:37 by pthomas          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

ARG		MYSQL_DATABASE
ARG		MYSQL_USER
ARG		MYSQL_PASSWORD

# SYSTEM UPDATE AND DEPENDENCIES
RUN		apt-get update -y && apt-get upgrade -y && apt-get install -y tar wget
# maybe replace by zip or remove if wp core download work

# PHP
RUN		apt-get install -y php-fpm php-mysql php-redis \
&&	 	service php7.3-fpm start && service php7.3-fpm stop \
&&		sed -i "s/\/run\/php\/php7.3-fpm.sock/wordpress:9000/" /etc/php/7.3/fpm/pool.d/www.conf

# WORDPRESS
RUN		wp core download --allow-root
# ADD		"https://wordpress.org/latest.tar.gz" /tmp/wordpress.tar.gz
# RUN		mkdir -p /var/www /var/www/html
# RUN		tar -xvf /tmp/wordpress.tar.gz -C /var/www/html \
# &&		rm -f /tmp/wordpress.tar.gz

# CONFIG
RUN		cd /var/www/html/wordpress \
&&		wp config create	--allow-root \
							--dbname=$MYSQL_DATABASE \
							--dbuser=$MYSQL_USER \
							--dbpass=$MYSQL_PASSWORD \
							--dbhost=$MYSQL_HOST
# RUN		cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php \
# &&		sed -i "s/database_name_here/$MYSQL_DATABASE/" /var/www/html/wordpress/wp-config.php \
# &&		sed -i "s/username_here/$MYSQL_USER/" /var/www/html/wordpress/wp-config.php \
# &&		sed -i "s/password_here/$MYSQL_PASSWORD/" /var/www/html/wordpress/wp-config.php \
# &&		sed -i "s/localhost/mariadb:3306/" /var/www/html/wordpress/wp-config.php

# PORTS
EXPOSE	9000

# START
COPY	./tools/entrypoint.sh /tmp
ENTRYPOINT	["sh", "/tmp/entrypoint.sh"]

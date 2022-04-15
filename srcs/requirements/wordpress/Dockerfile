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
RUN		apt-get update -y && apt-get upgrade -y && apt-get -y install tar

# PHPMYADMIN
RUN		apt-get install -y php-fpm php-mysql

# WORDPRESS
ADD		"https://wordpress.org/latest.tar.gz" /tmp/wordpress.tar.gz
RUN		mkdir -p /var/www /var/www/html
RUN		tar -xvf /tmp/wordpress.tar.gz -C /var/www/html \
&&		rm -f /tmp/wordpress.tar.gz

# CONFIG

#RUN		rm -f /var/www/html/phpmyadmin/config.sample.inc.php 
#COPY	./srcs/config.inc.php ./var/www/html/phpmyadmin/config.inc.php
#COPY	./srcs/wp-config.php ./var/www/html/wordpress


#RUN		chmod 444 /var/www/html/phpmyadmin/config.inc.php \
#		&& chown -R www-data:www-data /var/www/html/wordpress \
#		&& chown -R www-data:www-data /var/www/html/phpmyadmin


#CMD		["service", "php-fpm", "start;"]

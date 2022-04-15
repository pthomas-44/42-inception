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
RUN		apt-get update -y && apt-get upgrade -y && apt-get install tar

# PHPMYADMIN
RUN		apt-get install -y php8.0
#php8.0-fpm php8.0-common php8.0-mysql php8.0-gmp php8.0-curl php8.0-intl php8.0-mbstring php8.0-xmlrpc php8.0-gd php8.0-xml php8.0-cli php8.0-zip
#RUN		apt-get install -y php7.3 php7.3-fpm php7.3-mysql  php7.3-curl php7.3-gd php7.3-intl php7.3-xml php7.3-zip php7.3-imagick php7.3-apcu php7.3-mbstring php7.3-cli
ADD		"https://files.phpmyadmin.net/phpMyAdmin/5.1.3/phpMyAdmin-5.1.3-all-languages.tar.gz" /tmp/phpmyadmin.tar.gz
RUN		tar -xvf /tmp/phpmyadmin.tar.gz \
    	&& mv /tmp/phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin \
    	&& rm -f /tmp/phpmyadmin.tar.gz
 
# WORDPRESS
ADD		"https://wordpress.org/latest.tar.gz" /tmp/wordpress.tar.gz
RUN		tar -xvf /tmp/wordpress.tar.gz \
		&& mv wordpress ./var/www/html/ \
		&& rm -f /tmp/wordpress.tar.gz

# CONFIG

#RUN		rm -f /var/www/html/phpmyadmin/config.sample.inc.php 
#COPY	./srcs/config.inc.php ./var/www/html/phpmyadmin/config.inc.php
#COPY	./srcs/wp-config.php ./var/www/html/wordpress


#RUN		chmod 444 /var/www/html/phpmyadmin/config.inc.php \
#		&& chown -R www-data:www-data /var/www/html/wordpress \
#		&& chown -R www-data:www-data /var/www/html/phpmyadmin


#CMD		service php7.3-fpm start

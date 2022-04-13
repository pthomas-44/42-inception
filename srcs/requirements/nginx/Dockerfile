# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/12 16:55:30 by pthomas           #+#    #+#              #
#    Updated: 2022/04/12 16:56:23 by pthomas          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

WORKDIR /.

# Update and install process
RUN		apt-get update -y && apt upgrade -y \
		&& apt-get install -y wget mariadb-server

# Install nginx
RUN		apt-get install -y nginx openssl \
		&& rm -rf /etc/nginx/sites-enabled/default
COPY 	./srcs/index.html ./var/www/html/
COPY	./srcs/nginx.conf ./etc/nginx/sites-enabled/
ENV		AUTOINDEX="on"

# Generate certificate
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=Auvergne-Rhône-Alpes/L=Lyon/emailAddress=pthomas@student.42lyon.fr" -keyout ./etc/ssl/certs/localhost.key -out ./etc/ssl/certs/localhost.crt

# Install phpmyadmin
RUN		apt-get install -y php7.3 php7.3-fpm php7.3-mysql  php7.3-curl php7.3-gd php7.3-intl php7.3-xml php7.3-zip php7.3-imagick php7.3-apcu php7.3-mbstring php7.3-cli \
		&& wget "https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz" -O phpmyadmin.tar.gz \
		&& mkdir ./var/www/html/phpmyadmin \
		&& tar -xzvf phpmyadmin.tar.gz \
    	&& mv phpMyAdmin-5.0.4-all-languages/* ./var/www/html/phpmyadmin \
    	&& rm -rf phpmyadmin.tar.gz phpMyAdmin-5.0.4-all-languages ./var/www/html/phpmyadmin/config.sample.inc.php 
COPY	./srcs/config.inc.php ./var/www/html/phpmyadmin/config.inc.php

# Install Wordpress
RUN		wget "https://wordpress.org/latest.tar.gz" -O wordpress.tar.gz \
		&& tar -xzvf wordpress.tar.gz \
		&& mv wordpress ./var/www/html/ \
		&& rm -rf wordpress.tar.gz
COPY	./srcs/wp-config.php ./var/www/html/wordpress

COPY	./srcs/start.sh .
COPY	./srcs/wordpress.sql .
COPY	./srcs/autoindex.sh .
RUN		chmod 444 /var/www/html/phpmyadmin/config.inc.php \
		&& chown -R www-data:www-data /var/www/html/wordpress \
		&& chown -R www-data:www-data /var/www/html/phpmyadmin

EXPOSE	80 443

CMD		./autoindex.sh && ./start.sh


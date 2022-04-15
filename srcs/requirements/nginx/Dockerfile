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

#WORKDIR /.

# Update and install process
RUN		apt-get update -y && apt-get upgrade -y

# Install nginx and openssl
RUN		apt-get install -y nginx openssl	

# Add my website config and html page
COPY	./tools/eugene.html /var/www/html/.
COPY	./conf/nginx.conf /etc/nginx/sites-available/pthomas.42.fr.conf
RUN		ln -s /etc/nginx/sites-available/pthomas.42.fr.conf /etc/nginx/sites-enabled/pthomas.42.fr.conf

# Generate certificate
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=Auvergne-Rhône-Alpes/L=Lyon/emailAddress=pthomas@student.42lyon.fr" -keyout ./etc/ssl/certs/localhost.key -out ./etc/ssl/certs/localhost.crt

# Open port
EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]

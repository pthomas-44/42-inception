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

# Replace the default config
RUN		rm -rf /etc/nginx/sites-available/default
COPY	./conf/nginx.conf ./etc/nginx/sites-available/

# Generate certificate
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=Auvergne-Rhône-Alpes/L=Lyon/emailAddress=pthomas@student.42lyon.fr" -keyout ./etc/ssl/certs/localhost.key -out ./etc/ssl/certs/localhost.crt

EXPOSE	443

#CMD		service nginx start

CMD ["nginx", "-g", "daemon off;"]

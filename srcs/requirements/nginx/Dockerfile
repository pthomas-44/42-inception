# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/12 16:55:30 by pthomas           #+#    #+#              #
#    Updated: 2022/05/20 14:26:42 by pthomas          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

# SYSTEM UPDATE AND DEPENDENCIES
RUN		apt-get update -y && apt-get upgrade -y

# NGINX
RUN		apt-get install -y nginx

# CONFIG
COPY	./conf/nginx.conf /etc/nginx/sites-available/pthomas.42.fr.conf
RUN		ln -s /etc/nginx/sites-available/pthomas.42.fr.conf /etc/nginx/sites-enabled/pthomas.42.fr.conf

# PORTS
EXPOSE	443

# START
ENTRYPOINT	["nginx", "-g", "daemon off;"]
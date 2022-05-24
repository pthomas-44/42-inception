# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/15 11:51:05 by pthomas           #+#    #+#              #
#    Updated: 2022/05/24 19:50:13 by pthomas          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

# SYSTEM UPDATE AND DEPENDENCIES
RUN		apt-get update -y && apt-get upgrade -y

# PORTSENTRY
RUN		apt-get install -y portsentry

# CONFIG
RUN		echo 10.1.0.0/32 >> /etc/portsentry/portsentry.ignore.static \
&&		echo 46.231.218.157 >> /etc/portsentry/portsentry.ignore.static

# START
ENTRYPOINT	["tail", "-f"]


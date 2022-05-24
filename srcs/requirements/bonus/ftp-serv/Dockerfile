# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/15 11:51:05 by pthomas           #+#    #+#              #
#    Updated: 2022/05/20 16:30:28 by pthomas          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

ARG		WP_ADMIN
ARG		WP_ADMIN_PASSWORD

# SYSTEM UPDATE AND DEPENDENCIES
RUN		apt-get update -y && apt-get upgrade -y

# VSFTPD
RUN		apt-get install -y vsftpd ftp

# CONFIG
RUN		mkdir -p /var/run/vsftpd/empty
COPY	./conf/vsftpd.conf /etc
RUN		useradd -d /var/www/html $WP_ADMIN \
&&		echo "$WP_ADMIN":"$WP_ADMIN_PASSWORD" | chpasswd \
&&		usermod -aG root "$WP_ADMIN" \
&&		usermod --shell /bin/bash "$WP_ADMIN" \
&&		echo "$WP_ADMIN" | tee -a /etc/vsftpd.chroot_list

# PORTS
EXPOSE	20
EXPOSE	21

# START
COPY	./tools/entrypoint.sh /tmp
ENTRYPOINT	["sh", "/tmp/entrypoint.sh"]

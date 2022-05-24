#!/bin/bash

# GIVE RIGHTS ON VOLUME
chown -R pthomas: /var/www/html

# LAUNCH PHP-FPM
/usr/sbin/vsftpd
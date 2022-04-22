
#!/bin/bash

# WORDPRESS CONFIG
cd /var/www/html/wordpress
wp core install	--allow-root \
				--url=pthomas.42.fr \
				--title="Eugène le boss" \
				--admin_name=pthomas \
				--admin_password=pthomas44 \
				--admin_email=pthomas@student.42lyon.fr 1>> test.txt 2>> test.txt

php-fpm7.3 -F

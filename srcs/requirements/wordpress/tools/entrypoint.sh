
#!/bin/sh

# WORDPRESS SITE SETUP
cd /var/www/html/wordpress
if !wp core is-installed --allow-root
then
	wp core install	--allow-root \
					--url=$DOMAIN_NAME \
					--title=$WP_SITE_TITLE \q
					--admin_user=$WP_ADMIN \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL
	
	touch my-wp-config.php
	wget -c https://api.wordpress.org/secret-key/1.1/salt/ -O ./salt.txt
	start=`expr \`< wp-config.php grep -n "define( 'AUTH_KEY',         'put your unique phrase here' );" | cut -d : -f 1\` - 1`
	end=`expr \`< wp-config.php wc -l\` - \`< wp-config.php grep -n "define( 'NONCE_SALT',       'put your unique phrase here' );" | cut -d : -f 1\` + 1`
	head -$start wp-config.php > my-wp-config.php
	cat salt.txt >> my-wp-config.php
	tail -$end wp-config.php >> my-wp-config.php

	rm wp-config.php
	mv my-wp-config.php wp-config.php
	rm salt.txt
	unset start end
fi

# LAUNCH PHP-FPM
php-fpm7.3 -F

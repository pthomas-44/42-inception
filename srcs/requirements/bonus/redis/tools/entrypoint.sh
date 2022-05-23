
#!/bin/bash

cd /var/www/html/wordpress
wp config --allow-root set WP_CACHE_KEY_SALT "$DOMAIN_NAME"
wp config --allow-root set WP_CACHE "true"
# wp config --allow-root set WP_REDIS_PATH "__DIR__ . '/../redis.sock'"
# wp config --allow-root set WP_REDIS_SCHEME "unix"
wp plugin --allow-root install redis-cache --activate

# LAUNCH REDIS
redis-server
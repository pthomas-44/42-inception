
#!/bin/bash

# REDIS CONFIG
cd /var/www/html/wordpress
wp --allow-root config set WP_CACHE_KEY_SALT "$DOMAIN_NAME"
wp --allow-root config set WP_CACHE "true"
wp --allow-root config set WP_REDIS_HOST "redis"
wp --allow-root config set WP_REDIS_PORT "6379"

redis-server /etc/redis/redis.conf
redis-cli config set maxmemory 256mb
redis-cli config set maxmemory-policy allkeys-lfu
redis-cli config set protected-mode no
redis-cli config rewrite
redis-cli shutdown
sed -i "s/bind 127.0.0.1 ::1/bind * ::1/" /etc/redis/redis.conf

wp --allow-root plugin install redis-cache --activate 2> /error.log
wp --allow-root redis update-dropin 2>> /error.log

# LAUNCH REDIS
redis-server /etc/redis/redis.conf --daemonize no

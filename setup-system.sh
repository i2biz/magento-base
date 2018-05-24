#!/bin/sh

set -e

apt-get update -q
apt-get upgrade -qy
apt-get install -qy unzip libgd-dev libicu-dev libmcrypt-dev libmhash-dev libssl-dev libxml2-dev libxslt-dev \
        libjpeg-dev libpng-dev libfreetype6-dev netcat-traditional nano vim

docker-php-ext-configure gd --with-jpeg-dir=/usr/lib --with-freetype-dir=/usr/lib

docker-php-ext-install gd intl mcrypt openssl pdo_mysql soap xml xsl zip json iconv opcache bcmath

pecl install redis-3.1.5
docker-php-ext-enable redis
echo "n" | pecl install lzf-1.6.6
docker-php-ext-enable lzf

rm -rf /var/lib/apt/lists/
apt-get clean

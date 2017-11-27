#!/bin/sh

set -e

apt-get update -q
apt-get upgrade -qy
apt-get install -qy unzip libgd-dev libicu-dev libmcrypt-dev libmhash-dev libssl-dev libxml2-dev libxslt-dev \
        libjpeg-dev libpng-dev libfreetype6-dev

docker-php-ext-configure gd --with-jpeg-dir=/usr/lib --with-freetype-dir=/usr/lib

docker-php-ext-install gd intl mcrypt openssl pdo_mysql soap xml xsl zip json iconv opcache

rm -rf /var/lib/apt/lists/
apt-get clean

FROM php:7.1.11-fpm-jessie

COPY docker-php-ext-install /usr/local/bin/
COPY setup-system.sh /opt/setup-system.sh
RUN /opt/setup-system.sh

COPY installer /opt/composer-setup.php
RUN php /opt/composer-setup.php --install-dir=/usr/local/bin --filename=composer

COPY php_ini/* /usr/local/etc/php/conf.d/

RUN mkdir /magento && chown magento:magento /magento



FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
        curl \
        wget \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libonig-dev \
        libpng-dev \
        libwebp-dev \
        libicu-dev \
        libpq-dev \
        libxpm-dev \
        libvpx-dev \
        libzip-dev \
        zip \
        unzip \
    && pecl install xdebug \
    && pecl install mcrypt-1.0.3 \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-enable mcrypt 

RUN set -eux; \
	docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-xpm --with-webp; \
	docker-php-ext-install -j "$(nproc)" \
		iconv \
		mbstring \
		gd \
		intl \
		zip \
		pgsql \
		mysqli \
		pdo_pgsql \
		pdo_mysql \
		exif 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Downgrade composer to v.1
RUN composer self-update 1.10.17

# Include custom php.ini to manage PHP configuration
ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

# PHP working directory
WORKDIR /var/www

# The main purpose of a CMD is to provide defaults for an executing container. These defaults can include an executable, 
# or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.
CMD ["php-fpm"]

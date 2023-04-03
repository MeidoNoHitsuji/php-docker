FROM php:7.4-fpm

# Install software packages
RUN apt update && apt install -y \
        curl \
        wget \
        git \
        unzip \
        zip \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmagickwand-dev \
        libmcrypt-dev \
        libonig-dev \
        libpng-dev \
        libwebp-dev \
        libicu-dev \
        libpq-dev \
        libxpm-dev \
        libwebp-dev \
        libvpx-dev \
        libzip-dev \
        libyaml-dev \
        fish \
    && pecl install yaml \
    && pecl install xdebug-3.0.1 \
    && pecl install mcrypt-1.0.3 \
    && pecl install imagick \
    && docker-php-ext-enable yaml\
    && docker-php-ext-enable xdebug \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-enable imagick

# Configure and install PHP extentions
RUN set -eux; \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-xpm --with-webp; \
    docker-php-ext-configure intl; \
    docker-php-ext-configure zip; \
    docker-php-ext-install -j "$(nproc)" iconv \
        mbstring \
        gd \
        intl \
        sockets \
        zip \
        pgsql \
        mysqli \
        pdo_pgsql \
        pdo_mysql \
        exif  

# Set FISH as default shell
RUN chsh -s /usr/bin/fish

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Downgrade composer to v.1 (for solve some trouble with old project dependencies)
#RUN composer self-update 1.10.17

# Include custom php.ini to manage PHP configuration
ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

# Creating user with a UID identical to the host user. This is needed to use the local IDE.
RUN groupadd --gid 1000 user \
    && useradd --uid 1000 --gid 1000 --shell /usr/bin/fish user \
    && mkdir /home/user \
    && chmod 777 /home/user

USER user

# PHP working directory
WORKDIR /var/www

# The main purpose of a CMD is to provide defaults for an executing container. These defaults can include an executable, 
# or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.
CMD ["php-fpm"]

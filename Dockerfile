FROM php:8.3.12-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    libpq-dev

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . /var/www/html

RUN cp .env.example .env

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 775 /var/www/html

USER www-data

RUN composer install --no-dev --optimize-autoloader

RUN php artisan key:generate

EXPOSE 9000

CMD ["php-fpm"]
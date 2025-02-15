FROM php:8.1-cli

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Instalar Composer
COPY composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# Copiar archivos del proyecto
WORKDIR /app
COPY . /app

# Instalar dependencias de Composer si existe composer.json
RUN if [ -f "/app/composer.json" ]; then composer install; fi

# Comando por defecto para iniciar el bot
CMD ["php", "index.php"]

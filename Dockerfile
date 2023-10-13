# 使用官方的 Alpine Linux 鏡像作為基本映像
FROM alpine:latest

# 設定環境變數以避免互動提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新套件管理系統
RUN apk update

# 安裝需要的套件，包括 PHP 8.1、Node.js、npm、yarn
RUN apk add --no-cache \
    sudo \
    nginx \
    php81 \
    php81-fpm \
    php81-cli \
    php81-common \
    php81-curl \
    php81-mbstring \
    php81-mysqlnd \
    php81-xml \
    php81-zip \
    php81-gd \
    php81-redis \
    php81-dev \
    php81-xdebug \
    php81-dom \
    php81-tokenizer \
    php81-xmlwriter \
    php81-fileinfo \
    composer \
    mysql-client \
    redis \
    nodejs \
    npm \
    yarn

# 複製 Nginx 設定檔
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# 設定工作目錄
WORKDIR /var/www/html

# 創建 xdebug 目錄
RUN mkdir -p /etc/php81/conf.d/

# 設定 Xdebug
RUN echo "xdebug.mode=coverage" >> /etc/php81/conf.d/xdebug.ini
RUN echo "xdebug.start_with_request=yes" >> /etc/php81/conf.d/xdebug.ini

# 設定 PHP-FPM
RUN sed -i 's/^listen =.*/listen = 9000/' /etc/php81/php-fpm.d/www.conf

# 創建目錄以保存 PHP-FPM PID 文件
RUN mkdir -p /run/php/

# 啟動 PHP-FPM
CMD ["/usr/sbin/php-fpm81", "--nodaemonize"]

# 暴露 PHP-FPM 監聽埠
EXPOSE 9000

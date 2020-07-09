FROM ubuntu:trusty

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install \
		 unzip \
		 supervisor \ 
		 git \
		 curl \
 		 apache2 \
		 apache2-dev \
	 	 mysql-server \
		 pwgen && \ 
  echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN apt-get install -y libxml2-dev \
    libcurl4-openssl-dev \
    libjpeg-dev \
    libpng-dev \
    libxpm-dev \
    libmysqlclient-dev \
    libpq-dev \
    libicu-dev \
    libfreetype6-dev \
    libldap2-dev \
    libxslt-dev \
    libgd-dev \
    re2c \
    libjpeg-dev \
    build-essential \
    libstdc++6 \ 
    libstdc++6-4.4-dev 

COPY xp_ssl.c /tmp/xp_ssl.c
COPY /php-5.3.5.tar.gz /php-5.3.5.tar.gz
RUN tar -zxf php-5.3.5.tar.gz && chmod +x php-5.3.5/configure && cd php-5.3.5 && \
  # Fix node.c error : 
  curl -s https://mail.gnome.org/archives/xml/2012-August/txtbgxGXAvz4N.txt | patch -p0 && \
  # Fix freetype bug :
  mkdir /usr/include/freetype2/freetype && \
  ln -s /usr/include/freetype2/freetype.h /usr/include/freetype2/freetype/freetype.h && \
  # Launching configure and make
  ./configure \
  --prefix=/usr/local/php \
  --with-libdir=/lib/x86_64-linux-gnu \
  --with-apxs2=/usr/bin/apxs \
  --enable-mbstring \
  --with-curl \
  --with-openssl \
  --with-xmlrpc \
  --enable-soap \
  --enable-zip \
  --with-gd \
  --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ \
  --with-png-dir \
  --with-mysql \
  --enable-embedded-mysqli \
  --with-freetype-dir=/usr/include/freetype2 \
  --with-xpm-dir \
  --enable-intl \
  --with-xsl && \ 
  # Fix 64 bit error : 
  sed -i '/^BUILD_/ s/\$(CC)/\$(CXX)/g' Makefile && \
  sed -i '/EXTRA_LIBS = /s|$| -lstdc++|' Makefile && \ 
  # Fix OpenSSL Error (patched xp_ssl.c file) :
  cp /tmp/xp_ssl.c ./ext/openssl/xp_ssl.c && \ 
  make && make install

RUN cp php-5.3.5/php.ini-development /usr/local/lib/php.ini && ln -s /usr/local/lib/php.ini /etc

# Add image configuration and scripts
ADD start-apache2.sh /start-apache2.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Add MySQL utils
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
RUN chmod 775 /*.sh

# config to enable .htaccess
ADD apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

# add osCommerce
COPY /oscommerce.zip /oscommerce.zip
RUN unzip /oscommerce.zip -d /var/www/oscommerce
COPY /configure_template.php /configure_template.php
COPY /configure_adm_template.php /configure_adm_template.php
COPY /oscommercedb.sql /oscommercedb.sql
RUN chmod -R 755 /var/www/oscommerce && chmod 755 /*.sh && rm -fr /var/www/html && mv /var/www/oscommerce /var/www/html

#Enviornment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M

# Add volumes for MySQL 
VOLUME  ["/etc/mysql", "/var/lib/mysql" ]

EXPOSE 80 3306
CMD ["/run.sh"]

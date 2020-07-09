#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

if [ $APPHTTP == "https" ]; then
     export bool_ssl=true
else
     export bool_ssl=false
fi

sed -ri -e "s/^upload_max_filesize.*/upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}/" \
    -e "s/^post_max_size.*/post_max_size = ${PHP_POST_MAX_SIZE}/" /etc/php5/apache2/php.ini
if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"  
    /create_mysql_admin_user.sh
else
    echo "=> Using an existing volume of MySQL"
fi


echo "Dynamic configuration of TomatoCart"
perl -pe 's;(\\*)(\$([a-zA-Z_][a-zA-Z_0-9]*)|\$\{([a-zA-Z_][a-zA-Z_0-9]*)\})?;substr($1,0,int(length($1)/2)).($2&&length($1)%2?$2:$ENV{$3||$4});eg' configure_template.php > /var/www/tomato/includes/configure.php
chmod 755 /var/www/tomato/includes/configure.php
echo "Config file :"
cat  /var/www/tomato/includes/configure.php
# Set the right directory name :
rm -fr /var/www/html
mv /var/www/tomato/ /var/www/html/


echo "Launching server..."
exec supervisord -n

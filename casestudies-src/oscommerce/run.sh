#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

if [ $APPHTTP == "https" ]; then
     export ssl_bool=true
else
     export ssl_bool=false
fi


if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"  
    /create_mysql_admin_user.sh
    #/mysql_import_db.sh
    chmod -R 777 /var/www/html/
    echo "Dynamic configuration of osCommerce"
    perl -pe 's;(\\*)(\$([a-zA-Z_][a-zA-Z_0-9]*)|\$\{([a-zA-Z_][a-zA-Z_0-9]*)\})?;substr($1,0,int(length($1)/2)).($2&&length($1)%2?$2:$ENV{$3||$4});eg' configure_template.php > /var/www/html/includes/configure.php
    perl -pe 's;(\\*)(\$([a-zA-Z_][a-zA-Z_0-9]*)|\$\{([a-zA-Z_][a-zA-Z_0-9]*)\})?;substr($1,0,int(length($1)/2)).($2&&length($1)%2?$2:$ENV{$3||$4});eg' configure_adm_template.php >  /var/www/html/admin/includes/configure.php
    echo "AddType application/x-httpd-php .php" >> /etc/apache2/apache2.conf
else
    echo "=> Using an existing volume of MySQL"
fi

echo "Enabling curl backchannels..."
sed -i 's/if ( (PHP_VERSION >= 4.3)/\0 \&\& false/g'  /var/www/html/ext/modules/payment/paypal/standard_ipn.php

echo "Launching server..."
source /etc/apache2/envvars
mkdir -p ${APACHE_RUN_DIR}
mkdir -p ${APACHE_LOCK_DIR}
chown ${APACHE_RUN_USER:-www-data} ${APACHE_LOCK_DIR}
exec supervisord -n

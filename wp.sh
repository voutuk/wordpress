#!/bin/bash

apt update && apt upgrade
apt install -y apache2 mariadb-server mariadb-client php php-mysql
cd /var/www/html
echo "<?php" >> info.php
echo "phpinfo();" >> info.php
echo "?>" >> info.php
mysql -u root -p -e "CREATE DATABASE wordpress_db; CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'password'; GRANT ALL ON wordpress_db.* TO 'wp_user'@'localhost' IDENTIFIED BY 'password'; FLUSH PRIVILEGES; Exit;"
cd ~ && mkdir tmp
cd /tmp && wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
cp -R wordpress /var/www/html/
chown -R www-data:www-data /var/www/html/wordpress/
chmod -R 755 /var/www/html/wordpress/
mkdir /var/www/html/wordpress/wp-content/uploads
chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/
echo " --- BD ---"
echo " Name wordpress_db"
echo " User wp_user"
echo " Password password"
echo " Open ip_address/wordpress"
##################################################################
#LAMP for Raspberry Pi - Raspbian 10 Lite                        #
#This script will install Apache, PHP,PhpMyAdmin, and MySQL.     #
##################################################################

#!/bin/bash

#Prerequisites
sudo apt update && sudo apt upgrade -y 

#Apache
sudo apt install apache2 -y


#PHP
sudo apt install php openssl php-common php-curl php-json php-mbstring php-mysql php-xml php-zip -y


#MySQL 
sudo apt install mariadb-server php-mysql -y
sudo mysql_secure_installation

#PhpMyAdmin
sudo apt install phpmyadmin -y
sudo phpenmod mysqli
sudo service apache2 restart

#Web Permissions
sudo chown -R pi:www-data /var/www/html/
sudo chmod -R 770 /var/www/html/

#Create phpmyadmin user with all options
#read -p "Username: " username
#while true; do
#    read -p "Password: " password
#    echo
#    read -p "Password (again): " password2
#    echo
#    [ "$password" = "$password2" ] && break
#    echo "Please try again"
#done
#sudo mysql -u root -p -e "CREATE USER '$username'@'%' IDENTIFIED BY '$password';"
#sudo mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO '$username'@'%' WITH GRANT OPTION;"

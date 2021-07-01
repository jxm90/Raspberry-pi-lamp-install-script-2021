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

#Create non-root sql user forphpmyadmin with all permissions
echo "We will create a non-root sql user that has full access permissions, this will be used to log into phpmyadmin"
read -p "Username: " user
while true; do
    read -p "Password: " password
    echo
    read -p "Verify Password: " password2
    echo
    [ "$password" = "$password2" ] && break
    echo "Please try again"
done
cp phpadmin-user.sql edit.sql
sed -i "s/username/$user/g" edit.sql
sed -i "s/password/$password/g" edit.sql
echo "Please enter the root mariadb password you chose during setup"
sudo mysql -u root -p < edit.sql
rm edit.sql
echo "You can now log in to phpmyadmin at http://raspberrypi-IP/phpmyadmin"



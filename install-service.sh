#!/bin/bash
echo "=============================================
--------------- Create User -----------------
============================================="
adduser icube
usermod -aG wheel icube

yum install epel-release yum-utils wget -y

echo "=============================================
--------------- Install Nginx ---------------
============================================="
yum install nginx -y
systemctl enable nginx

echo "=============================================
--------------- Install PHP7.1 --------------
============================================="
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
yum-config-manager --enable remi-php71
yum install php-fpm php-mcrypt php-curl php-cli php-mysql php-gd php-xsl php-json php-intl php-pear php-devel php-mbstring php-zip php-soap -y
mkdir ../tmp
cd ../tmp
wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
tar -zxvf ioncube_loaders_lin_x86*
cp ioncube/ioncube_loader_lin_7.1.so /usr/lib64/php/modules/ioncube_loader_lin_7.1.so
cd ../Kawan-lama
systemctl enable php-fpm
chown icube:icube -R /var/lib/php
chmod 775 -R /var/lib/php/session/
chown icube:icube -R /var/lib/nginx


echo "=============================================
--------------- Install Varnish -------------
============================================="
yum install varnish -y
systemctl enable varnish

echo "=============================================
--------------- Install Redis ---------------
============================================="
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
yum-config-manager --enable remi
yum install redis -y
systemctl enable redis


echo "=============================================
-------------- Install Composer -------------
============================================="
yum install curl -y
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer

echo "=============================================
--------------- Install MYSQL ---------------
============================================="
yum install https://repo.percona.com/yum/percona-release-latest.noarch.rpm -y
yum install http://repo.percona.com/centos/7/RPMS/x86_64/Percona-Server-server-57-5.7.29-32.1.el7.x86_64.rpm -y

echo "=============================================
- Please manually set password for root user -
- Using mysql -u root -p 
- ALTER USER 'root'@'localhost' IDENTIFY BY 'Your_New_Password';
- FLUSH PRIVILLAGES;
Your temporary password at here:
============================================="
grep 'temporary password' /var/log/mysqld.log

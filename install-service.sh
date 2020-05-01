#!/bin/bash
echo "=============================================
--------------- Create User -----------------
============================================="
adduser icube
usermod -aG sudo icube

echo "=============================================
--------------- Install Nginx ---------------
============================================="
yum update -y
yum install epel-release -y
yum install nginx -y
systemctl enable nginx

echo "=============================================
--------------- Install PHP7.1 --------------
============================================="
yum install epel-release yum-utils wget -y
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
yum install -y https://repo.percona.com/yum/percona-release-latest.noarch.rpm
yum makecache fast
yum install -y Percona-XtraDB-Cluster-57
systemctl enable --now mysql.service

echo "=============================================
- Please manually set password for root user -
- Using mysql -u root -p 
- Temporary password at here:
============================================="
grep 'temporary password' /var/log/mysqld.log

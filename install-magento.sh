#!/bin/bash
#variable default
#update this
SERVER_NAME="http://local.magento2.test"
DB_HOST="127.0.0.1"
DB_NAME="m2_webapp"
DB_USER="icube"
DB_PASS="Icube123!"
MG_PASS="kawanlama123!"


echo "=============================================
-------------- Install Magento --------------
============================================="
cd /var/public/releases/
git clone https://github.com/AndyCungkrinx/magento2.git
cd magento2
git checkout 2.2
chmod u+x bin/magento
composer install
ln -s /var/public/releases/magento2 /var/public/current
chown icube:icube /var/public/ -R

#magento config
bin/magento setup:install \
 --cleanup-database \
 --base-url=$SERVER_NAME \
 --db-host=$DB_HOST \
 --db-name=$DB_NAME \
 --db-user=$DB_USER\
 --db-password=$DB_PASS \
 --backend-frontname=klbackoffice \
 --admin-firstname=Kawanlama\
 --admin-lastname=Administrator \
 --admin-email=andy@icube.us \
 --admin-user=admin \
 --admin-password=$MG_PASS \
 --language=id_ID \
 --currency=IDR \
 --timezone=Asia/Bangkok \
 --use-rewrites=1

chown icube:icube /var/public/ -R
exit

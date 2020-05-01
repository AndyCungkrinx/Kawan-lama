#!/bin/bash
echo "=============================================
--------------- Config Nginx ----------------
============================================="
mkdir /etc/nginx/{sites-available,sites-enabled}
rm -rf /etc/nginx/conf.d/*
cp -r devsite/conf.d/* /etc/nginx/conf.d/.
rm -rf /etc/nginx/nginx.conf
cp devsite/nginx.conf /etc/nginx/nginx.conf
cp devsite/varnish.conf /etc/nginx/sites-available/varnish.conf
ln -s /etc/nginx/sites-available/varnish.conf /etc/nginx/sites-enabled/
systemctl restart nginx

echo "=============================================
-------------- Config Varnish ---------------
============================================="
rm -rf /etc/varnish/varnish.params
rm -rf /etc/varnish/default.vcl
cp devsite/varnish.params /etc/varnish/
cp devsite/default.vcl /etc/varnish/
systemctl restart varnish

echo "=============================================
-------------- Config Redis -----------------
============================================="
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag
sysctl vm.overcommit_memory=1
sysctl -w net.core.somaxconn=65535
systemctl restart redis
yum install rc-local -y
echo "" > /etc/rc.d/rc.local
cat >/etc/rc.d/rc.local <<EOL
touch /var/lock/subsys/local
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag
sysctl vm.overcommit_memory=1
sysctl -w net.core.somaxconn=65535
systemctl restart redis
EOL
ln -s /etc/rc.d/rc.local /etc/rc.local
chmod +x /etc/rc.d/rc.local
systemctl enable rc-local

echo "=============================================
-------------- Config MYSQL------------------
============================================="
cp devsite/.my.cnf /home/icube/
cp devsite/.my-root.cnf ~/.my.cnf
cp devsite/.my-mysql.cnf /etc/my.cnf
mkdir /etc/percona-server.conf.d/
systemctl restart mysql

echo "=============================================
-------------- Config PHP  ------------------
============================================="
cp devsite/php.ini /etc/php.ini
rm -rf /etc/php-fpm.d/www.conf
cp devsite/php-fpm.d/icube.conf /etc/php-fpm.d/
rm -rf /etc/php-fpm.conf
cp devsite/php-fpm.conf /etc/php-fpm.conf
systemctl restart php-fpm

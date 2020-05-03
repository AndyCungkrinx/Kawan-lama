# Kawan-lama
This repo for config server KL

# How to Use
1. useradd icube
2. passwd icube (make sure remember the password and you can make this same for another server).
3. usermod -aG wheel icube

 - git clone https://github.com/AndyCungkrinx/Kawan-lama.git
 - cd Kawan-lama
 - git checkout Devsite-V1.0
 - chmod +x install-service.sh
 - chmod +x clone-config.sh
 - chmod +x install-magento.sh
 - ./install-service.sh
 - ./clone-config.sh
 
 <h4>Note</h4>
 - Edit /etc/nginx/conf.d/fastcgi-fpm.conf (comment line HTTPS for disable https if only use http)

# Configure MYSQL Client
- Edit /home/root/.my.cnf
- Edit /home/icube/.my.cnf
- Edit /etc/nginx/sites-enabled/varnish.conf

For MYSQL make sure set host 127.0.0.1 if you run DB in same server (for security reason).

# Install Magento
<h3>Creating Mysql Access </h3>
mysql -u root -p <br>
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'Icube328!';<br>
GRANT ALL PRIVILEGES ON *.* TO 'root'@'127.0.0.1' IDENTIFIED BY 'Icube328!';<br>

CREATE DATABASE m2_webapp;<br>
CREATE USER 'icube'@'localhost' IDENTIFIED BY 'Icube123!';<br>
GRANT ALL ON m2_webapp.* TO 'icube'@'localhost' IDENTIFIED BY 'Icube123!' WITH GRANT OPTION;<br>
GRANT ALL PRIVILEGES ON m2_webapp.* TO 'icube'@'%' IDENTIFIED BY 'Icube123!';<br>
GRANT ALL PRIVILEGES ON m2_webapp.* TO 'icube'@'localhost' IDENTIFIED BY 'Icube123!';<br>
GRANT ALL PRIVILEGES ON m2_webapp.* TO 'icube'@'127.0.0.1' IDENTIFIED BY 'Icube123!';<br>
FLUSH PRIVILEGES;<br>
exit<br>

# Next Step
1. Update variable on install-magento.sh
Then run:
 - ./install-magento.sh
 - Test your web from browser http://<your_url>
 - Or you can test using curl http://<your_url>/ (before run this make sure you has edited /etc/hosts and create your server_name)
  

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
 - ./install-service.sh
 - ./clone-config.sh
 
# Install Magento
mysql -u root -p
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'Icube328!';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'127.0.0.1' IDENTIFIED BY 'Icube328!';

CREATE DATABASE magento2;
CREATE USER 'icube'@'localhost' IDENTIFIED BY 'Icube123!';
GRANT ALL ON magento2.* TO 'icube'@'localhost' IDENTIFIED BY 'Icube123!' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON magento2.* TO 'icube'@'%' IDENTIFIED BY 'Icube123!';
GRANT ALL PRIVILEGES ON magento2.* TO 'icube'@'localhost' IDENTIFIED BY 'Icube123!';
GRANT ALL PRIVILEGES ON magento2.* TO 'icube'@'127.0.0.1' IDENTIFIED BY 'Icube123!';
FLUSH PRIVILEGES;
exit

# Next Step
 - ./install-magento.sh
 - 
  

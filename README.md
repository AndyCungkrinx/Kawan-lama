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
mysql -u root -p <br>
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'Icube328!';<br>
GRANT ALL PRIVILEGES ON *.* TO 'root'@'127.0.0.1' IDENTIFIED BY 'Icube328!';<br>

CREATE DATABASE magento2;<br>
CREATE USER 'icube'@'localhost' IDENTIFIED BY 'Icube123!';<br>
GRANT ALL ON magento2.* TO 'icube'@'localhost' IDENTIFIED BY 'Icube123!' WITH GRANT OPTION;<br>
GRANT ALL PRIVILEGES ON magento2.* TO 'icube'@'%' IDENTIFIED BY 'Icube123!';<br>
GRANT ALL PRIVILEGES ON magento2.* TO 'icube'@'localhost' IDENTIFIED BY 'Icube123!';<br>
GRANT ALL PRIVILEGES ON magento2.* TO 'icube'@'127.0.0.1' IDENTIFIED BY 'Icube123!';<br>
FLUSH PRIVILEGES;<br>
exit<br>

# Next Step
 - ./install-magento.sh
 - 
  

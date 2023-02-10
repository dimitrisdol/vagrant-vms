sudo -i
yum -y update
yum -y install vim git nmap gedit
yum -y install httpd php wget unzip
yum install mariadb-server -y
systemctl start mariadb
systemctl enable mariadb

mysql -u root -e 'CREATE DATABASE wordpress;'
mysql -u root -e 'CREATE USER wordpress@localhost IDENTIFIED BY "wordpress";'
mysql -u root -e 'GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;'
mysql -u root -e 'FLUSH PRIVILEGES;'

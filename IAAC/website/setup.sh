sudo -i
yum -y update
yum -y install vim git nmap gedit
yum -y install httpd php wget unzip
systemctl start httpd
systemctl enable httpd
cd /tmp/
wget https://www.tooplate.com/zip-templates/2129_crispy_kitchen.zip
unzip -o 2129_crispy_kitchen.zip
cp -r 2129_crispy_kitchen/* /var/www/html/
systemctl restart httpd

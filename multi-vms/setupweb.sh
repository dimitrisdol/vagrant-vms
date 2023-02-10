sudo -i
apt-get update
apt-get install -y vim git  
apt-get install -y apache2 php wget zip
systemctl start apache2
systemctl enable apache2
cd /tmp/
wget https://www.tooplate.com/zip-templates/2129_crispy_kitchen.zip
unzip -o 2129_crispy_kitchen.zip
cp -r 2129_crispy_kitchen/* /var/www/html/
systemctl restart apache2

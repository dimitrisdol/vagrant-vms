sudo -i
apt-get update
apt-get install -y vim git  
apt-get install -y apache2 php wget zip
systemctl start apache2
sudo apt install apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mysql-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip -y
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
sudo cp /vagrant/wordpress.conf /etc/apache2/sites-available/wordpress.conf
sudo a2ensite wordpress
sudo a2enmod rewrite
sudo a2dissite 000-default
sudo service apache2 reload
mysql -u root -e 'CREATE DATABASE wordpress;'
mysql -u root -e 'CREATE USER wordpress@localhost IDENTIFIED BY "wordpress";'
mysql -u root -e 'GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;'
mysql -u root -e 'FLUSH PRIVILEGES;'
sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/wordpress/' /srv/www/wordpress/wp-config.php
#sudo -u www-data sed -i 's/define( \x27AUTH_KEY\x27,         \x27put your unique phrase here\x27 );/define(\x27AUTH_KEY\x27,         \x27Q%MqX7iC1K@#$%^[\x27(LLXLwG$:bCn#P~`.@B5Hf3V2UtN(]fYp {`c#d8rS6gO& \x27);/' /srv/www/wordpress/wp-config.php
#sudo -u www-data sed -i 's/define( \x27SECURE_AUTH_KEY\x27,         \x27put your unique phrase here\x27 );/define(\x27SECURE_AUTH_KEY\x27,  \x27`Ko8F$vq-bTr[^z8jD^|I+Q0C( <8=R{|$=>+pNTl+imPPgWWHZOHTbQ<&NP_3>|\x27);/' /srv/www/wordpress/wp-config.php
#sudo -u www-data sed -i 's/define( \x27LOGGED_IN_KEY\x27,         \x27put your unique phrase here\x27 );/define(\x27LOGGED_IN_KEY\x27,    \x27d]Z-{7|%}yJ&u O5-Tqz[W9>b4UDzOdPiFmt5-LI5K{!|wX-+;eG4a-^n=8Smq7e\x27);/' /srv/www/wordpress/wp-config.php
#sudo -u www-data sed -i 's/define( \x27NONCE_KEY\x27,         \x27put your unique phrase here\x27 );/define(\x27NONCE_KEY\x27,        \x27}*q-pN<HW+&hML0r]FB&n:Txv~FI+1>[)%yY<[QAB&[Q%r#Azb!v C+#Zp6_Stk;\x27)/;' /srv/www/wordpress/wp-config.php
#sudo -u www-data sed -i 's/define( \x27AUTH_SALT\x27,         \x27put your unique phrase here\x27 );/define(\x27AUTH_SALT\x27,        \x27+-<M+NViMHC4}G&<X]p|:2cbr3NSTw[YaSiy2C|XcOr+vPn0puOG:I`{+u6 _zrL\x27)/;' /srv/www/wordpress/wp-config.php
#sudo -u www-data sed -i 's/define( \x27SECURE_AUTH_SALT\x27,         \x27put your unique phrase here\x27 );/define(\x27SECURE_AUTH_SALT\x27, \x27DF)rsH|e_:>*YG`J36derq&c-3(BuPN4}4$ukvdzNG-gM&IB|AnFPV&:>;KQ!K,Z\x27)/;' /srv/www/wordpress/wp-config.php
#sudo -u www-data sed -i 's/define( \x27LOGGED_IN_SALT\x27,         \x27put your unique phrase here\x27 );/define(\x27LOGGED_IN_SALT\x27,   \x27WKZ2%jE|*%PO&L~SBTfn+0m+-N5b[-$Cw5%^^+![!&sRgKRA|8R)&X+[N6J9a|}H\x27)/;' /srv/www/wordpress/wp-config.php
#sudo -u www-data sed -i 's/define( \x27NONCE_SALT\x27,         \x27put your unique phrase here\x27 );/define(\x27NONCE_SALT\x27,       \x27}$jn`{x+D<P(tyDr,]]P!)kCDP_:kxEQ|l~y$,sH+RewA+<Aju3Y=DT:;y&MXk9y\x27)/;' /srv/www/wordpress/wp-config.php


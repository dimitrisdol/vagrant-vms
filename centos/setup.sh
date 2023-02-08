sudo -i
yum -y update
yum -y install vim git nmap gedit
yum -y install httpd php wget unzip
systemctl start httpd
systemctl enable httpd

#!/bin/bash
nano /etc/selinux/config
sudo dnf install wget unzip git httpd -y
sudo systemctl enable httpd
sudo systemctl enable httpd
sudo dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
sudo dnf module enable php:remi-7.4 -y
sudo dnf install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json -y
cd /var/www/html
sudo wget getgrav.org/download/core/grav-admin/1.7.0
sudo unzip 1.7.0
sudo chown -R apache:apache /var/www/html/grav
sudo find /var/www/html/grav -type f -exec chmod 644 {} \;
sudo find /var/www/html/grav -type d -exec chmod 755 {} \;
sudo nano /etc/httpd/conf.d/grav.conf
sudo systemctl restart httpd
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
reboot

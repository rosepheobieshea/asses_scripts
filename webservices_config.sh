#!/bin/bash
dnf install httpd -y
systemctl start httpd
systemctl enable httpd
firewall-cmd --add-service=http --permanent
firewall-cmd --add-service=https --permanent
firdwall-cmd --reload
dnf install mariadb-server -y
systemctl start mariadb
systemctl enable mariadb
mysql_secure_installation
dnf install php php-mysqlnd php-gd php-xml php-mbstring -y
systemctl restart httpd
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
cp -r wordpress/* /var/www/html/
chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/
mysql -u root -p

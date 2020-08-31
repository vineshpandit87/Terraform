#!/bin/bash
sudo su
yum -y install httpd
echo "<p> WebServer-VINESH! </p>" >> /var/www/html/index.html
sudo systemctl enable httpd
sudo systemctl start httpd
EOF
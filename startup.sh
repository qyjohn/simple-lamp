#!/bin/bash
echo Starting Apache 2
systemctl restart apache2
echo Starting mysql
usermod -d /var/lib/mysql/ mysql
service mysql start
mysql < simple_lamp.sql
chown -R www-data:www-data uploads


tail -f /dev/null
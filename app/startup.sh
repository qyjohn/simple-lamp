#!/bin/bash
echo Starting Apache 2
systemctl restart apache2
chown -R www-data:www-data uploads

tail -f /dev/null
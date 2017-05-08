# Simple LAMP Web Application

If you are using Ubuntu 14.04, install the following software:

~~~~
$ sudo apt-get update
$ sudo apt-get install git mysql-server
$ sudo apt-get install apache2 php5 php5-mysql php5-curl php5-memcached
$ sudo service apache2 restart
~~~~

If you are using Ubuntu 16.04, the software installation part is a little bit different:

~~~~
$ sudo apt-get update
$ sudo apt-get install git mysql-server
$ sudo apt-get install apache2 php libapache2-mod-php php-mcrypt php-mysql php-curl php-xml php-memcached
$ sudo service apache2 restart
~~~~

Then we clone the source code from git repository. Here we assume that you are using "ubuntu:ubuntu" as the Linux username and group name. 

~~~~
$ cd /var
$ sudo chown -R ubuntu:ubuntu www
$ cd /var/www/html
$ git clone https://github.com/qyjohn/simple-lamp
~~~~

Then we create a MySQL database and a MySQL user for our demo. Here we use “web_demo” as the database name, and “username” as the MySQL user.

~~~~
$ mysql -u root -p
mysql> CREATE DATABASE simple_lamp;
mysql> CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
mysql> GRANT ALL PRIVILEGES ON simple_lamp.* TO 'username'@'localhost';
mysql> quit
~~~~

In the code you clone from Github, we have pre-populated some demo data as examples. We use the following command to import the demo data in web_demo.sql to the web_demo database:

~~~~
$ cd /var/www/html/simple-lamp
$ mysql -u username -p simple_lamp < simple_lamp.sql
~~~~

Before we can make it work, there are some minor modifications needed:

(1) Use a text editor to open config.php, then change the username and password for your MySQL installation.

(2) Change the ownership of folder “uploads” to “www-data” so that Apache can upload files to this folder.

~~~~
$cd /var/www/html/simple-lamp
$ sudo chown -R www-data:www-data uploads
~~~~

In your browser, browse to http://ip-address/simple-lamp/index.php. You should see that our application is now working. 

To enable session sharing using MemCached, edit /etc/php5/apache2/php.ini (Ubuntu 14.04) or /etc/php/7.0/apache2/php.ini (Ubuntu 16.04), with the following modifications:

~~~~
session.save_handler = memcached
session.save_path = "dns-or-ip-of-memcached-server:11211"
~~~~

Then you need to restart Apache on both web servers to make the new configuration effective.

~~~~
$ sudo service apache2 restart
~~~~

To enable front page caching using MemCached, edit config.php and update the following line:

~~~~
// Cache configuration
$enable_cache = true;
$cache_server = "dns-or-ip-of-memcached-server";
~~~~


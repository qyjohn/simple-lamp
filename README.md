# Simple LAMP Web Application
This fork of the repo is looking to containerise the application.

To get the app running you will first need to buld the images.
~~~~
docker build ./app -t lamp:0.0
docker build .database -t lampdata:0.0
~~~~
Feel free to change the tags attached to the immage.

To then get the application running you will need to start the containers and network them

~~~~
docker network create lamp
docker run -d -p80:80 --name lamp1 --network lamp lamp:0.0
docker run -d --name data -e MYSQL_ROOT_PASSWORD=password -p3306:3306 --network lamp lampmsql:0.0
~~~~

If you want to use a different name for the containers you will have to update the config.php with the new database container name under the db_hostname.
Also you should chand the root password for the database container.
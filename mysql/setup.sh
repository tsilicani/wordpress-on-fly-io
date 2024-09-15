#!/bin/bash

fly volumes create mysqldata --size 1
fly secrets set MYSQL_PASSWORD=??? MYSQL_ROOT_PASSWORD=???
fly deploy
flyctl proxy 3306 -a mysql-icy-cherry-35 # Update app name
mysql -h localhost -P 3306 -u non_root_user -p??? some_db

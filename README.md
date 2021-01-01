# flaskblog

## Running development environment
#### 1. Add credentials to the .env file
#### 2. Then run :
```sh
docker-compose up -d
docker exec -it flaskblog_mongo_1 /bin/bash
#Run mongo shell
mongo --username {mongo_username} --password {mongo_username} --authenticationDatabase admin
#Create database
use {database_name}
#Create collection and add articles
db.Articles.insertOne({title: "lorem ipsum", content: "Lorem ipsum content lorem ipsim edkzedkzepdl"});
```
## Push app to Production

#### 1. On dev environment
```sh
# Export mongo database backup
```
#### 2. On production environment
```sh
docker-compose down
docker rmi flaskblog_web
git pull origin master
docker-compose up -d
#Import mongo  backup
```

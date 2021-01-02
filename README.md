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

#Not yet implemented
#You can also add articles using the Restful JSON API
#```sh
#curl --data "title=Thisisatitle&content=testcontent" localhost/article
#```

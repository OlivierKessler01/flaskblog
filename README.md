# flaskblog
## Running development environment
#### 1. Add credentials to the .env file

#### 2. Modify the nginx.conf reverse proxy configuration file to accomodate your needs

#### 3. Then run :
```sh
docker-compose up -d
sudo chmod -R 775 Data/

docker exec -it flaskblog_mongo_1 /bin/bash
#Run mongo shell
mongo --username {mongo_username} --password {mongo_username} --authenticationDatabase admin
#Create database
use {database_name}
#Create collection and add articles
db.Articles.insertOne({title: "lorem ipsum", content: "Lorem ipsum content lorem ipsim edkzedkzepdl"});
```
## Using app
localhost => Homepage. Each article id can be found in the DOM.

localhost/delete_article_form => From to delete an article

localhost/write_article_form => Form to write an article

localhost/update_article_form/<id> => Form to update an article

## Monitoring reverse proxy access logs
The reverse-proxy access and error logs are located in the project folder log\
folder.

Logrotate has to be configured on the host.

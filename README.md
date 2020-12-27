# flaskblog

## Running development environment
1. Add credentials to the .env file
2. Then run : 
```sh
docker-compose up -d
docker exec flaskblog_postgre_server_1 psql -d {database_name} -U {database_user}  -f data_sql/backupdatabase.sql
```
## Push app to Production

#### 1. On dev environment
```sh
docker exec -it flaskblog_db_1 /bin/bash
pg_dump -c -U {database_username} {database_name} > data_sql/backupdatabase.sql
exit
git add data_sql/*
git commit -m "Add new database backup"
git push origin master
```
#### 2. On production environment
```sh
docker-compose down
docker rmi flaskblog_web
git pull origin master
docker-compose up -d
docker exec flaskblog_db_1 psql -d {database_name} -U {database_user} -f data_sql/backupdatabase.sql
docker exec flaskblog_web_1 python manage.py db migrate
docker exec flaskblog_web_1 python manage.py db upgrade
```

## Useful commands
```sh
docker exec -it flaskblog_db_1 /bin/bash
docker exec flaskblog_web_1 python manage.py db migrate
docker exec flaskblog_web_1 python manage.py db upgrade
```

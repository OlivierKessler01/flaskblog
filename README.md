# flaskblog
## Running development environment
#### 1. Modify the nginx.conf reverse proxy configuration file to accomodate your needs

#### 2. Then run :
```sh
make launch mongo_username= mongo_password= mongo_database=
make insert_test_data
```
## Using app
localhost => Homepage. Each article id can be found in the DOM.

localhost/delete_article_form => From to delete an article

localhost/write_article_form => Form to write an article

localhost/update_article_form/<id> => Form to update an article

## Monitoring reverse proxy access logs
The reverse-proxy access and error logs are located in the project folder log\
folder and are logrotated.

## Run production environment
#### 1. Run:
```sh
python -m olivierkessler01.flaskblog.ops.oliviersible deploy \
    --ssh_username= --ssh_password= --ssh_ip=
```

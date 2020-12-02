.DEFAULT_GOAL:= help 

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  help      Show this help message"
	@echo "  "


.ONESHELL:
launch:
	docker compose build -e MONGO_USERNAME=$(mongo_username)
		-e MONGO_PASSWORD=$(mongo_password)
		-e MONGO_DATABASE=$(mongo_database)
	docker compose up -d 

.ONESHELL:
insert_test_data:
	sudo chmod -R 775 Data/
	docker exec -it flaskblog_mongo_1 /bin/bash
	#Run mongo shell
	mongo --username $(mongo_username) --password $(mongo_username) --authenticationDatabase admin
	#Create database
	use $(database_name)
	#Create collection and add articles
	db.Articles.insertOne({title: "lorem ipsum", content: "Lorem ipsum content lorem ipsim edkzedkzepdl"});


tests:
	python -m tests/integration.py 



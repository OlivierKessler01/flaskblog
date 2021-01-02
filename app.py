from flask import Flask, request, jsonify, escape, render_template, make_response
from flask_pymongo import PyMongo
from influxdb import InfluxDBClient
from datetime import datetime
from pprint import pprint

import os

app = Flask(__name__)
app.config.from_object(os.environ['APP_SETTINGS'])
mongo = PyMongo(app)
influxdb_client = InfluxDBClient(host=os.environ['INFLUXDB_HOST'],port=os.environ['INFLUXDB_PORT'],username=os.environ['INFLUXDB_USERNAME'],password=os.environ['INFLUXDB_PASSWORD'])
influxdb_client.create_database('blog')
influxdb_client.switch_database('blog')

#Home action
@app.route('/', methods=['GET'])
def hello():
    json_body = [
        {
            "measurement": "visit",
            #"tags": {
            #    "host": "server01",
            #    "region": "us-west"
            #},
            "time": datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%SZ'),
            "fields": {
                "Int_value": 1
            }
        }
    ]

    influxdb_client.write_points(json_body)
    articles = mongo.db.Articles.find()

    return render_template('home.html', articles=articles)


#Rest APi get all articles
@app.route('/article', methods=['GET'])
def get_all_articles():
    articles = mongo.db.Articles.find()
    data = []
    for article in articles:
        data.append(
            {
                "id":
                escape(article.get("_id")),
                "title":
                article.get('title'),
                "content":
                article.get('content')
            }
        )

    response = make_response(
         jsonify(
                 {
                     "message" : "Success",
                     "data" : data
                 }
          ),
         200,
     )
    response.headers["Content-Type"] = "application/json"
    return response

#Rest API Article, Get one article by Id
@app.route('/article/<id>', methods=['GET'])
def get_article(id):
    article = mongo.db.Articles.find_one({'_id' : escape(id)})
    
    if article:
        return jsonify("article found")
    else:
        response = make_response(
            jsonify(
                {
                    "message": "Ressource not found", 
                    "severity": "danger"
                }
            ),
            404,
        )
        response.headers["Content-Type"] = "application/json"
        return response

#TODO : implement secure PUT/POST/DELETE API methods
#Rest API Article, Create one article
#@app.route('/article', methods=['POST'])
#def post_article():
#    mongo.db.Articles.insert_one(
#            {'title' : escape(request.form['title']), 'content' : escape(request.form['content'])}
#            )
#    return jsonify(request="success")

#Rest API Article, modify one article
#@app.route('/article', methods=['PUT'])
#def put_article():
#    return jsonify(request="fail")

#Rest API Article, delete one article
#@app.route('/article/<id>', methods=['DELETE'])
#def delete_article():
#    mongo.db.Articles.delete_one({"_id", escape(id)})
#    return jsonify(request="success")

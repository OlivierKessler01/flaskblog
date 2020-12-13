from flask import Flask, jsonify, render_template, make_response
from flask_sqlalchemy import SQLAlchemy
from influxdb import InfluxDBClient
from datetime import datetime

import os

app = Flask(__name__)
app.config.from_object(os.environ['APP_SETTINGS'])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
influxdb_client = InfluxDBClient(host=os.environ['INFLUXDB_HOST'],port=os.environ['INFLUXDB_PORT'],username=os.environ['INFLUXDB_USERNAME'],password=os.environ['INFLUXDB_PASSWORD'])
influxdb_client.create_database('pyexample')
influxdb_client.switch_database('pyexample')

from models import Articles

#Home action
@app.route('/', methods=['GET'])
def hello():
    json_body = [
        {
            "measurement": "cpu_load_short",
            "tags": {
                "host": "server01",
                "region": "us-west"
            },
            "time": datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%SZ'),
            "fields": {
                "Int_value": 1
            }
        }
    ]

    influxdb_client.write_points(json_body)
    articles = Articles.query.all()
    return render_template('home.html', articles=articles)

#Rest APi get all articles
@app.route('/article', methods=['GET'])
def get_all_articles():
    articles = Articles.query.all()
    data = []
    for article in articles:
        data.append(
            {
                "id":
                article.id,
                "title":
                article.title,
                "content":
                article.content
            }
        )

    response = make_response(
         jsonify(
                 {"message" : "Success",
                 "data" : data}
          ),
         200,
     )
    response.headers["Content-Type"] = "application/json"
    return response

#Rest API Article, Get one article by Id
@app.route('/article/<id>', methods=['GET'])
def get_article(id):
    article = Articles.query.get(id)

    if article:
        return jsonify(id=article.id, title=article.title, content=article.content)
    else:
        response = make_response(
            jsonify(
                {"message": "Ressource not found", "severity": "danger"}
            ),
            404,
        )
        response.headers["Content-Type"] = "application/json"
        return response

#Rest API Article, Create one article
@app.route('/article', methods=['POST'])
def post_article():
    article = Article(request.form['title'], request.form['content'])
    db.session.add(article)
    db.session.commit()
    return jsonify(request="success")

#Rest API Article, modify one article
@app.route('/article', methods=['PUT'])
def put_article():
    return jsonify(request="success")

#Rest API Article, delete one article
@app.route('/article/<id>', methods=['DELETE'])
def delete_article():
    article = Articles.query.get(id)
    db.session.delete(article)
    db.session.commit()
    return jsonify(request="success")
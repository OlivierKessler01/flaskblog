from flask import Flask, jsonify, render_template
from flask_sqlalchemy import SQLAlchemy
from influxdb import InfluxDBClient
from datetime import datetime

import os

app = Flask(__name__)
app.config.from_object(os.environ['APP_SETTINGS'])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
influxdb_client = InfluxDBClient(host='influxdb',port=8086,username=os.environ['INFLUXDB_USERNAME'],password=os.environ['INFLUXDB_PASSWORD'])
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

@app.route('/<name>', methods=['GET'])
def hello_name(name):
    return "Hello {}!".format(name)

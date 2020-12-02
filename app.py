from flask import Flask, jsonify, render_template
from flask_sqlalchemy import SQLAlchemy
from flask_swagger import swagger
import os

app = Flask(__name__)
app.config.from_object(os.environ['APP_SETTINGS'])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

#Home action
@app.route('/', methods=['GET'])
def hello():
    return render_template('home.html')

@app.route('/api-spec', methods=['GET'])
def spec():
    return jsonify(swagger(app))

@app.route('/<name>', methods=['GET'])
def hello_name(name):
    return "Hello {}!".format(name)

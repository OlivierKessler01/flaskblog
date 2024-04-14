from flask import Flask, request, jsonify, escape, render_template, make_response
from flask_pymongo import PyMongo
from flask_pymongo import ObjectId
from datetime import datetime
from pprint import pprint
#from data_engine import DataEngine
import os

app = Flask(__name__)
app.config.from_object(os.environ['APP_SETTINGS'])
mongo = PyMongo(app)

#Home action
@app.route('/', methods=['GET'])
def hello():
    articles = mongo.db.Articles.find().sort("_id", -1)
    return render_template('home.html', articles=articles)

@app.route('/update_article_form/<id>', methods=['GET'])
def update_article_form(id):
    article = mongo.db.Articles.find_one({'_id' : ObjectId(escape(id))})
    if article:
        return render_template('update_article.html', article=article)
    else:
        return jsonify(request="Article doesn't exist")

#Renders a form to delete an article
@app.route('/delete_article_form', methods=['GET'])
def delete_article_form():
    return render_template('delete_article.html')

#Renders a form to write an article
@app.route('/write_article_form', methods=['GET'])
def write_article_form():
    return render_template('write_article.html')

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
    article = mongo.db.Articles.find_one({'_id' : ObjectId(escape(id))})

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


#Rest API Article, Create one article
@app.route('/article', methods=['POST'])
def post_article():
    if(escape(request.form['database_username']) == os.environ['MONGO_USERNAME'] and escape(request.form['database_password']) == os.environ['MONGO_PASSWORD']):
        mongo.db.Articles.insert_one(
            {
                'title' : escape(request.form['title_article']),
                'content' : escape(request.form['content_article'])
            })
        return jsonify(request="success")
    else:
        return jsonify(request="fail : bad authentication")

#Rest API Article, update one article
@app.route('/update/article', methods=['PUT', 'POST'])
def update_article():
    id_article = escape(request.form['id_article'])

    if id_article != '':
        if(escape(request.form['database_username']) == os.environ['MONGO_USERNAME'] and escape(request.form['database_password']) == os.environ['MONGO_PASSWORD']):
            result = mongo.db.Articles.update_one(
                {'_id' : ObjectId(id_article)},
                { "$set" :
                    {'content' : escape(request.form['content_article'])}
                }
            )
            if result.modified_count > 0:
                return jsonify(request="Success")
            else:
                return jsonify(request="Failed to update the article")
        else:
            return jsonify(request="fail: bad authentication")
    else:
        return jsonify(request="fail: Article id missing")

#Rest API Article, delete one article
@app.route('/delete/article', methods=['DELETE', 'POST'])
def delete_article():
    id_article = escape(request.form['id_article'])

    if id_article != '':
        if(escape(request.form['database_username']) == os.environ['MONGO_USERNAME'] and escape(request.form['database_password']) == os.environ['MONGO_PASSWORD']):
            result = mongo.db.Articles.delete_one({'_id' : ObjectId(id_article)})
            if result.deleted_count > 0:
                return jsonify(request="Success")
            else:
                return jsonify(request="Failed to delete the article")
        else:
            return jsonify(request="fail: bad authentication")
    else:
        return jsonify(request="fail: Article id missing")

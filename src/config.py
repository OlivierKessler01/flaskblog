import os
import urllib.parse

basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
    DEBUG = False
    TESTING = False
    CSRF_ENABLED = True
    SECRET_KEY = 'this-really-needs-to-be-changed'
    password = urllib.parse.quote_plus(os.environ['MONGO_PASSWORD'])
    MONGO_URI = 'mongodb://%s:%s@%s:27017/%s?authSource=admin' % (os.environ['MONGO_USERNAME'], password, os.environ['MONGO_HOST'], os.environ['MONGO_DATABASE'])

class ProductionConfig(Config):
    DEBUG = False

class StagingConfig(Config):
    DEVELOPMENT = True
    DEBUG = True

class DevelopmentConfig(Config):
    DEVELOPMENT = True
    DEBUG = True
    password = urllib.parse.quote_plus(os.environ['MONGO_PASSWORD'])
    MONGO_URI = 'mongodb://%s:%s@%s:27017/%s?authSource=admin' % (os.environ['MONGO_USERNAME'], password, os.environ['MONGO_HOST'], os.environ['MONGO_DATABASE'])

class TestingConfig(Config):
    TESTING = True

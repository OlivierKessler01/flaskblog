from app import db
from sqlalchemy.dialects.postgresql import JSON


class Articles(db.Model):
    __tablename__ = 'articles'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String())
    content = db.Column(db.Text())
    date = db.Column(db.Time())

    def __init__(self, url, content, date):
        self.url = url
        self.content = content
        self.date = date

    def __repr__(self):
        return '<id {}>'.format(self.id)

from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()


class Product(db.Model):
    __tablename__ = 'product'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200))

    def __init__(self, name=None):
        self.name = name

    def __repr__(self):
        return 'Id: {}, name: {}'.format(self.id, self.name)

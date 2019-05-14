from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()


class Product(db.Model):
    __tablename__ = 'product'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(225))
    img_url = db.Column(db.String(200))
    description = db.Column(db.String(225))
    title = db.Column(db.String(200))
    product_status_id = db.Column(db.Integer)
    regular_price = db.Column(db.Float)
    discount_price = db.Column(db.Float)
    quantity = db.Column(db.Integer)
    taxable = db.Column(db.Boolean)

    def __init__(self, name=None):
        self.name = name

    def __repr__(self):
        return 'Id: {}, name: {}'.format(self.id, self.name)

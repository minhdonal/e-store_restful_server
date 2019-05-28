from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()


class Product(db.Model):
    __tablename__ = 'products'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(225))
    img_url = db.Column(db.String(200))
    description = db.Column(db.String(225))
    categ_id = db.Column(db.String(200))
    product_status_id = db.Column(db.Boolean)
    regular_price = db.Column(db.Float)
    discount_price = db.Column(db.Float)
    quantity = db.Column(db.Integer)
    taxable = db.Column(db.Float)
    inserted_at = db.Column(db.String(100))
    def __init__(self, name, img_url, description,
    categ_id, product_status_id, regular_price, discount_price,
    quantity):
        self.name = name
        self.img_url = img_url
        self.description = description
        self.categ_id = categ_id
        self.product_status_id = product_status_id
        self.regular_price = regular_price
        self.discount_price = discount_price
        self.quantity = quantity


    def __repr__(self):
        if product_status_id != 1:
            return False
        product_obj = {
    'id': self.id,
    'categ_id': self.categ_id,
    'img_url': self.img_url,
    'quantity': self.quantity,
    'name': self.name,
    'description': self.description,
    'product_status_id': self.product_status_id,
    'regular_price': self.regular_price,
    'discount_price': self.discount_price,
    'taxable': self.taxable,
    'inserted_at': self.inserted_at
        }
        return product_obj

from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()


class Product(db.Model):
    __tablename__ = 'products'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200))
    title = db.Column(db.String(200))
    description = db.Column(db.String(400))
    product_status_id =  db.Column(db.Integer)
    img_url = db.Column(db.String(200))
    regular_price = db.Column(db.Integer)
    quantity = db.Column(db.Integer)
    img_url = db.Column(db.String(255))
    def __init__(self, name=None):
        self.name = name

    def __repr__(self):
        if product_status_id != 1:
            return False
        return """Id: {}, 
        name: {},
        title: {},
        description: {},
        img_url: {},
        regular_price: {},
        quantity: {}
        """.format(self.id, self.name, self.title, 
        self.description, self.img_url, 
        self.regular_price, self.quantity)

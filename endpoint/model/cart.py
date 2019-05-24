from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, DateTime
import datetime
db = SQLAlchemy()


class SaleOrder(db.Model):
    __tablename__ = 'sales_order'

    id = db.Column(db.Integer, primary_key=True)
    total = db.Column(db.Float)
    user_id = db.Column(db.Integer)
    inserted_at = datetime.datetime.utcnow()
    def __init__(self, total, user_id):
        self.total = total
        self.user_id = user_id

    def __repr__(self):
        result_obj = {
            'id': self.id,
            'order_date': self.order_date,
            'total': self.total,
            'inserted_at': self.inserted_at
        }

        return result_obj

class OrderLine(db.Model):
    __tablename__ = 'order_line'

    id = db.Column(db.Integer, primary_key=True)
    order_id = db.Column(db.Integer)
    product_id = db.Column(db.Integer)
    quantity = db.Column(db.Integer)
    subtotal = db.Column(db.Float)
    inserted_at = datetime.datetime.utcnow()

    def __init__(self, order_id, 
    quantity, subtotal, product_id):
        self.product_id = product_id
        self.order_id = order_id
        self.quantity = quantity
        self.subtotal = subtotal

    def __repr__(self):
        result_obj = {
            'id': self.id,
            'order_id': self.order_id,
            'product_id': self.product_id,
            'subtotal': self.subtotal,
            'inserted_at': self.inserted_at
        }

        return result_obj



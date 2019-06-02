from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, DateTime
import datetime
db = SQLAlchemy()

import sys

class SaleOrder(db.Model):
    __tablename__ = 'sales_order'

    id = db.Column(db.Integer, primary_key=True)
    total = db.Column(db.Float)
    user_id = db.Column(db.Integer)
    order_date = db.Column(Date, default=datetime.utcnow().date())
    address = db.Column(db.String(100))
    phone = db.Column(db.String(10))
    state = db.Column(db.String(10))

    def __init__(self, total, user_id, order_date, address, phone):
        self.total = total
        self.user_id = user_id
        print('order_date' % str(order_date), file=sys.stderr)
        the_date = datetime.datetime.strptime(order_date, "%Y-%m-%d").date()
        self.order_date = the_date
        print('the_date' % str(the_date), file=sys.stderr)
        self.address = address
        self.phone = phone
        self.state = 'draft'

    def __repr__(self):
        result_obj = {
            'id': self.id,
            'order_date': self.order_date,
            'total': self.total,
            'user_id': self.user_id,
            'address': self.address,
            'phone': self.phone}

        return result_obj

class OrderLine(db.Model):
    __tablename__ = 'order_line'

    id = db.Column(db.Integer, primary_key=True)
    order_id = db.Column(db.Integer)
    product_id = db.Column(db.Integer)
    quantity = db.Column(db.Integer)
    price_unit = db.Column(db.Float)

    def __init__(self, order_id, quantity, subtotal, product_id):
        self.product_id = product_id
        self.order_id = order_id
        self.quantity = quantity
        self.subtotal = subtotal

    def __repr__(self):
        result_obj = {
            'id': self.id,
            'order_id': self.order_id,
            'product_id': self.product_id,
            'price_unit': self.price_unit,
            'inserted_at': self.inserted_at
        }

        return result_obj

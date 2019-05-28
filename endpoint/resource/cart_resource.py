from endpoint.model.cart import SaleOrder, db, OrderLine
from flask_restful import Resource, reqparse, request
from flask_restful import fields, marshal_with, marshal
from flask import request, jsonify

saleoder_fields = {
    'id': fields.Integer,
    'inserted_at': fields.String,
    'total': fields.Float,
    'user_id': fields.Integer
}
orderline_fields = {
    'id': fields.Integer,
    'order_id': fields.Integer,
    'product_id': fields.Integer,
    'subtotal': fields.Float,
    'inserted_at': fields.String
}

class SaleOrderResource(Resource):
    def post(self):
        try:
            total= request.form['total']
            user_id = request.form['user_id']

            new_order = SaleOrder(total,user_id)
            
            db.session.add(new_order)
            db.session.flush()
            #refesh will help get a new id    
            db.session.refresh(new_order)
            new_id = new_order.id

            response_object = {
            'status': 'success',
            'message': 'Successfully registered.',
            'new_id': new_id
            }
            return response_object, 201
        except Exception as e:
            response_object = {
                'status': 'fail',
                'message': 'User already exists. Please Log in.',
            }
            return response_object, 409
    @marshal_with(saleoder_fields, envelope='data')
    def get(self):
        record = SaleOrder.query.all()
        return record

class OrderLineResource(Resource):
    def post(self):
        try:
            product_id = request.form['product_id']
            order_id = request.form['order_id']
            quantity = request.form['quantity']
            subtotal = request.form['subtotal']

            new_order = OrderLine(order_id,
            quantity, subtotal,product_id)
            
            db.session.add(new_order)
            db.session.commit()
            
            response_object = {
                'status': 'success',
                'message': 'Successfully registered.'
            }
            return response_object, 201
        except Exception as e:
            response_object = {
                'status': 'fail',
                'message': 'Some error occurred. Please try again.'
            }
            return response_object, 401
    @marshal_with(orderline_fields, envelope='data')
    def get(self):
        record = OrderLine.query.all()
        return record

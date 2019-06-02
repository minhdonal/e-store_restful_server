from endpoint.model.cart import SaleOrder, db, OrderLine
from flask import request, jsonify
from flask_restful import Resource, reqparse, request
from flask_restful import fields, marshal_with, marshal

import sys

saleoder_fields = {
    'id': fields.Integer,
    'order_date': fields.String,
    'total': fields.Float,
    'user_id': fields.Integer,
    'address': fields.String,
    'phone': fields.String,
    'state': fields.String}

orderline_fields = {
    'id': fields.Integer,
    'order_id': fields.Integer,
    'product_id': fields.Integer,
    'subtotal': fields.Float,
    'inserted_at': fields.String}

order_parser = reqparse.RequestParser()
order_parser.add_argument('order_date')
order_parser.add_argument('total')
order_parser.add_argument('user_id')
order_parser.add_argument('address')
order_parser.add_argument('phone')

class SaleOrderResource(Resource):
    def post(self):
        response_object = {
            'status': 'FAIL',
            'message': 'Some error occurred. Please try again.',
            'return_id': 0}
        try:
            args = order_parser.parse_args()
            print('args %s' % str(args), file=sys.stderr)
            user_id =  args['user_id']
            total =  args['total']
            order_date = args['order_date']
            phone = args['phone']
            address = args['address']
            print('order_date %s' % str(order_date), file=sys.stderr)
            print('phone %s' % str(phone), file=sys.stderr)
            new_order = SaleOrder(total, user_id, order_date, phone, address)
            print('new_order ' % str(new_order.address), file=sys.stderr)
            db.session.add(new_order)
            db.session.commit()
            # db.session.flush()

            #refesh will help get a new id    
            # db.session.refresh(new_order)
            new_id = new_order.id

            response_object['status'] = 'SUCCESS'
            response_object['message'] = 'Successfully ordering!'
            response_object['return_id'] = new_id
            db.session.remove()
            print(response_object)
            return jsonify(response_object)
        except Exception as e:
            return jsonify(response_object)

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

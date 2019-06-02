from endpoint.model.cart import SaleOrder, db, OrderLine
from flask import request, jsonify
from flask_restful import Resource, reqparse, request
from flask_restful import fields, marshal_with, marshal

import json
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
order_parser.add_argument('order_lines')

class SaleOrderResource(Resource):
    def post(self):
        try:
            response_object = {
                'status': 'FAIL',
                'message': 'Some error occurred. Please try again.',
                'return_id': 0}
            args = order_parser.parse_args()
            print('args %s' % str(args), file=sys.stderr)
            user_id =  args['user_id']
            total = args['total']
            order_date = args['order_date']
            phone = args['phone']
            address = args['address']
            order_lines = args['order_lines']
            if not order_lines:
                response_object['message'] = "The order doesn't have any product?"
                return jsonify(response_object)

            new_order = SaleOrder(total, user_id, order_date, phone, address)
            db.session.add(new_order)
            db.session.commit()
            # db.session.flush()
            # refesh will help get a new id    
            db.session.refresh(new_order)
            new_id = new_order.id
            if not new_id:
                return jsonify(response_object)

            is_added_detail_done =\
                self._add_order_detail(new_id, order_lines)
            print('is_added_detail_done %s' % str(is_added_detail_done), file=sys.stderr)
            if is_added_detail_done:
                response_object['status'] = 'SUCCESS'
                response_object['message'] = 'Successfully ordering!'
                response_object['return_id'] = new_id

            db.session.remove()
            return jsonify(response_object)
        except Exception as e:
            return jsonify(response_object)

    def _add_order_detail(self, order_id, order_lines):
        # Convert string to JSON data (list of dictionary)
        entries = eval(order_lines)
        if not order_id or not order_lines:
            return False
        try:
            for val in entries:
                order_line = OrderLine(
                    order_id,
                    val.get('product_id'),
                    val.get('quantity'),
                    val.get('price_unit'))
                db.session.add(order_line)
            db.session.commit()
            return True
        except Exception as e:
            return False

    @marshal_with(saleoder_fields, envelope='data')
    def get(self, ):
        records = SaleOrder.query.all()
        db.session.remove()
        return records

class OrderLineResource(Resource):
    def post(self):
        try:
            product_id = request.form['product_id']
            order_id = request.form['order_id']
            quantity = request.form['quantity']

            new_order = OrderLine(order_id, quantity, subtotal,product_id)

            db.session.add(new_order)
            db.session.commit()

            response_object = {
                'status': 'success',
                'message': 'Successfully registered.'}
            return jsonify(response_object)
        except Exception as e:
            response_object = {
                'status': 'fail',
                'message': 'Some error occurred. Please try again.'}
            return response_object, 401

    @marshal_with(orderline_fields, envelope='data')
    def get(self):
        record = OrderLine.query.all()
        return record

from endpoint.model.product import *

from flask_restful import Resource, reqparse, request
from flask_restful import fields, marshal_with, marshal
from flask import abort, jsonify

product_fields = {
    'id': fields.Integer,
    'name': fields.String,
}

product_parser = reqparse.RequestParser()
product_parser.add_argument('name')

class ProductResource(Resource):
    @marshal_with(product_fields)
    def get(self, product_id):
        product = Product.query.filter_by(id=product_id).first()
        if not product:
            abort(400, message="Product {} doesn't exist".format(product_id))
        return {'id': product.id, 'name': product.name, 'vll....': 'Do cho'}

    @marshal_with(product_fields)
    def post(self):
        pass

    @marshal_with(product_fields)
    def put(self, id):
        pass

    @marshal_with(product_fields)
    def delete(self, id):
        pass

class ProductListResource(Resource):
    '''
    - This using for all product activity
    '''

    @marshal_with(product_fields)
    def get(self):
        products = Product.query.all()
        return products

    @marshal_with(product_fields)
    def post(self):
        pass

from flask_restful import Resource, reqparse, request
from flask_restful import fields, marshal_with, marshal
from endpoint.model.product import *

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
            abort(404, message="Product {} doesn't exist".format(id))
        return product

class ProductListResource(Resource):
    @marshal_with(product_fields)
    def get(self):
        products = Product.query.all()
        return products

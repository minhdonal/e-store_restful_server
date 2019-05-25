from endpoint.model.product import *
from endpoint.model.recomend_product import Recomend
from flask_restful import Resource, reqparse, request
from flask_restful import fields, marshal_with, marshal
from flask import abort, jsonify

product_fields = {
    'id': fields.Integer,
    'name': fields.String,
    'description': fields.String,
    'img_url': fields.String,
    'regular_price': fields.Integer,
    'regular_price': fields.Float,
    'discount_price': fields.Float,
    'quantity': fields.Integer
}

product_parser = reqparse.RequestParser()
product_parser.add_argument('name')

class ProductResource(Resource):
    @marshal_with(product_fields)
    def get(self, product_id):
        product = Product.query.filter_by(id=product_id).first()
        if not product:
            abort(400, message="Product {} doesn't exist".format(product_id))
        return product

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
        products = Product.query.limit(20).all()
        return products

    @marshal_with(product_fields)
    def post(self):
        pass

class RecomendProduct(Resource):
    """
    this return recomend product when get url
    ex: http://localhost:5000/api/recommend?search_key=burgers
    this will return product recomend when buy burgers 
    """
    @marshal_with(product_fields)
    def get(self):
        search_key = request.args.get('search_key',type = str)
        if not search_key:
            return Product.query.limit(6).all()
        Re = Recomend()
        list_recomend = Re.search(search_key)
        query = Product.query.filter(Product.name.in_(list_recomend))
        results = query.limit(6).all()
        if not results:
            return Product.query.limit(6).all()
        print(results)
        return results

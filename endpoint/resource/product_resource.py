from endpoint.model.product import *
from endpoint.model.recomend_product import Recomend
from flask import abort, jsonify
from flask_restful import Resource, reqparse, request
from flask_restful import fields, marshal_with, marshal


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
# product_parser.add_argument('name')

class ProductResource(Resource):
    @marshal_with(product_fields)
    def get(self, product_id):
        product = db.session.query(Product).filter_by(id=product_id).first()
        db.session.remove()
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
        # products = Product.query.limit(20).all()
        products = db.session.query(Product).limit(20).all()
        db.session.remove()
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
        Re = Recomend()
        list_recomend = Re.search(search_key)
        if not search_key or not list_recomend:
            result = db.session.query(Product).limit(6).all()
            db.session.remove()
            return result

        results = db.session.query(Product).filter(
            Product.name.in_(list_recomend)).limit(6).all()
        db.session.remove()

        # If don't enough 6, add more product with the same categ_id
        if not results or results and len(results) < 6:
            ext_results = db.session.query(
                Product).limit(6 - len(results)).all()
            db.session.remove()
            results = results + ext_results
        return results

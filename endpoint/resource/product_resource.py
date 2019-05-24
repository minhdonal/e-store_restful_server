from endpoint.model.product import *
from endpoint.model.recomend_product import Recomend
from flask_restful import Resource, reqparse, request
from flask_restful import fields, marshal_with, marshal
from flask import abort, jsonify

product_fields = {
    'id': fields.Integer,
    'title': fields.String,
    'description': fields.String,
    'img_url': fields.String,
    'regular_price': fields.Integer,
    'quantity': fields.Integer,
    'name': fields.String,
    'img_url': fields.String,
    'description': fields.String,
    'title': fields.String,
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

class ProductListResource(Resource):
    '''
    - This using for all product activity
    '''

    @marshal_with(product_fields)
    def get(self):
        products = Product.query.all()
        return products
    #insert new product
    def post(self):
        try:
            name = request.form['name']
            img_url = request.form['img_url']
            description = request.form['description']
            title = request.form['title']
            product_status_id = request.form['status']
            regular_price = request.form['price']
            discount_price = request.form['discount']
            quantity = request.form['quantity']
            taxable = request.form['taxable']

            new_product = Product(name, img_url, description,
            title, product_status_id, regular_price, discount_price,
            quantity,taxable)

            db.session.add(new_product)
            db.session.flush()
            #refesh will help get a new id    
            db.session.refresh(new_product)
            new_id = new_product.id
            response_object = {
                'status': 'success',
                'message': 'Successfully registered.',
                'new_id': new_id
                }
            return response_object, 201
        except Exception as e:
            response_object = {
                'status': 'fail',
                'message': 'Some error occurred. Please try again.'
            }
            return response_object, 401



class RecomendProduct(Resource):
    """
    this return recomend product when get url
    ex: http://localhost:5000/api/recomend?search_key=burgers
    this will return product recomend when buy burgers 
    """
    @marshal_with(product_fields)
    def get(self):
        search_key = request.args.get('search_key',type = str)
        Re = Recomend()
        list_recomend = Re.search(search_key)
        query = Product.query.filter(Product.name.in_(list_recomend))
        results = query.all()
        return results

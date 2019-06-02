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
    'regular_price': fields.Float,
    'discount_price': fields.Float,
    'taxable': fields.Float,
    'categ_id': fields.Integer,
    'product_status_id': fields.String,
    'quantity': fields.Integer
}

product_parser = reqparse.RequestParser()
product_parser.add_argument('name')

class ProductResource(Resource):
    @marshal_with(product_fields)
    def get(self, product_id):
        product = db.session.query(Product).filter_by(id=product_id).first()
        db.session.remove()
        if not product:
            abort(400, message="Product {} doesn't exist".format(product_id))
        return product

class ProductListResource(Resource):
    """
    - This using for all product activity
    """

    @marshal_with(product_fields)
    def get(self):
        search_categ_id = request.args.get('categ_id', type = int)
        if search_categ_id and search_categ_id > 0:
            products = db.session.query(Product).filter_by(categ_id=categ_id).limit(6).all()
        else:
            products = db.session.query(Product).limit(30).all()
        db.session.remove()
        return products

    #insert new product
    def post(self):
        try:
            name = request.form['name']
            img_url = request.form['img_url']
            description = request.form['description']
            categ_id = request.form['categ_id']
            product_status_id = request.form['status']
            regular_price = request.form['price']
            discount_price = request.form['discount']
            quantity = request.form['quantity']

            if product_status_id == '1':
                product_status_id = True
            else:
                product_status_id = False
            new_product = Product(name, img_url, description,
                categ_id, product_status_id, regular_price, discount_price,
                quantity)

            db.session.add(new_product)
            db.session.commit()
                #refesh will help get a new id    
            #db.session.refresh(new_product)
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

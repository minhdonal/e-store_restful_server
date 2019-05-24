from flask import Flask, jsonify
from flask_restful import Api
from flask_sqlalchemy import SQLAlchemy

from endpoint.model.product import db
import setting

app = Flask(__name__, static_url_path='/static')

app.config['SQLALCHEMY_DATABASE_URI'] = setting.SQLALCHEMY_DATABASE_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = setting.SQLALCHEMY_TRACK_MODIFICATIONS
app.config['BUNDLE_ERRORS'] = setting.BUNDLE_ERRORS

api = Api(app)
db = SQLAlchemy(app)
db.init_app(app)

# Setup the API resource routing
from endpoint.resource.product_resource import (
		ProductResource, ProductListResource, RecomendProduct)
from endpoint.resource.algorthm_resource import AlgorithmResource
from endpoint.resource.account_resource import (AccountResource,
        CreateAccount, CreateRoleUser)

from endpoint.resource.cart_resource import (SaleOrderResource,
        OrderLineResource)

api.prefix = '/api'
api.add_resource(ProductListResource, '/products')
api.add_resource(ProductResource, '/products/<int:product_id>')
api.add_resource(RecomendProduct, '/recomend')
api.add_resource(AlgorithmResource, '/algorthm')

api.add_resource(AccountResource, '/account')
api.add_resource(CreateAccount, '/createaccount')
api.add_resource(CreateRoleUser, '/createroleuser')

api.add_resource(SaleOrderResource, '/addneworder')
api.add_resource(OrderLineResource, '/addneworderline')

@app.route('/')
def index():
    return 'Hello World'

if __name__ == '__main__':
    app.run(debug=True)

from flask import Flask, jsonify
from flask_restful import Api
from flask_sqlalchemy import SQLAlchemy
import setting

### App section
app = Flask(__name__, static_url_path='/static')
app.config['SQLALCHEMY_DATABASE_URI'] = setting.SQLALCHEMY_DATABASE_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = setting.SQLALCHEMY_TRACK_MODIFICATIONS
app.config['BUNDLE_ERRORS'] = setting.BUNDLE_ERRORS

db = SQLAlchemy(app)
db.init_app(app)

@app.route('/')
def index():
    return 'Hello World'

@app.teardown_appcontext
def shutdown_session(exception=None):
    db.session.remove()

### API section
# Setup the API resource routing
from endpoint.resource.product_resource import (
		ProductResource, ProductListResource, RecomendProduct)
from endpoint.resource.algorthm_resource import (AlgorithmResource,
        RecommendResource, ReadRawDataRecommend)
from endpoint.resource.account_resource import (AccountResource,
        CreateAccount, CreateRoleUser)
from endpoint.resource.cart_resource import (SaleOrderResource,
        OrderLineResource)

api = Api(app)
api.prefix = '/api'
api.add_resource(ProductListResource, '/products')
api.add_resource(ProductResource, '/products/<int:product_id>')
api.add_resource(RecomendProduct, '/recommend')
api.add_resource(AlgorithmResource, '/algorthm')
api.add_resource(RecommendResource, '/recomendall')
api.add_resource(ReadRawDataRecommend, '/datarecomend')
api.add_resource(AccountResource, '/account')
api.add_resource(CreateAccount, '/createaccount')
api.add_resource(CreateRoleUser, '/createroleuser')

api.add_resource(SaleOrderResource, '/saleorder')
api.add_resource(OrderLineResource, '/orderline')

if __name__ == '__main__':
    app.run(debug=False, threaded=True)

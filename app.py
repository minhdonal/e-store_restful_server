from flask import Flask, jsonify
from flask_restful import Api
from flask_sqlalchemy import SQLAlchemy

from endpoint.model.product import db
import setting

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = setting.SQLALCHEMY_DATABASE_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = setting.SQLALCHEMY_TRACK_MODIFICATIONS
app.config['BUNDLE_ERRORS'] = setting.BUNDLE_ERRORS

api = Api(app)
db = SQLAlchemy(app)
db.init_app(app)

# Setup the API resource routing
from endpoint.resource.product_resource import ProductResource, ProductListResource

api.prefix = '/api'
api.add_resource(ProductListResource, '/products/')
api.add_resource(ProductResource, '/products/<int:product_id>')

@app.route('/')
def index():
    return 'Hello World'

if __name__ == '__main__':
    app.run(debug=True)

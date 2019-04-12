from flask import Flask, render_template, request
from flask_cors import CORS
from flask import request, jsonify
import pandas as pd
import urllib.request

import BUS.account as Acc
import BUS.product as pro
app = Flask(__name__)
cors = CORS(app, resource={r"/*":{"origins": "*"}})
app.config["DEBUG"] = True
@app.route('/',methods = ['POST', 'GET'])
def home():
    return "home"

#login
@app.route('/login')
def login():
    #Get username and password
    username=request.args.get('username')
    password= request.args.get('password')
    #check in database
    if(Acc.CheckAccount(username,password)):
        return 'true'
    return 'false'
@app.route('/listproduct')
def listproduct():
    page = request.args.get('page',type=int)
    listproduct= pro.getListProduct(page)
    return jsonify(listproduct)
@app.route('/product')
def product():
    idProduct = request.args.get('id',type = int)
    product = pro.getProductId(idProduct)
    return jsonify(product)
app.run(debug = True)
flask_cors.CORS(app, expose_headers='Authorization')
    
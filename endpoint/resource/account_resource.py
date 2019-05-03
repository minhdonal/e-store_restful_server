from endpoint.model.account import *

from flask_restful import Resource, reqparse, request
from flask_restful import fields, marshal_with, marshal
from flask import abort, jsonify
from flask import request, jsonify

account_fields = {
    'role': fields.String,
    'id': fields.Integer,
    'email': fields.String,
    'first_name': fields.String,
    'last_name': fields.String,
    'phone': fields.Integer
}

account_parser = reqparse.RequestParser()
account_parser.add_argument('name')

class AccountResource(Resource):
    @marshal_with(account_fields)
    def get(self):
        record = Account.query.all()
        return record

    @marshal_with(account_fields)
    def post(self):
        emails =  request.form['email']
        password =  request.form['password']
        result = Account.query.filter_by(email=emails,
        password_hash=password,active=1).first()
        if not result:
            abort(400, message="Account {} doesn't exist".format(emails))
        account_id = UserRoles.query.filter_by(user_id=result.return_id()).first()
        user_role = account_id.return_role_id()
        if user_role == 3:
            temp_fields = result
            #convert object class to dict --user var(obj) --
            temp_fields = vars(temp_fields)
            temp_fields['role'] = 'customer'
            return temp_fields
        if user_role == 2:
            temp_fields = result
            temp_fields = vars(temp_fields)
            temp_fields['role'] = 'employer'
            return temp_fields
        if user_role == 1:
            temp_fields = result
            temp_fields = vars(temp_fields)
            temp_fields['role'] = 'admin'
            return temp_fields
        return result

    @marshal_with(account_fields)
    def put(self, id):
        pass

    @marshal_with(account_fields)
    def delete(self, id):
        pass
class CreateAccount(Resource):
    #create account in database
    def post(self):
        emails =  request.form['email']
        password =  request.form['password']
        fisrt_name =  request.form['fisrt_name']
        last_name =  request.form['last_name']
        adress =  request.form['adress']
        phone = request.form['phone']
        inst = Account(emails , password, fisrt_name, 
        last_name, adress, phone)
        inst.add()
        inst.commit()
from endpoint.model.account import Account, UserRoles, db
import uuid
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
    'phone': fields.Integer,
    'adress': fields.String
}

account_parser = reqparse.RequestParser()
account_parser.add_argument('name')

class AccountResource(Resource):
    @marshal_with(account_fields)
    def get(self):
        record = Account.query.all()
        return record

    #@marshal_with(account_fields)
    def post(self):
        emails =  request.form['email']
        password =  request.form['password']
        result = Account.query.filter_by(
            email=emails,
            password_hash=password,
            active=1
        ).first()

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
        return temp_fields

class CreateAccount(Resource):
    #create account in database
    def post(self):
        try:
            emails =  request.form['email']
            password =  request.form['password']
            fisrt_name =  request.form['fisrtname']
            last_name =  request.form['lastname']
            adress =  request.form['adress']
            phone = request.form['phone']

            new_account = Account(emails , fisrt_name, last_name, 
                    phone, password, adress)

            db.session.add(new_account)
            db.session.commit()
            new_id = new_account.id
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

class CreateRoleUser(Resource):
    def post(self):
        try:
            user_id = request.form['user_id']
            role_id = request.form['role_id']

            new_user_role = UserRoles(user_id, role_id)
                
            db.session.add(new_user_role)
            db.session.commit()
                
            response_object = {
                'status': 'success',
                'message': 'Successfully registered.'
            }
            return response_object, 201
        except Exception as e:
            response_object = {
                'status': 'fail',
                'message': 'Some error occurred. Please try again.'
            }
            return response_object, 401
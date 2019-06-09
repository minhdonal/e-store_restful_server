from endpoint.model.account import Account, UserRoles, db
from flask import abort, jsonify
from flask_restful import Resource, reqparse, request
from flask_restful import fields, marshal_with, marshal

import uuid
import sys

account_fields = {
    'role': fields.String,
    'id': fields.Integer,
    'email': fields.String,
    'first_name': fields.String,
    'last_name': fields.String,
    'phone': fields.Integer,
    'adress': fields.String}

account_parser = reqparse.RequestParser()
account_parser.add_argument('id')
account_parser.add_argument('name')
account_parser.add_argument('email')
account_parser.add_argument('password')
account_parser.add_argument('password2')

class AccountResource(Resource):
    @marshal_with(account_fields)
    def get(self, account_id):
        account = db.session.query(Account).filter_by(id=account_id).first()
        db.session.remove()
        if not account:
            abort(400, message="Account {} doesn't exist".format(account_id))
        return account

    # @marshal_with(account_fields)
    # def post(self):
    #     emails =  request.form['email']
    #     password =  request.form['password']
    #     result = Account.query.filter_by(
    #         email=emails,
    #         password_hash=password,
    #         active=1
    #     ).first()
    #     response_object = {
    #             'status': 'fail',
    #             'message': 'Some error occurred. Please try again.'
    #         }
    #     if not result:
    #         return response_object, 401
    #     account_id = UserRoles.query.filter_by(user_id=result.return_id()).first()
    #     user_role = int(account_id.return_role_id())
    #     if user_role == 3:
    #         temp_fields = {
    #             'id_user': result.return_id(),
    #             'role':'customer'
    #         }
    #         return temp_fields
    #     if user_role == 2:
    #         temp_fields = {
    #             'id_user': result.return_id(),
    #             'role':'employer'
    #         }
    #         return temp_fields
    #     if user_role == 1:
    #         temp_fields = {
    #             'id_user': result.return_id(),
    #             'role':'admin'
    #         }
    #         return temp_fields
    #     return response_object

class AccountListResource(Resource):
    @marshal_with(account_fields)
    def get(self):
        accounts = db.session.query(Account).all()
        db.session.remove()
        return accounts

class AuthenResource(Resource):
    @marshal_with(account_fields)
    def get(self, account_id):
        account = db.session.query(Account).filter_by(id=account_id).first()
        if account:
            return account

    def post(self):
        response_object = {
            'status': 'SUCCESS',
            'message': 'Login successfully!.',
            'return_id': 0}
        args = account_parser.parse_args()
        email =  args['email']
        password =  args['password']

        if not email or not password:
            response_object['status'] = 'FAIL'
            response_object['message'] = 'Some information missing!'
            return jsonify(response_object)
        account = db.session.query(Account).filter_by(email=email).first()
        db.session.remove()
        if not account:
            response_object['status'] = 'FAIL'
            response_object['message'] = "Email doesn't exitst!"
            return jsonify(response_object)
        hash_passowrd = Account.hashing_password(self, password)
        is_right = account.check_password(password)
        if not is_right:
            response_object['status'] = 'FAIL'
            response_object['message'] = "Password doesn't match!"
            return jsonify(response_object)
        response_object['return_id'] = account.id
        return jsonify(response_object)

class SignUpResource(Resource):
    def post(self):
        response_object = {
            'status': 'SUCCESS',
            'message': 'Successfully registered.',
            'return_id': 0}

        args = account_parser.parse_args()
        print('args %s' % str(args), file=sys.stderr)
        email =  args['email']
        password =  args['password']
        password2 =  args['password2']
        user_name =  args['name']

        if not email or not password or not user_name:
            print('not email or not password or not user_name', file=sys.stderr)
            response_object['status'] = 'FAIL'
            response_object['message'] = 'Some information missing!'
            return jsonify(response_object)
        exists_email = db.session.query(Account).filter_by(email=email).first()
        if exists_email:
            print('exists_email', file=sys.stderr)
            response_object['status'] = 'FAIL'
            response_object['message'] = 'Email is existed, please choose another email'
            return jsonify(response_object)

        hash_passowrd = Account.hashing_password(self, password)
        new_account = Account(user_name, email, hash_passowrd)

        db.session.add(new_account)
        db.session.commit()
        new_id = new_account.id
        response_object['return_id'] = new_id
        db.session.remove()
        return jsonify(response_object)

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
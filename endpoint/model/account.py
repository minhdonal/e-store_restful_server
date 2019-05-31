from werkzeug.security import generate_password_hash, check_password_hash
from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()

import sys


class Account(db.Model):
    __tablename__ = 'user'

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(200))
    first_name = db.Column(db.String(200))
    last_name = db.Column(db.String(200))
    phone = db.Column(db.Integer)
    active = db.Column(db.Boolean)
    password_hash = db.Column(db.String(255))
    adress = db.Column(db.String(100))

    def __init__(self, first_name, email, password_hash, last_name=None, phone=None,  adress=None):
        self.email = email
        self.first_name = first_name
        self.password_hash = password_hash
        if last_name:
            self.last_name = name
        if phone:
            self.phone = phone
        if adress:
            self.adress = adress
        self.active = True

    @staticmethod
    def hashing_password(self, raw_password):
        return generate_password_hash(raw_password)

    def check_password(self, raw_password):
        return check_password_hash(self.password_hash, raw_password)

    def return_id(self):
        return self.id

    def __repr__(self):
        return "<User '{}'>".format(self.email)

class UserRoles(db.Model):
    __tablename__ = 'user_role'

    user_id = db.Column(db.Integer, primary_key=True)
    role_id = db.Column(db.Integer, primary_key=True)

    def __init__(self, user_id, role_id):
        self.user_id = user_id,
        self.role_id = role_id

    def __repr__(self):
        obj = {'role_id': self.role_id}
        return obj

    def return_role_id(self):
        return self.role_id

from werkzeug.security import generate_password_hash, check_password_hash
from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()


class Account(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(200))
    first_name = db.Column(db.String(200))
    last_name = db.Column(db.String(200))
    phone = db.Column(db.Integer)
    active = db.Column(db.Integer)
    password_hash = db.Column(db.String(50))

    def __init__(self, name=None):
        self.name = name

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

    def return_id(self):
        return self.id

    def __init__(self):
        res = {
            'id': self.id, 
            'email': self.email,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'phone': self.phone
        }
        return eval(res)

class UserRoles(db.Model):
    __tablename__ = 'user_roles'

    user_id = db.Column(db.Integer, primary_key=True)
    role_id = db.Column(db.Integer, primary_key=True)

    def return_role_id(self):
        return self.role_id

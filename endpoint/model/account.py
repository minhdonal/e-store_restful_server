from werkzeug.security import generate_password_hash, check_password_hash

from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()


class Account(db.Model):
    __tablename__ = 'user'

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(200))
    first_name = db.Column(db.String(200))
    last_name = db.Column(db.String(200))
    phone = db.Column(db.Integer)
    active = db.Column(db.Boolean)
    password_hash = db.Column(db.String(50))
    adress = db.Column(db.String(100))

    def __init__(self, email, first_name, last_name,
    phone, password_hash, adress):
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
        self.phone = phone
        self.adress = adress
        self.password_hash = password_hash    
        self.active = True

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

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

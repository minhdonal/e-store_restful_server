from flask import Flask, jsonify
from flask import abort
from flask import request
from flaskext.mysql import MySQL


# Config App
app = Flask(__name__)
mysql = MySQL()

# MySQL default configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'chocola_store'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
# cursor = mysql.connect().cursor()

# Routing
@app.route('/', methods = ['POST', 'GET'])
def index():
    return 'Hello World'

if __name__ == '__main__':
    app.run(debug=True)

from flask import Flask, render_template
from flask_bootstrap import Bootstrap
from flask_moment import Moment 
from datetime import datetime, UTC

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html', current_time=datetime.now(UTC))

@app.route('/user/<name>')
def user(name):
    return render_template('user.html', name=name)

bootstrap = Bootstrap(app)

@app.errorhandler(404) 
def page_not_found(e): 
    return render_template('404.html'), 404 

@app.errorhandler(500)
def internal_server_error(e): 
    return render_template('500.html'), 500

moment = Moment(app)

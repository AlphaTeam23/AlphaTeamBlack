import os
from flask import Flask

from flask import render_template, request, redirect, session

from flaskext.mysql import MySQL

from datetime import datetime

app=Flask(__name__)

app.secret_key="alphateam"

mysql=MySQL()
app.config['MYSQL_DATABASE_HOST']='localhost'
app.config['MYSQL_DATABASE_USER']='root'
app.config['MYSQL_DATABASE_PASSWORD']=''
app.config['MYSQL_DATABASE_DB']='alphateam'

mysql.init_app(app)

@app.route('/')

def iniciosesion():

    return render_template('index.html')



if __name__ == '__main__':
   
    app.run(debug=True)

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

# Página index
@app.route('/')
def iniciosesion():
   return render_template('index.html')

# Redireccionar a profesor
@app.route('/alphaTeam/profesor')
def p_alphaTeam():
    return render_template('./profesor/p_alphaTeam.html')

# Redireccionar a estudiante
@app.route('/alphaTeam/estudiante')
def e_alphaTeam():
    return render_template('./estudiante/e_alphaTeam.html')

# Redireccionar a administrador
@app.route('/alphaTeam/admin')
def a_alphaTeam():
    return render_template('./admin/a_alphaTeam.html')


@app.route('/a_alphaTeam')
def a_alphaTeam():
    print(request.path)  
    return render_template('admin/a_alphaTeam.html')

@app.route('/a_cursos')
def a_cursos():
    return render_template('admin/a_cursos.html')

@app.route('/a_inscripcion')
def a_inscripcion():
    return render_template('admin/a_inscripcion.html')

@app.route('/a_planificacion')
def a_planificacion():
    return render_template('admin/a_planificacion.html')

@app.route('/a_recordnota')
def a_recordnota():
    return render_template('admin/a_recordnota.html')

@app.route('/a_recordnota2')
def a_recordnota2():
    return render_template('admin/a_recordnota2.html')

@app.route('/a_usuarios')
def a_usuarios():
    return render_template('admin/a_usuarios.html')

if __name__ == '__main__':
   
    app.run( port = 5501, debug=True)

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

# Página Alpha Team
@app.route('/alphaTeam/profesor/calificaciones')
def p_calificaciones():
    return render_template('./profesor/p_calificaciones.html')

@app.route('/alphaTeam/profesor/ayuda')
def p_ayuda():
    return render_template('./profesor/p_ayuda.html')

@app.route('/alphaTeam/profesor/horario')
def p_horario():
    return render_template('./profesor/p_horario.html')

@app.route('/alphaTeam/profesor/planificacion')
def p_planificacion():
    return render_template('./profesor/p_cargarplanificacion.html')

@app.route('/alphaTeam/profesor/informacion')
def p_informacion():
    return render_template('./profesor/p_informacionestudiante.html')

@app.route('/alphaTeam/profesor/foto')
def p_foto():
    return render_template('./profesor/p_foto.html')

@app.route('/alphaTeam/profesor/reportar')
def p_reportar():
    return render_template('./profesor/p_reportar_problema.html')

@app.route('/alphaTeam/profesor/usuario')
def p_usuario():
    return render_template('./profesor/p_usuarioprofesor.html')

@app.route('/alphaTeam/profesor/contraseña')
def p_contraseña():
    return render_template('./profesor/p_contraseñaprofesor.html')

@app.route('/alphaTeam/templates/cerrarsesion')
def p_cerrarsesion():
    return render_template('./index.html')

    
# Redireccionar a estudiante
@app.route('/alphaTeam/estudiante')
def e_alphaTeam():
    return render_template('./estudiante/e_alphaTeam.html')

@app.route('/alphaTeam/estudiante/calificaciones')
def e_miscalificaciones():
    return render_template('./estudiante/e_miscalificaciones.html')

@app.route('/alphaTeam/estudiante/ayuda')
def e_ayuda():
    return render_template('./estudiante/e_ayuda.html')

@app.route('/alphaTeam/estudiante/reinscripcion')
def e_reinscripcion():
    return render_template('./estudiante/e_reinscripcion.html')

@app.route('/alphaTeam/estudiante/info_docente')
def e_info_docente():
    return render_template('./estudiante/e_informaciondocente.html')

@app.route('/alphaTeam/estudiante/pago')
def e_pago():
    return render_template('./estudiante/e_pago.html')

@app.route('/alphaTeam/estudiante/foto')
def e_foto():
    return render_template('./estudiante/e_foto.html')

@app.route('/alphaTeam/estudiante/contraseña')
def e_contraseña():
    return render_template('./estudiante/e_contraseña.html')

@app.route('/alphaTeam/estudiante/reporte')
def e_reporte():
    return render_template('./estudiante/e_reportarproblema.html')

@app.route('/alphaTeam/estudiante/usuario')
def e_usuario():
    return render_template('./estudiante/e_usuario.html')

@app.route('/alphaTeam/templates/cerrarsesion')
def e_cerrarsesion():
    return render_template('./index.html')

# Redireccionar a administrador
@app.route('/alphaTeam/admin')
def a_alphaTeam():
    return render_template('./admin/a_alphaTeam.html')

@app.route('/alphaTeam/admin/cursos')
def a_cursos():
    return render_template('./admin/a_cursos.html')

@app.route('/alphaTeam/admin/inscripcion')
def a_inscripcion():
    return render_template('./admin/a_inscripcion.html')

@app.route('/alphaTeam/admin/planificacion')
def a_planificacion():
    return render_template('./admin/a_planificacion.html')

@app.route('/alphaTeam/admin/recordnota')
def a_recordnota():
    return render_template('./admin/a_recordnota.html')

@app.route('/alphaTeam/admin/recordnota2')
def a_recordnota2():
    return render_template('./admin/a_recordnota2.html')

@app.route('/alphaTeam/admin/usuarios')
def a_usuarios():
    return render_template('./admin/a_usuarios.html')

@app.route('/alphaTeam/templates/cerrarsesion')
def p_cerrar():
    session.clear()
    return redirect('./index.html')



if __name__ == '__main__':
    app.run( port = 5501, debug=True)

import os
from flask import Flask
from flask import render_template, request,  url_for, redirect, session
from flaskext.mysql import MySQL
from datetime import datetime

app=Flask(__name__)
app.secret_key="alphateam"

mysql=MySQL()
app.config['MYSQL_DATABASE_HOST']='localhost'
app.config['MYSQL_DATABASE_USER']='root'
app.config['MYSQL_DATABASE_PASSWORD']=''
app.config['MYSQL_DATABASE_DB']='alphateam'

# Iniciar mysql
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
@app.route('/alphaTeam/profesor/calificaciones', methods=['GET', 'POST'])
def p_calificaciones():
    curso_id = None
    estudiantes = []
    
    if request.method == 'POST':
        action = request.form.get('action')
        if action == 'CARGAR':
            curso_id = request.form.get('cur')
            if not curso_id:
                return "No se proporcionó un ID de curso", 400
            
            # Obtener los estudiantes que pertenecen al curso seleccionado
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute("""
                SELECT e.nombre_estudiante, e.apellidos, e.id_estudiante,
                       c.tareas, c.examenes, c.participacion, c.asistencia, c.cali_final
                FROM estudiante e
                LEFT JOIN calificaciones c ON e.id_estudiante = c.id_estudiante
                WHERE e.id_curso = %s
            """, (curso_id,))
            estudiantes = cursor.fetchall()
            cursor.close()
            conn.close()

        elif action == 'Publicar Notas':
            # Actualizar las calificaciones en la base de datos
            conn = mysql.connect()
            cursor = conn.cursor()
            estudiantes_ids = request.form.getlist('estudiante_id')

            for estudiante_id in estudiantes_ids:
                tareas = request.form.get(f'tareas_{estudiante_id}')
                examenes = request.form.get(f'examenes_{estudiante_id}')
                participacion = request.form.get(f'participacion_{estudiante_id}')
                asistencia = request.form.get(f'asistencia_{estudiante_id}')
                cali_final = request.form.get(f'cali_final_{estudiante_id}')

                cursor.execute("""
                    UPDATE calificaciones
                    SET tareas = %s, examenes = %s, participacion = %s, asistencia = %s, cali_final = %s
                    WHERE id_estudiante = %s
                """, (tareas, examenes, participacion, asistencia, cali_final, estudiante_id))

            conn.commit()
            cursor.close()
            conn.close()

            return redirect(url_for('p_calificaciones'))
    
    # Renderizar el formulario con el curso seleccionado (si existe)
    return render_template('./profesor/p_calificaciones.html', estudiantes=estudiantes, selected_curso=curso_id)





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

@app.route('/alphaTeam/estudiante/e_informaciondocente')
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

@app.route('/alphaTeam/admin/cursos', methods=['GET'])
def a_cursos():

    # Consulta a la base de datos


    conn = mysql.connect() 
    cursor = conn.cursor()  
    cursor.execute("SELECT id_curso, nivel, total_est FROM cursos")  
    data = cursor.fetchall()  
    cursor.close()  
    conn.close()  

    return render_template('./admin/a_cursos.html')

@app.route('/alphaTeam/admin/inscripcion')
def a_inscripcion():
    return render_template('./admin/a_inscripcion.html')

@app.route('/alphaTeam/admin/inscripcion', methods=['GET', 'POST'])
def inscripcion():
    if request.method == 'POST':
        # Procesar el formulario
        nom = request.form['nom']
        ape = request.form['ape']
        sexo = request.form['sexo']
        fecha = request.form['fecha']
        curso = request.form['curso']
        prof = request.form['prof']
        nomt = request.form['nomt']
        apet = request.form['apet']
        cedula = request.form['cedula']
        telefono = request.form['telefono']
        correo = request.form['correo']
        educ = request.form['educ']
        ocup = request.form['ocup']
        direccion = request.form['direccion']
        #foto = request.files['foto']

        # Create a connection to the database
        conn = mysql.connect()
        cursor = conn.cursor()

        # INsercion de datos entabla estudiante
        cursor.execute("INSERT INTO estudiante (nombre_estudiante, apellidop_estudiante, sexo_estudinate, nacimiento_estudiante, id_curso, id_profesor, id_tutor) VALUES (%s, %s, %s, %s, %s, %s, %s)", (nom, ape, sexo, fecha, curso, prof, 1))
      


        #NOTAS: debo buscar la for
        # INsercion de datos entabla tutor
        cursor.execute("INSERT INTO tutor (nombre, apellidos, cedula, telefono, correo, ocupacion, parentesco, direccion) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)", (nomt, apet, cedula, telefono, correo, educ, ocup, direccion))
        


        # GUardar cambios
        conn.commit()

        # cerrar conexion
        cursor.close()
        conn.close()

        return "Inscripción guardada con éxito"
    return render_template('inscripcion.html')
        
     

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

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
    asignatura_id = None
    periodo = None
    estudiantes = []

    if request.method == 'POST':
        action = request.form.get('action')

        if action == 'CARGAR':
            curso_id = request.form.get('cur')
            asignatura_id = request.form.get('asig')
            periodo = request.form.get('period')

            if not curso_id or not asignatura_id or not periodo:
                return "No se proporcionaron todos los datos necesarios", 404

            # Obtener los estudiantes que pertenecen al curso y asignatura seleccionados
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute("""
                SELECT DISTINCT e.nombre_estudiante, e.apellidos, e.id_estudiante, e.id_Matricula,
                       IFNULL(c.tareas, 0), IFNULL(c.examenes, 0), IFNULL(c.participacion, 0), IFNULL(c.asistencia, 0), IFNULL(c.cali_final, 0)
                FROM estudiante e
                LEFT JOIN calificaciones c ON e.id_estudiante = c.id_estudiante AND c.id_asignatura = %s
                WHERE e.id_curso = %s
            """, (asignatura_id, curso_id))

            estudiantes = cursor.fetchall()
            cursor.close()
            conn.close()

        elif action == 'Publicar Notas':
            conn = mysql.connect()
            cursor = conn.cursor()
            asignatura_id = request.form.get('asig')
            periodo = request.form.get('period')

            if not asignatura_id or not periodo:
                return "No se proporcionaron todos los datos necesarios", 404

            estudiantes_ids = [key.split('_')[2] for key in request.form.keys() if key.startswith('estudiante_id_')]
            # keys() devuelve una vista de las claves (nombres de campos) del formulario como una lista
            # startswith verifica si la clave comienza con el la cadena estudiante_id
            # divide la clave en una lista de subcadenas, usando el carácter de subrayado ('_') como delimitador para identificar el id del estudiante

            # reacion de los periodos a las columnas de la tabla calificacion_final
            periodo_column_map = {
                '1': 'primer_periodo',
                '2': 'segundo_periodo',
                '3': 'tercer_periodo',
                '4': 'cuarto_periodo',
                '5': 'completivo',
                '6': 'extraordinario',
                '7': 'final'
            }

            periodo_column = periodo_column_map.get(periodo)

            for estudiante_id in estudiantes_ids:
                tareas = request.form.get(f'tareas_{estudiante_id}_{asignatura_id}', 0)
                examenes = request.form.get(f'examenes_{estudiante_id}_{asignatura_id}', 0)
                participacion = request.form.get(f'participacion_{estudiante_id}_{asignatura_id}', 0)
                asistencia = request.form.get(f'asistencia_{estudiante_id}_{asignatura_id}', 0)
                cali_final = request.form.get(f'cali_final_{estudiante_id}_{asignatura_id}', 0)

                # Actualizar en la tabla `calificaciones`
                cursor.execute("""
                    UPDATE calificaciones
                    SET tareas = %s,
                        examenes = %s,
                        participacion = %s,
                        asistencia = %s,
                        cali_final = %s
                    WHERE id_asignatura = %s AND id_estudiante = %s
                """, (tareas, examenes, participacion, asistencia, cali_final, asignatura_id, estudiante_id))

                # Actualizar en la tabla `calificacion_final`
                cursor.execute("""
                    UPDATE calificacion_final
                    SET {periodo_column} = %s
                    WHERE id_asignatura = %s AND id_estudiante = %s
                """.format(periodo_column=periodo_column), (cali_final, asignatura_id, estudiante_id))

            conn.commit()
            cursor.close()
            conn.close()

            return redirect(url_for('p_calificaciones'))

    return render_template('./profesor/p_calificaciones.html', estudiantes=estudiantes, selected_curso=curso_id, selected_asignatura=asignatura_id, selected_periodo=periodo)



@app.route('/alphaTeam/profesor/ayuda')
def p_ayuda():
    return render_template('./profesor/p_ayuda.html')

@app.route('/alphaTeam/profesor/horario')
def p_horario():
    return render_template('./profesor/p_horario.html')

@app.route('/alphaTeam/profesor/planificacion')
def p_planificacion():
    return render_template('./profesor/p_cargarplanificacion.html')

@app.route('/alphaTeam/profesor/informacion', methods=['GET', 'POST'])
def p_informacion():
    estudiantes = []
    selected_curso = None
    selected_asignatura = None

    if request.method == 'POST':
        curso_id = request.form.get('curL')
        asignatura_id = request.form.get('asigL')

        if not curso_id or not asignatura_id:
            return "No se proporcionaron todos los datos necesarios", 404

        # Consultar los estudiantes que pertenecen al curso y asignatura seleccionados
        conn = mysql.connect()
        cursor = conn.cursor()
        
        # Consulta para obtener estudiantes junto con la información del tutor
        query = """
        SELECT *, tutor.nombre AS tnombre FROM estudiante JOIN tutor ON tutor.id_tutor = estudiante.id_tutor
        WHERE id_curso = %s
        """
        
        cursor.execute(query, (curso_id,))
        estudiantes = cursor.fetchall()

        cursor.close()
        conn.close()
        
        selected_curso = curso_id
        selected_asignatura = asignatura_id

    return render_template('./profesor/p_informacionestudiante.html',
                           estudiantes=estudiantes,
                           selected_curso=selected_curso,
                           selected_asignatura=selected_asignatura)


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
    conn = mysql.get_db()
    cursor = conn.cursor()

    # Consulta SQL para obtener las calificaciones
    query = '''
        SELECT a.nom_asignatura, 
               c.primer_periodo, 
               c.segundo_periodo, 
               c.tercer_periodo, 
               c.cuarto_periodo, 
               c.completivo, 
               c.extraordinario, 
               c.final
        FROM calificacion_final c
        JOIN asignatura a ON c.id_asignatura = a.id_asignatura
        WHERE c.id_estudiante = %s
    '''
    estudiante_id = 1  # Cambia esto al ID del estudiante actual
    cursor.execute(query, (estudiante_id,))
    calificaciones = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('estudiante/e_miscalificaciones.html', calificaciones=calificaciones)

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

@app.route('/alphaTeam/admin/cursos', methods=['GET', 'POST'])
def a_cursos():
    # Conectar a la base de datos
    conn = mysql.connect()
    cursor = conn.cursor()

    # Actualizar la columna total_est en la tabla cursos
    update_query = """
    UPDATE cursos c
    SET c.total_est = (
        SELECT COUNT(*)
        FROM estudiante e
        WHERE e.id_curso = c.id_curso
    );
    """
    cursor.execute(update_query)
    conn.commit()  

    # Recuperar los datos actualizados de la tabla cursos
    cursor.execute("SELECT * FROM cursos")
    cursos = cursor.fetchall()

    # Cerrar el cursor y la conexión
    cursor.close()
    conn.close()

    # Pasar los datos a la plantilla
    return render_template('./admin/a_cursos.html', cursos=cursos)

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
        cursor.execute("INSERT INTO estudiante (nombre_estudiante, apellidos, sexo_estudiante, nacimiento_estudiante, id_curso, id_profesor, id_tutor) VALUES (%s, %s, %s, %s, %s, %s, %s)", (nom, ape, sexo, fecha, curso, prof, 1))
      


    
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

    conn = mysql.connect() 
    cursor = conn.cursor()  
    cursor.execute("SELECT * FROM planificacion")  
    planificacion = cursor.fetchall()  
    cursor.close()  
    conn.close()  

    return render_template('./admin/a_planificacion.html', planificacion = planificacion)

@app.route('/alphaTeam/admin/recordnota')
def a_recordnota():

    conn = mysql.connect() 
    cursor = conn.cursor()  
    cursor.execute("SELECT *, asignatura.nom_asignatura AS anom_asignatura FROM calificacion_final JOIN asignatura ON asignatura.id_asignatura = calificacion_final.id_asignatura")  
    calificaciones = cursor.fetchall() 
    cursor.close()  
    conn.close()  

    return render_template('./admin/a_recordnota.html', calificaciones = calificaciones)

@app.route('/alphaTeam/admin/recordnota2')
def a_recordnota2():
    return render_template('./admin/a_recordnota2.html')

@app.route('/alphaTeam/admin/usuarios')
def a_usuarios():
    
    conn = mysql.connect() 
    cursor = conn.cursor()  
    cursor.execute("SELECT * FROM usuarios")  
    usuario = cursor.fetchall()  
    cursor.close()  
    conn.close()
    
    
    
    
    return render_template('./admin/a_usuarios.html', usuario = usuario)

@app.route('/alphaTeam/admin/estudiantes', methods=['GET', 'POST'])
def a_estudiantes():
    
    conn = mysql.connect() 
    cursor = conn.cursor()  
    cursor.execute("SELECT *, tutor.nombre AS tnombre FROM estudiante JOIN tutor ON tutor.id_tutor = estudiante.id_tutor")  
    estudiantes = cursor.fetchall() 
    cursor.close()  
    conn.close() 
    return render_template('./admin/a_estudiantes.html', estudiantes = estudiantes)

@app.route('/alphaTeam/templates/cerrarsesion')
def p_cerrar():
    session.clear()
    return redirect('./index.html')




if __name__ == '__main__':
    app.run( port = 5501, debug=True)

# Incluir el framework Flask
import os
from flask import Flask

# Importar la pantilla html. para guardar datos desde el formulario importamos request, redirect y session (variable de sesion)
from flask import render_template, request,  url_for, redirect, session

# Importar el enlace a base de datos MySQL
from flaskext.mysql import MySQL

# Importar controlador del tiempo
from datetime import datetime

from werkzeug.utils import secure_filename


app=Flask(__name__)
app.secret_key="alphateam"

mysql=MySQL()
app.config['MYSQL_DATABASE_HOST']='localhost'
app.config['MYSQL_DATABASE_USER']='root'
app.config['MYSQL_DATABASE_PASSWORD']=''
app.config['MYSQL_DATABASE_DB']='alphateam'

# Iniciar mysql
mysql.init_app(app)


@app.route('/')
def iniciosesion():
    session.clear()
    return render_template('index.html', mensaje=None)

@app.route('/sesion', methods=['POST'])
def sesion():
    matricula = request.form['matricula']
    password = request.form['contraseña']

    conn = mysql.connect()
    cursor = conn.cursor()

    # LOGIN PROFESOR
    cursor.execute('SELECT * FROM profesores WHERE matricula = %s', (matricula,))
    profesor = cursor.fetchone()

    if profesor and profesor[11] == password:
        session['usuario_id'] = profesor[0]
        session['role'] = 'profesor'
        cursor.close()
        conn.close()
        return redirect('/alphaTeam/profesor')

    # LOGIN ESTUDIANTE
    cursor.execute('SELECT * FROM estudiante WHERE matricula = %s', (matricula,))
    estudiante = cursor.fetchone()

    if estudiante and estudiante[7] == password:
        session['usuario_id'] = estudiante[0]
        session['role'] = 'estudiante'
        cursor.close()
        conn.close()
        return redirect('/alphaTeam/estudiante')
    
    # LOGIN ADMINISTRADOR 
    cursor.execute('SELECT * FROM administrador WHERE matricula = %s', (matricula,))
    administrador = cursor.fetchone()

    if administrador and administrador[10] == password:
        session['usuario_id'] = administrador[0]
        session['role'] = 'administrador'
        cursor.close()
        conn.close()
        return redirect('/alphaTeam/admin')

    # Usuario o contraseña incorrectos
    cursor.close()
    conn.close()
    # Redirigir al inicio de sesión con mensaje de error
    return render_template('index.html', mensaje='Matrícula/Contraseña inválida')

# Redireccionar a profesor
@app.route('/alphaTeam/profesor')
def p_alphaTeam():
    return render_template('./profesor/p_alphaTeam.html')

# Página Calificaciones 
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
                SELECT DISTINCT e.nombre_estudiante, e.apellidos, e.id_estudiante, e.matricula,
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

@app.route('/alphaTeam/profesor/planificacion', methods=['GET', 'POST'])
def p_planificacion():
    conn = mysql.connect()
    cursor = conn.cursor()

    if request.method == 'POST':
        # Obtener los datos del formulario
        curso = request.form['curso1']
        asignatura = request.form['asigL']
        periodo = request.form['period']
        archivo = request.files['planificacion']

        # Guardar el archivo en el servidor dentro de la carpeta static/uploads
        if archivo:
            upload_folder = os.path.join('static', 'uploads')
            if not os.path.exists(upload_folder):
                os.makedirs(upload_folder)
            
            archivo_path = os.path.join(upload_folder, archivo.filename)
            archivo.save(archivo_path)

            # Guardar información en la base de datos
            cursor.execute("""
                INSERT INTO planificacion (id_curso, id_asignatura, periodo, archivo) 
                VALUES (%s, %s, %s, %s)
            """, (curso, asignatura, periodo, archivo.filename))
            conn.commit()

            # Redirigir al usuario para evitar duplicaciones
            cursor.close()
            conn.close()
            return redirect(url_for('p_planificacion'))

    # Obtener los datos de la base de datos para mostrar
    cursor.execute("""
        SELECT p.id_curso, c.nivel, p.id_asignatura, a.nom_asignatura, p.periodo, p.archivo
        FROM planificacion p
        JOIN cursos c ON p.id_curso = c.id_curso
        JOIN asignatura a ON p.id_asignatura = a.id_asignatura
    """)
    planificaciones = cursor.fetchall()
    cursor.close()
    conn.close()

    return render_template('./profesor/p_cargarplanificacion.html', planificaciones=planificaciones)



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

@app.route('/alphaTeam/profesor/usuario', methods=['GET'])
def p_profesor():
    if 'usuario_id' not in session:
        return redirect(url_for('login'))

    usuario_id = session['usuario_id']

    conn = mysql.connect()
    cursor = conn.cursor()
    query = """
        SELECT nombre, apellidos, correo, direccion, imagen_perfil
        FROM profesores
        WHERE id_profesor = %s
    """
    cursor.execute(query, (usuario_id,))
    profesor = cursor.fetchone()
    cursor.close()
    conn.close()

    if profesor:
        profesor_dict = {
            'nombre': profesor[0],
            'apellidos': profesor[1],
            'correo': profesor[2],
            'direccion': profesor[3],
            'imagen_perfil': profesor[4]
        }
        return render_template('./profesor/p_usuarioprofesor.html', profesor=profesor_dict)
    else:
        return render_template('p_usuarioprofesor.html', profesor=None)


UPLOAD_FOLDER = 'static/upload_image'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/upload_image', methods=['POST'])
def upload_image():
    if 'usuario_id' not in session:
        return redirect(url_for('login'))

    file = request.files.get('image')
    if not file:
        return redirect(url_for('p_profesor', error='No se ha seleccionado ningún archivo'))

    if file.filename == '':
        return redirect(url_for('p_profesor', error='No se ha seleccionado ningún archivo'))

    filename = secure_filename(file.filename)
    file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    file.save(file_path)

    # Verificar si el archivo se guardó correctamente
    if not os.path.isfile(file_path):
        return redirect(url_for('p_profesor', error='Error al guardar el archivo'))

    # Inserta la ruta de la imagen en la base de datos
    usuario_id = session['usuario_id']
    conn = mysql.connect()
    cursor = conn.cursor()

    # Actualiza la base de datos con el nombre del archivo
    cursor.execute('UPDATE profesores SET imagen_perfil = %s WHERE id_profesor = %s', (filename, usuario_id))
    conn.commit()

    cursor.close()
    conn.close()

    return redirect(url_for('p_profesor'))

@app.route('/alphaTeam/profesor/contraseña', methods=['GET', 'POST'])
def p_contraseña():
    mensaje = None
    if request.method == 'POST':
        old_password = request.form['oldPassword']
        new_password = request.form['newPassword']
        confirm_password = request.form['confirmPassword']

        # Verificar si las contraseñas nuevas coinciden
        if new_password != confirm_password:
            mensaje = "Las contraseñas nuevas no coinciden"
            return render_template('./profesor/p_contraseñaprofesor.html', mensaje=mensaje)

        # Conectar a la base de datos
        conn = mysql.connect()
        cursor = conn.cursor()

        # Verificar la contraseña actual
        cursor.execute('SELECT contraseña FROM profesores WHERE id_profesor = %s', (session['usuario_id'],))
        profesor = cursor.fetchone()

        if profesor and profesor[0] == old_password:
            # Actualizar la contraseña en la base de datos
            cursor.execute('UPDATE profesores SET contraseña = %s WHERE id_profesor = %s', (new_password, session['usuario_id']))
            conn.commit()
            mensaje = "Contraseña cambiada exitosamente"
        else:
            mensaje = "La contraseña antigua es incorrecta"

        cursor.close()
        conn.close()

        return render_template('./profesor/p_contraseñaprofesor.html', mensaje=mensaje)

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
    estudiante_id = session.get('usuario_id')  

    if not estudiante_id:
        return "No se ha encontrado el ID del estudiante en la sesión", 404

   
    conn = mysql.get_db()
    cursor = conn.cursor()

    
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
    
    cursor.execute(query, (estudiante_id,))
    calificaciones = cursor.fetchall()

    cursor.close()

    return render_template('estudiante/e_miscalificaciones.html', calificaciones=calificaciones)


@app.route('/alphaTeam/estudiante/ayuda')
def e_ayuda():
    return render_template('./estudiante/e_ayuda.html')

@app.route('/alphaTeam/estudiante/reinscripcion', methods=['GET', 'POST'])
def e_reinscripcion():
    id_estudiante = session.get('usuario_id') 

    conn = mysql.connect()
    cursor = conn.cursor()

    if request.method == 'POST':
        # Recoger los datos del formulario
        direccion = request.form.get('direccion')
        telefono = request.form.get('telefono')
        correo = request.form.get('correo')

        # Actualizar la información en la base de datos
        cursor.execute("""
            UPDATE tutor t
            JOIN estudiante e ON t.id_tutor = e.id_tutor
            SET t.direccion = %s, t.telefono = %s, t.correo = %s
            WHERE e.id_estudiante = %s
        """, (direccion, telefono, correo, id_estudiante))

        conn.commit()  

    # Obtener los datos del estudiante para mostrarlos en el formulario
    cursor.execute("""
        SELECT e.nombre_estudiante, e.apellidos, e.sexo_estudiante, e.nacimiento_estudiante,
               t.telefono, t.parentesco, t.direccion, t.correo
        FROM estudiante e
        JOIN tutor t ON e.id_tutor = t.id_tutor
        WHERE e.id_estudiante = %s
    """, (id_estudiante,))
    
    estudiante = cursor.fetchone()
    cursor.close()
    conn.close()

    if estudiante:
        # Si la consulta devolvió resultados, continuamos
        return render_template('./estudiante/e_reinscripcion.html', estudiante=estudiante)
    else:
        # Si no se encontró al estudiante, podrías redirigir o mostrar un error
        return "Estudiante no encontrado", 404






@app.route('/alphaTeam/estudiante/e_informaciondocente')
def e_info_docente():
    return render_template('./estudiante/e_informaciondocente.html')

@app.route('/alphaTeam/estudiante/pago')
def e_pago():
    return render_template('./estudiante/e_pago.html')

@app.route('/alphaTeam/estudiante/foto')
def e_foto():
    return render_template('./estudiante/e_foto.html')



@app.route('/alphaTeam/estudiante/contraseña', methods=['GET', 'POST'])
def e_contraseña():
    message = None

    if request.method == 'POST':
        old_password = request.form.get('oldPassword')
        new_password = request.form.get('newPassword')
        confirm_password = request.form.get('confirmPassword')

        student_id = session.get('usuario_id', None)

        if student_id is None:
            return redirect(url_for('index'))

        if new_password != confirm_password:
            message = 'Las contraseñas nuevas no coinciden.'
        else:
            connection = mysql.connect()
            cursor = connection.cursor()

            # Obtiene la contraseña actual del estudiante
            cursor.execute('SELECT contraseña FROM estudiante WHERE id_estudiante = %s', (student_id,))
            student = cursor.fetchone()

            if student:
                current_password = student[0]
                if old_password == current_password:
                    # Actualiza la contraseña en la base de datos
                    cursor.execute('UPDATE estudiante SET contraseña = %s WHERE id_estudiante = %s', (new_password, student_id))
                    connection.commit()
                    message = 'Contraseña actualizada exitosamente.'
                else:
                    message = '.'
            else:
                message = 'Estudiante no encontrado.'

            cursor.close()
            connection.close()

    return render_template('./estudiante/e_contraseña.html', message=message)









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
        contraseña = '12345'  # Valor predeterminado para la contraseña

        # Crear una conexión a la base de datos
        conn = mysql.connect()
        cursor = conn.cursor()

        # Inserción de datos en la tabla estudiante
        cursor.execute("""
            INSERT INTO estudiante (nombre_estudiante, apellidos, sexo_estudiante, nacimiento_estudiante, id_curso, id_profesor, id_tutor, contraseña)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """, (nom, ape, sexo, fecha, curso, prof, 1, contraseña))

        # Obtener el ID del estudiante recién insertado
        id_estudiante = cursor.lastrowid

        # Generar la matrícula en el formato E-XXXXX
        matricula = f'E-{id_estudiante:05d}'

        # Actualizar el registro del estudiante con la matrícula generada
        cursor.execute("""
            UPDATE estudiante
            SET matricula = %s
            WHERE id_estudiante = %s
        """, (matricula, id_estudiante))

        # Inserción de datos en la tabla tutor
        cursor.execute("""
            INSERT INTO tutor (nombre, apellidos, cedula, telefono, correo, ocupacion, parentesco, direccion)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """, (nomt, apet, cedula, telefono, correo, educ, ocup, direccion))

        # Guardar cambios
        conn.commit()

        # Cerrar conexión
        cursor.close()
        conn.close()

        return f"Inscripción guardada con éxito. Matrícula: {matricula}, Contraseña: {contraseña}"
    return render_template('inscripcion.html')

        
     

@app.route('/alphaTeam/admin/planificacion')
def a_planificacion():

    conn = mysql.connect() 
    cursor = conn.cursor()  
    cursor.execute("SELECT p.id_curso, c.nivel, p.id_asignatura, a.nom_asignatura, p.periodo, p.archivo FROM planificacion p JOIN cursos c ON p.id_curso = c.id_curso JOIN asignatura a ON p.id_asignatura = a.id_asignatura")  
    planificacion = cursor.fetchall()  
    cursor.close()  
    conn.close()  

    return render_template('./admin/a_planificacion.html', planificacion = planificacion)


@app.route('/alphaTeam/admin/recordnota', methods=['GET', 'POST'])
def a_recordnota():
    calificaciones = []
    estudiante = None
    if request.method == 'POST':
        id_estudiante = request.form.get('busqueda')  # Obtener valor de 'busqueda'

        conn = mysql.connect()
        cursor = conn.cursor()

        # Obtener información del estudiante
        cursor.execute("""
            SELECT *
            FROM estudiante
            WHERE id_estudiante = %s
        """, (id_estudiante,))
        estudiante = cursor.fetchone()

        # Obtener calificaciones y asignaturas
        cursor.execute("""
            SELECT calificacion_final.*, asignatura.nom_asignatura AS anom_asignatura
            FROM calificacion_final
            JOIN asignatura ON asignatura.id_asignatura = calificacion_final.id_asignatura
            WHERE calificacion_final.id_estudiante = %s
        """, (id_estudiante,))
        calificaciones = cursor.fetchall()

        cursor.close()
        conn.close()

    return render_template('./admin/a_recordnota.html', calificaciones=calificaciones, estudiante=estudiante)







@app.route('/alphaTeam/admin/usuarios', methods=['GET', 'POST'])
def a_usuarios():
    
    usuario = []
    if request.method == 'POST':
        id_usuario = request.form.get('busqueda')  # Buscar ahora por ID
        tipo_usuario = request.form.get('period')

        conn = mysql.connect()
        cursor = conn.cursor()

        if tipo_usuario == '1':  # Administrador "
            cursor.execute("""
                SELECT matricula, nombre, apellidos 
                FROM administrador 
                WHERE id_administrador = %s
            """, (id_usuario,))
        elif tipo_usuario == '2':  # Profesor
            cursor.execute("""
                SELECT matricula, nombre, apellidos 
                FROM profesores 
                WHERE id_profesor = %s
            """, (id_usuario,))
        elif tipo_usuario == '3':  # Estudiante
            cursor.execute("""
                SELECT matricula, nombre_estudiante, apellidos
                FROM estudiante 
                WHERE id_estudiante = %s
            """, (id_usuario,))

        usuario = cursor.fetchall()

        cursor.close()
        conn.close()
    
    return render_template('./admin/a_usuarios.html', usuario=usuario)


@app.route('/alphaTeam/admin/estudiantes', methods=['GET', 'POST'])
def a_estudiantes():
    
    conn = mysql.connect() 
    cursor = conn.cursor()  
    cursor.execute("SELECT *, tutor.nombre AS tnombre FROM estudiante JOIN tutor ON tutor.id_tutor = estudiante.id_tutor")  
    estudiantes = cursor.fetchall() 
    cursor.close()  
    conn.close() 
    return render_template('./admin/a_estudiantes.html', estudiantes = estudiantes)

@app.route('/alphaTeam/admin/crearusuarios', methods=['GET', 'POST'])
def a_crearusuarios():
    if request.method == 'POST':
        # Procesar el formulario
        id_asignatura = request.form.get('materia')
        nombre = request.form.get('nomt')
        apellidos = request.form.get('apet')
        cedula = request.form.get('cedula', '')
        telefono = request.form.get('telefono', '')
        correo = request.form.get('correo', '')
        fecha_nacimiento = request.form.get('nacimiento', '')
        direccion = request.form.get('direccion')
        contraseña = request.form.get('contraseña', '12345')  # Valor predeterminado para la contraseña
        tipo_usuario = request.form.get('tipousuario')

        if not all([nombre, apellidos, tipo_usuario]):  # Validar campos esenciales
            return "Faltan campos requeridos.", 400

        # Crear una conexión a la base de datos
        conn = mysql.connect()
        cursor = conn.cursor()

        # Obtener el último ID de usuario para generar la matrícula
        if tipo_usuario == 'administrador':
            cursor.execute('SELECT MAX(id_administrador) FROM administrador')
            last_id = cursor.fetchone()[0]
            next_id = 1 if last_id is None else last_id + 1
            matricula = f'A-{next_id:05d}'
            cursor.execute('''
                INSERT INTO administrador (matricula, nombre, apellidos, cedula, telefono, correo, fecha_nacimiento, direccion, contraseña)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            ''', (matricula, nombre, apellidos, cedula, telefono, correo, fecha_nacimiento, direccion, contraseña))
        
        elif tipo_usuario == 'profesor':
            cursor.execute('SELECT MAX(id_profesor) FROM profesores')
            last_id = cursor.fetchone()[0]
            next_id = 1 if last_id is None else last_id + 1
            matricula = f'P-{next_id:05d}'
            cursor.execute('''
                INSERT INTO profesores (matricula, nombre, apellidos, cedula, telefono, correo, fecha_nacimiento, direccion, contraseña, id_asignatura)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            ''', (matricula, nombre, apellidos, cedula, telefono, correo, fecha_nacimiento, direccion, contraseña, id_asignatura))
        
        else:
            return "Tipo de usuario no válido.", 400

        # Guardar cambios
        conn.commit()
        conn.close()

        return f"Usuario creado con éxito. Matrícula: {matricula}"

    return render_template('admin/a_crearusuario.html')


    
@app.route('/alphaTeam/templates/cerrarsesion')
def p_cerrar():
    session.clear()
    return redirect('./index.html')




if __name__ == '__main__':
    app.run( port = 5501, debug=True)

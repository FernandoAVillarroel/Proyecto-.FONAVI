from flask import Flask, render_template, request, redirect, url_for, session
import mysql.connector
import os
from dotenv import load_dotenv

app = Flask(__name__)
app.secret_key = 'clave_secreta_segura'  # Necesaria para sesiones

load_dotenv()

# Conexión a la base de datos
db = mysql.connector.connect(
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    database=os.getenv("DB_NAME")
)

@app.route('/')
def home():
    return render_template("home.html")

@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')

    cursor = db.cursor(dictionary=True)
    query = "SELECT * FROM Usuario WHERE Nombre = %s AND Contraseña = %s"
    cursor.execute(query, (username, password))
    user = cursor.fetchone()
    cursor.close()

    if user:
        session["usuario"] = user["Nombre"]
        session["tipo"] = user["Tipo"]

        if user["Tipo"].lower() == "admin":
            return redirect(url_for('admin_panel'))
        else:
            return redirect(url_for('empleado_panel'))
    else:
        return "Credenciales incorrectas", 401
    
@app.route('/admin')
def admin_panel():
    if session.get("tipo") != "Admin":
        return "Acceso no autorizado", 403

    cursor = db.cursor(dictionary=True)
    query = """
    SELECT 
        e.Orden, 
        e.Apellido, 
        e.Nombre, 
        e.DNI, 
        e.CUIL, 
        e.Situacion,
        e.Numero_cuenta,
        o.Nombre AS Oficina,
        d.Fecha_ingreso, 
        d.Antiguedad,
        d.Funcion, 
        d.Titulo, 
        t.Porcentaje AS Porcentaje_titulo,
        c.Nivel_basico
    FROM Empleado e
    JOIN Oficina o ON e.Oficina = o.Id_oficina
    JOIN Detalles d ON e.Orden = d.Orden
    JOIN Titulos t ON d.Titulo = t.Nombre
    JOIN Categorias c ON d.Funcion = c.Nombre
    ORDER BY e.Orden ASC
    """
    cursor.execute(query)
    empleados = cursor.fetchall()
    cursor.close()

    return render_template("admin.html", usuario=session.get("usuario"), empleados=empleados)



@app.route('/empleado')
def empleado_panel():
    return render_template("empleado.html", usuario=session.get("usuario"))

@app.route('/agregar-empleado', methods=['GET', 'POST'])
def agregar_empleado():
    if session.get("tipo") != "Admin":
        return "Acceso no autorizado", 403

    if request.method == 'POST':
        apellido = request.form['apellido']
        nombre = request.form['nombre']
        dni = request.form['dni']
        cuil = request.form['cuil']
        situacion = request.form['situacion']
        cuenta = request.form['cuenta']
        oficina = request.form['oficina']
        id_usuario = request.form['id_usuario']

        cursor = db.cursor()
        query = """
            INSERT INTO Empleado (Apellido, Nombre, DNI, CUIL, Situacion, Numero_cuenta, Oficina, Id_usuario)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(query, (apellido, nombre, dni, cuil, situacion, cuenta, oficina, id_usuario))
        db.commit()
        cursor.close()

        return redirect(url_for('admin_panel'))

    return render_template("agregar_empleado.html")


@app.route('/eliminar-empleado/<int:orden>')
def eliminar_empleado(orden):
    if session.get("tipo") != "Admin":
        return "Acceso no autorizado", 403

    cursor = db.cursor()
    cursor.execute("DELETE FROM Empleado WHERE Orden = %s", (orden,))
    db.commit()
    cursor.close()

    return redirect(url_for('admin_panel'))

@app.route('/editar-empleado/<int:orden>', methods=['GET', 'POST'])
def editar_empleado(orden):
    if session.get("tipo") != "Admin":
        return "Acceso no autorizado", 403

    cursor = db.cursor(dictionary=True)

    if request.method == 'POST':
        apellido = request.form['apellido']
        nombre = request.form['nombre']
        dni = request.form['dni']
        cuil = request.form['cuil']
        situacion = request.form['situacion']
        cuenta = request.form['cuenta']

        cursor.execute("""
            UPDATE Empleado SET Apellido=%s, Nombre=%s, DNI=%s, CUIL=%s, Situacion=%s, Numero_cuenta=%s
            WHERE Orden=%s
        """, (apellido, nombre, dni, cuil, situacion, cuenta, orden))
        db.commit()
        cursor.close()

        return redirect(url_for('admin_panel'))

    cursor.execute("SELECT * FROM Empleado WHERE Orden = %s", (orden,))
    empleado = cursor.fetchone()
    cursor.close()

    return render_template("editar_empleado.html", empleado=empleado)


@app.route('/oficinas')
def listar_oficinas():
    if session.get("tipo") != "Admin":
        return "Acceso no autorizado", 403

    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Oficina")
    oficinas = cursor.fetchall()
    cursor.close()

    return render_template("oficinas.html", usuario=session.get("usuario"), oficinas=oficinas)

# Mostrar formulario para nueva oficina
@app.route('/oficina/nueva')
def nueva_oficina():
    if session.get("tipo") != "Admin":
        return "Acceso no autorizado", 403
    return render_template("nueva_oficina.html")

# Guardar nueva oficina en la BD
@app.route('/oficina/guardar', methods=['POST'])
def guardar_oficina():
    nombre = request.form.get('nombre')

    cursor = db.cursor()
    query = "INSERT INTO Oficina (Nombre) VALUES (%s)"
    cursor.execute(query, (nombre,))
    db.commit()
    cursor.close()

    return redirect(url_for('oficina_panel'))

@app.route('/alta_oficina', methods=['GET', 'POST'])
def alta_oficina():
    if session.get("tipo") != "Admin":
        return "Acceso no autorizado", 403

    if request.method == 'POST':
        nombre = request.form.get('nombre')

        cursor = db.cursor()
        query = "INSERT INTO Oficina (Nombre) VALUES (%s)"
        cursor.execute(query, (nombre,))
        db.commit()
        cursor.close()

        return redirect(url_for('abm_oficina'))

    return render_template('alta_oficina.html')

@app.route('/abm_oficina')
def abm_oficina():
    if session.get("tipo") != "Admin":
        return "Acceso no autorizado", 403

    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Oficina")
    oficinas = cursor.fetchall()
    cursor.close()

    return render_template("abm_oficina.html", oficinas=oficinas)



@app.route('/editar_oficina/<int:id>', methods=['GET', 'POST'])
def editar_oficina(id):
    if session.get("tipo") != "Admin":
        return "Acceso no autorizado", 403

    cursor = db.cursor(dictionary=True)

    if request.method == 'POST':
        nuevo_nombre = request.form.get('nombre')
        query = "UPDATE Oficina SET Nombre = %s WHERE Id_oficina = %s"
        cursor.execute(query, (nuevo_nombre, id))
        db.commit()
        cursor.close()
        return redirect(url_for('abm_oficina'))
    else:
        query = "SELECT * FROM Oficina WHERE Id_oficina = %s"
        cursor.execute(query, (id,))
        oficina = cursor.fetchone()
        cursor.close()
        return render_template('editar_oficina.html', oficina=oficina)


@app.route('/eliminar_oficina/<int:id>')
def eliminar_oficina(id):
    if session.get("tipo") != "Admin":
        return "Acceso no autorizado", 403

    cursor = db.cursor()
    query = "DELETE FROM Oficina WHERE Id_oficina = %s"
    cursor.execute(query, (id,))
    db.commit()
    cursor.close()
    return redirect(url_for('abm_oficina'))


if __name__ == '__main__':
    app.run(debug=True)

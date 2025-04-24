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
    cursor.execute("SELECT * FROM Empleado")
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


if __name__ == '__main__':
    app.run(debug=True)

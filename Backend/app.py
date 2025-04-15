from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')

    if username == "admin" and password == "1234":
        return "Bienvenido, admin"
    else:
        return "Credenciales incorrectas", 401

if __name__ == '__main__':
    app.run(debug=True)

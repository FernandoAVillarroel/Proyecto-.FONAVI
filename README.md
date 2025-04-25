# 💼 Proyecto Liquidación FONAVI

Sistema de gestión de empleados y liquidaciones salariales desarrollado como parte de un proyecto educativo.

## 🧾 Funcionalidades principales

- ✅ Login de usuarios (admin / empleado)
- ✅ Panel de administración para ABM de empleados
- ✅ Panel individual para empleados
- ✅ Acciones: Agregar, Modificar y Dar de Baja empleados
- ✅ Acceso restringido según tipo de usuario
- ✅ Manejo de sesiones con Flask

## 🧰 Tecnologías utilizadas

- **Frontend**: HTML, CSS (vanilla)
- **Backend**: Python (Flask)
- **Base de datos**: MySQL
- **ORM**: MySQL Connector
- **Configuración segura**: Variables de entorno con `python-dotenv`

## 📂 Estructura del proyecto

Proyecto-FONAVI │ ├── Backend/ │ ├── app.py # Archivo principal de la app Flask │ ├── .env # Variables de entorno (ignorado en Git) │ ├── templates/ # HTMLs (Jinja2) │ └── static/ # Archivos estáticos (CSS/JS) │ ├── .gitignore # Para ignorar archivos sensibles └── README.md # Este archivo


## 🔒 Seguridad

- El archivo `.env` está correctamente excluido del repositorio por `.gitignore` para evitar exponer credenciales.
- Recomendamos configurar contraseñas de forma segura antes de desplegar en producción.

## 🚀 Cómo ejecutar

1. Cloná el repositorio:
   ```bash
   git clone https://github.com/FernandoAVillarroel/Proyecto-.FONAVI.git
   cd Proyecto-.FONAVI

Instalá las dependencias:

pip install -r requirements.txt

Configurá tu archivo .env:


DB_HOST=localhost
DB_USER=root
DB_PASSWORD=tu_contraseña
DB_NAME=liquidacion

Corré el servidor Flask:

python -m flask run
Entrá en http://127.0.0.1:5000

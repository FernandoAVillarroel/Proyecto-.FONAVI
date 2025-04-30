# 💼 Proyecto Liquidación FONAVI

Sistema de gestión de empleados y liquidaciones salariales desarrollado como parte de un proyecto educativo.

## 🧾 Funcionalidades principales
- ✅ Login con validación de usuario y tipo (Admin / Empleado)
- ✅ Panel de Administración con ABM de:
  - Empleados
  - Oficinas
  - Funciones (Categorías)
  - Títulos y Porcentajes
- ✅ Visualización de:
  - Fecha de ingreso
  - Antigüedad
  - Nivel básico asignado automáticamente según función
- ✅ Historial de actividades (próximamente)


## 🧪 Tecnologías Utilizadas

- `Python 3.11`
- `Flask`
- `MySQL`
- `HTML5 / CSS3 / JS`
- `Git / GitHub`

## 📂 Estructura del Proyecto
Proyecto.FONAVI │ ├── Backend/ │ ├── app.py # Lógica del sistema │ ├── .env # Variables de entorno (no subir) │ └── templates/ # HTMLs │ ├── home.html │ ├── admin.html │ └── abm_oficina.html ... │ ├── static/ # CSS y JS │ ├── css/styles.css │ └── js/login.js │ └── db/ └── fonavi.sql # Script de la base de datos

## ⚙️ Cómo ejecutar el proyecto

### 1. Cloná el repositorio

```bash
git clone https://github.com/FernandoAVillarroel/Proyecto-.FONAVI.git
cd Proyecto-.FONAVI/Backend

python -m venv venv
venv\Scripts\activate   # En Windows

3. Instalá dependencias

pip install -r requirements.txt
(Si no existe ese archivo, usá:)
pip install flask mysql-connector-python python-dotenv

4. Configurá el archivo .env
Crea un archivo .env con tus credenciales de base de datos:
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=tu_contraseña
DB_NAME=liquidacion

5. Ejecutá el proyecto

$env:FLASK_APP = "app.py"
python -m flask run

Abrí el navegador en: http://127.0.0.1:5000


🛡️ Seguridad
El archivo .env está en .gitignore y no debe subirse al repositorio.

Las contraseñas en la base de datos son de prueba
🤝 Autores
Proyecto realizado por estudiantes del Instituto Tecnológico de Santiago del Estero.

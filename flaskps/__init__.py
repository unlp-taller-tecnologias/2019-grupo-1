from os import path
from flask import Flask, render_template, g, session
from flaskps.resources import user
from flaskps.resources import auth
from flaskps.resources import sitio
from flaskps.config import Config
from flask_bootstrap import Bootstrap
from flaskps.db import get_db

# Configuración inicial de la app
app = Flask(__name__)
Bootstrap(app)
app.config.from_object(Config)

# Autenticación
app.add_url_rule("/login", 'auth_login', auth.login)
app.add_url_rule("/cerrar_sesion", 'auth_logout', auth.logout)
app.add_url_rule("/autenticacion",'auth_authenticate',auth.authenticate,methods=['POST'])


# Usuarios
app.add_url_rule("/altaUsuario", 'altaUser', user.new , methods=['GET'])
app.add_url_rule("/altaUsuario/creado" , "user_create" , user.create, methods=['POST'])
app.add_url_rule("/listadoUsuario" , "user_list" , user.listadoUsuario)
app.add_url_rule("/deleteUser" , "delete_user" , user.delete)
app.add_url_rule("/userProfile" , "user_profile" , user.profile)

#Admin

# Sitio
app.add_url_rule("/" , "index" , sitio.hello)
app.add_url_rule("/habSitio" , "updateStateSitioHabilitar" , sitio.habSitio)
app.add_url_rule("/deshSitio" , "updateStateSitioDeshabilitar" , sitio.deshSitio)
app.add_url_rule("/panelAdmin" , "panelAdmin" , sitio.renderPanelAdmin)
app.add_url_rule("/cambiarCantidad" , "cambiarCantidad" , sitio.cambiarCantidad, methods=['POST'])
app.add_url_rule("/autorizacion" , "autorizacion" , sitio.autorizacion)

# API-rest





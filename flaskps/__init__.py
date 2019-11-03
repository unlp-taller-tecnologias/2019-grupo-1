from os import path
from flask import Flask, render_template, g, session
from flask_cors import CORS
from flaskps.resources import user
from flaskps.resources import auth
from flaskps.resources import sitio
from flaskps.resources import comedor
from flaskps.config import Config
from flask_bootstrap import Bootstrap
from flaskps.db import get_db

# Configuracion inicial de la app
app = Flask(__name__)
Bootstrap(app)
CORS(app)
app.config.from_object(Config)

# Autenticacion
app.add_url_rule("/login", 'auth_login', auth.login)
app.add_url_rule("/cerrar_sesion", 'auth_logout', auth.logout)
app.add_url_rule("/autenticacion",'auth_authenticate',auth.authenticate,methods=['POST'])


# Usuarios
app.add_url_rule("/altaUsuario", 'altaUser', user.new , methods=['GET'])
app.add_url_rule("/altaUsuario/creado" , "user_create" , user.create, methods=['POST'])
app.add_url_rule("/listadoUsuario" , "user_list" , user.listadoUsuario)
app.add_url_rule("/deleteUser" , "delete_user" , user.delete)
app.add_url_rule("/userProfile" , "user_profile" , user.profile)
app.add_url_rule("/listadoUsuariosPendientes" , "usuario_list_p" , user.listadoUsuarioP)

# Comedores
app.add_url_rule("/listadoComedoresPendientes" , "comedor_list_p" , comedor.listadoComedorP)
app.add_url_rule("/altaComedor", 'altaComedor', comedor.new , methods=['GET'])
app.add_url_rule("/altaComedor/creado" , "comedor_create" , comedor.create, methods=['POST'])
app.add_url_rule("/listadoComedor" , "comedor_list" , comedor.listadoComedor)
app.add_url_rule("/comedorProfile" , "comedor_profile" , comedor.profile)
app.add_url_rule("/deleteComedor" , "delete_com" , comedor.delete)

# Admin
app.add_url_rule("/panelAdmin" , "panelAdmin" , sitio.renderPanelAdmin)

# Sitio
app.add_url_rule("/" , "index" , sitio.hello)
app.add_url_rule("/habSitio" , "updateStateSitioHabilitar" , sitio.habSitio)
app.add_url_rule("/deshSitio" , "updateStateSitioDeshabilitar" , sitio.deshSitio)
app.add_url_rule("/cambiarCantidad" , "cambiarCantidad" , sitio.cambiarCantidad, methods=['POST'])
app.add_url_rule("/autorizacion" , "autorizacion" , sitio.autorizacion)

# API-rest





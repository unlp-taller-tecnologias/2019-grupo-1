from os import path
import os

from flask import Flask, render_template, g, session,send_from_directory
from flask_cors import CORS
from flaskps.resources import user
from flaskps.resources import auth
from flaskps.resources import sitio
from flaskps.resources import comedor
from flaskps.resources import tiposDeAlimentos
from flaskps.resources import tiposDeNecesidad
from flaskps.resources import necesidad
from flaskps.resources import evento
from flaskps.resources import noticia
from flaskps.resources import registro
from flaskps.resources import informativa
from flaskps.config import Config
from flask_bootstrap import Bootstrap
from flaskps.db import get_db
from werkzeug.utils import secure_filename

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
app.add_url_rule("/editarUser", 'editar_user', user.edite , methods=['GET'])
app.add_url_rule("/editandoUser" , "editando_user" , user.editando, methods=['POST','GET'])
app.add_url_rule("/listadoUsuariosPendientes" , "usuario_list_p" , user.listadoUsuarioP)
app.add_url_rule("/actualizarEstadoUsuario","usuario_actualizar_estado",user.actualizarEstado,methods=['GET'])
app.add_url_rule("/usuarioProfile" , "usuario_profile" , user.profile)

# Comedores
app.add_url_rule("/listadoComedoresPendientes" , "comedor_list_p" , comedor.listadoComedorP)
app.add_url_rule("/altaComedor", 'altaComedor', comedor.new , methods=['GET'])
app.add_url_rule("/altaComedor/creado" , "comedor_create" , comedor.create, methods=['POST'])
app.add_url_rule("/editarComedor", 'editar_comedor', comedor.edite , methods=['GET'])
app.add_url_rule("/editandoComedor" , "editando_comedor" , comedor.editando, methods=['POST','GET'])
app.add_url_rule("/listadoComedor" , "comedor_list" , comedor.listadoComedor)
app.add_url_rule("/comedorProfile" , "comedor_profile" , comedor.profile)
app.add_url_rule("/deleteComedor" , "delete_com" , comedor.delete)
app.add_url_rule("/actualizarEstadoComedor","comedor_actualizar_estado",comedor.actualizarEstado,methods=['GET'])
app.add_url_rule("/altaAA","AA_alta",comedor.altaAA ,methods=['GET'])
app.add_url_rule("/altaAA/creado","AA_create",comedor.createAA ,methods=['POST'])
app.add_url_rule("/cambioComedor","cambio_comedor",comedor.cambioComedor ,methods=['GET'])




# Admin
app.add_url_rule("/panelAdmin" , "panelAdmin" , sitio.renderPanelAdmin)

# Sitio
app.add_url_rule("/" , "index" , sitio.hello)
app.add_url_rule("/habSitio" , "updateStateSitioHabilitar" , sitio.habSitio)
app.add_url_rule("/deshSitio" , "updateStateSitioDeshabilitar" , sitio.deshSitio)
app.add_url_rule("/cambiarCantidad" , "cambiarCantidad" , sitio.cambiarCantidad, methods=['POST'])
app.add_url_rule("/autorizacion" , "autorizacion" , sitio.autorizacion)
app.add_url_rule("/nosotros" , "nosotros" , sitio.nosotros)
app.add_url_rule("/actualizarNosotros" , "actualizar_nosotros" , sitio.actualizarNosotros,methods=['POST'])
app.add_url_rule("/actualizarRedes" , "actualizar_redes" , sitio.actualizarRedes,methods=['POST'])

# Tipos de Alimentos
app.add_url_rule("/altaAlimento" , "create_alimento" , tiposDeAlimentos.create, methods=['GET'])
app.add_url_rule("/listadoAlimentos" , "alimentos_list" , tiposDeAlimentos.listadoAlimentos)
app.add_url_rule("/deleteAlimento" , "delete_alimento" , tiposDeAlimentos.delete)

# Tipos de Necesidades
app.add_url_rule("/altaTipoNecesidad" , "create_tipo_necesidad" , tiposDeNecesidad.create, methods=['GET'])
app.add_url_rule("/listadoTipoNecesidad" , "tipo_necesidad_list" , tiposDeNecesidad.listadoTipos)
app.add_url_rule("/deleteTipoNecesidad" , "delete_tipo_necesidad" , tiposDeNecesidad.delete)

#Necesidades

app.add_url_rule("/altaNecesidad" , "create_necesidad" , necesidad.create, methods=['POST'])
app.add_url_rule("/newNecesidad" , "new_necesidad" , necesidad.new_necesidad)
app.add_url_rule("/listadoNecesidades" , "listado_necesidades" , necesidad.listado_necesidades)
app.add_url_rule("/deleteNecesidad" , "delete_necesidad" , necesidad.delete,methods=['GET'])
app.add_url_rule("/cumplirNecesidad" , "cumplir_necesidad" , necesidad.cumplir,methods=['GET'])
app.add_url_rule("/editeNecesidad" , "edite_necesidad" , necesidad.edite,methods=['POST','GET'])
app.add_url_rule("/editandoNecesidad" , "editando_necesidad" , necesidad.editando,methods=['POST'])

#Registro de Alimentacion
app.add_url_rule("/altaRegistroAlimentacion" , "new_registro" , registro.new,methods=['POST','GET'])
app.add_url_rule("/newRegister" , "create_registro" , registro.create,methods=['POST'])
app.add_url_rule("/listadoRegistroComedor" , "list_registro" , registro.listar,methods=['GET'])
app.add_url_rule("/eliminarRegistro" , "delete_registro" , registro.eliminar,methods=['GET'])
app.add_url_rule("/editeRegistro" , "edite_registro" , registro.edite,methods=['GET'])
app.add_url_rule("/editandoregistro" , "editando_registro" , registro.editando,methods=['POST'])

#API
app.add_url_rule("/mapInfoOne" , "mapInfoOne" , comedor.mapInfoOne, methods=['GET'])
app.add_url_rule("/mapInfoAll" , "mapInfoAll" , comedor.mapInfoAll, methods=['GET'])
app.add_url_rule("/getRedes" , "getRedes" , sitio.getRedes, methods=['GET'])
app.add_url_rule("/getAllComedoresFromReferente", "getComFromRef", comedor.allComedoresDeUnReferente, methods=['GET'])

#Eventos
app.add_url_rule("/altaEvento", 'alta_evento', evento.new , methods=['GET'])
app.add_url_rule("/listadoEventos" , "listado_eventos" , evento.listado_eventos)
app.add_url_rule("/listadoMisEventos" , "mis_eventos" , evento.mis_eventos)
app.add_url_rule("/altaEvento/creado" , "create_evento" , evento.create, methods=['POST'])
app.add_url_rule("/misEventos" , "mis_eventos" , evento.mis_eventos)
app.add_url_rule("/deleteEvento" , "delete_evento" , evento.delete)
app.add_url_rule("/editeEvento" , "edite_evento" , evento.edite,methods=['POST','GET'])
app.add_url_rule("/editandoEvento" , "editando_evento" , evento.editando,methods=['POST'])
app.add_url_rule("/verEvento", 'ver_evento', evento.ver , methods=['GET'])

#Noticias
app.add_url_rule("/altaNoticia", 'alta_noticia', noticia.new , methods=['GET'])
app.add_url_rule("/listadoNoticias" , "listado_noticias" , noticia.listado_noticias)
app.add_url_rule("/altaNoticia/creado" , "create_noticia" , noticia.create, methods=['POST'])
app.add_url_rule("/deleteNoticia" , "delete_noticia" , noticia.delete)
app.add_url_rule("/editeNoticia" , "edite_noticia" , noticia.edite,methods=['POST','GET'])
app.add_url_rule("/editandoNoticia" , "editando_noticia" , noticia.editando,methods=['POST'])
app.add_url_rule("/verNoticia" , "ver_noticia" , noticia.ver,methods=['GET'])

#informes y normativas
app.add_url_rule("/altainfor", 'alta_infor', informativa.new , methods=['GET'])
app.add_url_rule("/listadoinforme" , "listado_inform" , informativa.listado_inform)
app.add_url_rule("/altainform/creado" , "create_inforNorma" , informativa.create, methods=['POST'])
app.add_url_rule("/deleteinform" , "delete_inform" , informativa.delete)
app.add_url_rule("/editeinform" , "edite_inform" , informativa.edite,methods=['POST','GET'])
app.add_url_rule("/editandoinform" , "editando_inform" , informativa.editando,methods=['POST'])
app.add_url_rule("/verInforme" , "ver_informe" , informativa.ver,methods=['GET'])


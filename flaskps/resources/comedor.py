from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.user import User 
from flaskps.models.comedor import Comedor
from flaskps.models.comedor_usuario import Comedor_usuario
from flaskps.models.sitio import Sitio
from flaskps.models.necesidad import Necesidad
from flaskps.helpers.auth import authenticated
from flaskps.db import get_db
import json

def new():  
    return render_template(  'comedor/alta_comedor.html' )

def create():

    Comedor.db = get_db()
    User.db = get_db()
    Comedor_usuario.db = get_db()
    data = request.form
    exist =  User.find_user(data['user'])
    if not exist:
        Comedor.create(data)
        User.createRef(data)
        Comedor_usuario.create(Comedor.last_comedor()['id'], User.last_user()['id'])
        flash("El comedor fue creado, pero  debe ser confirmado por el Admin")
        return redirect(url_for('altaComedor', comedor=Comedor.last_comedor()['id'] ,user=User.last_user()['id'] ))
    flash("Ya existe un usuario con ese nombre, elija otro!")   
    return redirect(url_for('altaComedor'))

def listadoComedorP():
    if not session:
        return render_template('autorizacion.html')
    Sitio.db=get_db()
    Comedor.db=get_db()
    cantPag=Sitio.cantPaginado()
    comedores=Comedor.allComedoresP()
    return render_template('comedor/listadoComedoresPendientes.html',cant=cantPag[0]['cant_paginado'],come=comedores,tam=len(comedores))

def listadoComedor():
    if not session:
        return render_template('autorizacion.html')
    Sitio.db=get_db()
    Comedor.db=get_db()
    cantPag=Sitio.cantPaginado()
    comedores=Comedor.allComedores()
    return render_template('comedor/listadoComedor.html',cant=cantPag[0]['cant_paginado'],come=comedores,tam=len(comedores))
    
def profile():
    Comedor.db=get_db()
    Necesidad.db=get_db()
    necesidades = Necesidad.find_tipo_necesidad_by_comedorid(request.args.get('idComedor'))
    comedor = Comedor.find_comedor_by_id(request.args.get('idComedor'))
    
    return render_template('comedor/comedorProfile.html', comedor=comedor, necesidades= necesidades)

def edite():
    Comedor.db=get_db()
    Comedor_usuario.db=get_db()
    User.db=get_db()
    comedor = Comedor.find_comedor_by_id(request.args.get('idComedor'))
    ref= Comedor_usuario.find_user_by_comedorid(request.args.get('idComedor'))['referente_id']
    user = User.find_user_by_id(ref)                                        
    return render_template('comedor/editar_comedor.html', comedor=comedor, ref= user)

def editando():    
    Comedor.db = get_db()
    User.db = get_db()
    Comedor_usuario.db = get_db()
    data = request.form
    Comedor.edite(data)
    User.editeRef(data)
    flash("La informacion se actualizo correctamente")   
    return redirect(url_for('comedor_profile', idComedor= data['idComedor']))

def delete():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == "3":
        Comedor.db=get_db()
        Comedor.delete(request.args.get('idComedor'))
        flash("El comedor se elimino exitosamente")
        return redirect(url_for('comedor_list'))
    else:
        return render_template('autorizacion.html')

def actualizarEstado():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == '3':
        Comedor.db=get_db()
        rol = request.args.get('rol')
        Comedor.updateRol(rol,request.args.get('idCom'))
        if rol == '1':    
            flash("El comedor es parte del sistema")
        else:
            flash("El comedor fue rechazado, no es parte del sistema")    
        return redirect(url_for('comedor_list_p'))
    else:
        return render_template('autorizacion.html')
   
#API

def mapInfoOne():
    Comedor.db=get_db()
    comedor = Comedor.find_comedor_by_id(request.args.get('id'))
    return jsonify(comedor = comedor)

def mapInfoAll():
    Comedor.db=get_db()
    comedor = Comedor.allActives()
    return jsonify(comedores = comedor)     
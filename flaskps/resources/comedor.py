from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.user import User 
from flaskps.models.comedor import Comedor
from flaskps.models.comedor_usuario import Comedor_usuario
from flaskps.models.sitio import Sitio
from flaskps.models.necesidad import Necesidad
from flaskps.db import get_db
from flaskps.helpers.mail import enviar
from flaskps.helpers.auth import *
import json

def new():
    Permiso = habilitedAcces()
    if Permiso == 'true':  
        return render_template(  'comedor/alta_comedor.html' )

def create():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Comedor.db = get_db()
        User.db = get_db()
        Comedor_usuario.db = get_db()
        data = request.form
        exist =  User.find_user(data['user'])
        if not exist:
            Comedor.create(data)
            User.createRef(data)
            Comedor_usuario.create(Comedor.last_comedor()['id'], User.last_user()['id'])
            flash(["El comedor fue creado, pero  debe ser confirmado por el Admin", 'green'])
            enviar('Nuevo comedor','Un nuevo comedor se ha registrado y requiere de validacion del administrador.')
            return redirect(url_for('altaComedor', comedor=Comedor.last_comedor()['id'] ,user=User.last_user()['id'] ))
        flash(["Ya existe un usuario con ese nombre, elija otro!", 'red'])   
        return redirect(url_for('altaComedor'))
    return render_template(Permiso)    

def listadoComedorP():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db=get_db()
        Comedor.db=get_db()
        cantPag=Sitio.cantPaginado()
        comedores=Comedor.allComedoresP()
        return render_template('comedor/listadoComedoresPendientes.html',cant=cantPag[0]['cant_paginado'],come=comedores,tam=len(comedores))
    return render_template(Permiso)    

def listadoComedor():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Sitio.db=get_db()
        Comedor.db=get_db()
        cantPag=Sitio.cantPaginado()
        comedores=Comedor.allComedores()
        return render_template('comedor/listadoComedor.html',cant=cantPag[0]['cant_paginado'],come=comedores,tam=len(comedores))
    return render_template(Permiso)    
    
def profile():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Sitio.db=get_db()
        cantPag=Sitio.cantPaginado()
        Comedor.db=get_db()
        User.db = get_db()
        Necesidad.db=get_db()
        necesidades = Necesidad.find_tipo_necesidad_by_comedorid(request.args.get('idComedor'))
        comedor = Comedor.find_comedor_by_id(request.args.get('idComedor'))
        referente = User.find_user_by_idComedor(request.args.get('idComedor'))
        return render_template('comedor/comedorProfile.html', comedor=comedor, necesidades= necesidades,referente= referente,cant=cantPag[0]['cant_paginado'])
    return render_template(Permiso)

def edite():
    Permiso = habilitedAccesComedor()
    if Permiso == 'true':
        Comedor.db=get_db()
        Comedor_usuario.db=get_db()
        User.db=get_db()
        comedor = Comedor.find_comedor_by_id(request.args.get('idComedor'))
        ref= Comedor_usuario.find_user_by_comedorid(request.args.get('idComedor'))['referente_id']
        user = User.find_user_by_id(ref)                                        
        return render_template('comedor/editar_comedor.html', comedor=comedor, ref= user)
    return render_template(Permiso)    

def editando():
    Permiso = habilitedAccesComedor()
    if Permiso == 'true':    
        Comedor.db = get_db()
        User.db = get_db()
        Comedor_usuario.db = get_db()
        data = request.form
        exist = User.find_user(data['user'])
        ok= False
        if not exist:
            ok= True    
        elif str(exist['id']) == str(data['idRef']):
            ok= True
        if ok:
            Comedor.edite(data)
            User.editeRef(data)
            flash(["La informacion se actualizo correctamente", 'green'])   
            return redirect(url_for('comedor_profile', idComedor= data['idComedor']))    
        flash(["Ya existe un usuario con ese nombre, elija otro!", 'red'])   
        return redirect(url_for( 'comedor_profile' , idComedor=data['idComedor']))
    return render_template(Permiso)    

def delete():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Comedor.db=get_db()
        Comedor.delete(request.args.get('idComedor'))
        flash(["El comedor se elimino exitosamente", 'green'])
        return redirect(url_for('comedor_list'))
    return render_template(Permiso)

def actualizarEstado():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Comedor.db=get_db()
        rol = request.args.get('rol')
        Comedor.updateRol(rol,request.args.get('idCom'))        
        data = Comedor_usuario.find_user_by_comedorid(request.args.get('idCom'))
        user = User.find_user_by_id(data['referente_id'])
        if rol == '1':    
            flash(["El comedor es parte del sistema", 'green'])
            enviar('Comedor Aceptado','El usuario ha sido aceptado y ahora posee acceso al sistema.',user['mail_u'])
        else:
            flash(["El comedor fue rechazado, no es parte del sistema", 'red'])    
            enviar('Comedor Rechazado','El usuario ha sido rechazado.',user['mail_u']) 
        return redirect(url_for('comedor_list_p'))
    return render_template(Permiso)

#API

def mapInfoOne():
    Comedor.db=get_db()
    comedor = Comedor.find_comedor_by_id(request.args.get('id'))
    return jsonify(comedor = comedor)

def mapInfoAll():
    Comedor.db=get_db()
    comedor = Comedor.allActives()
    return jsonify(comedores = comedor)     
from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.user import User 
from flaskps.models.comedor import Comedor
from flaskps.models.comedor_usuario import Comedor_usuario
from flaskps.models.sitio import Sitio
from flaskps.models.evento import Evento
from flaskps.models.necesidad import Necesidad
from flaskps.models.registro import Registro

from flaskps.db import get_db
# from flaskps.helpers.mail import enviar
from flaskps.helpers.auth import *
from flaskps.helpers.files import upload_file
import json

from datetime import datetime, date, time, timedelta
import calendar

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
            file = request.files['file']
            Comedor.create(data,file.filename)
            User.createRef(data)
            Comedor_usuario.create(Comedor.last_comedor()['id'], User.last_user()['id'])
            filename =Comedor.last_comedor()
            upload_file('comedor',str(filename['id']),file)
            flash(["El comedor fue creado, pero  debe ser confirmado por el Admin", 'green'])
            # enviar('Nuevo comedor','Un nuevo comedor se ha registrado y requiere de validacion del administrador.')
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
        Registro.db = get_db()
        Necesidad.db=get_db()
        registrosCom = Registro.getRegistros(request.args.get('idComedor'))
        necesidades = Necesidad.find_tipo_necesidad_by_comedorid(request.args.get('idComedor'))
        comedor = Comedor.find_comedor_by_id(request.args.get('idComedor'))
        referente = User.find_user_by_idComedor(request.args.get('idComedor'))
        return render_template('comedor/comedorProfile.html', comedor=comedor, necesidades= necesidades,referente= referente,registros=registrosCom,cant=cantPag[0]['cant_paginado'])
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
        com = Comedor.find_comedor_by_id(int(data['idComedor']))
        ok= False
        if not exist:
            ok= True    
        elif str(exist['id']) == str(data['idRef']):
            ok= True
        if ok:
            file = request.files['file']
            if not upload_file('comedor',str(data['idComedor']),file):
                Comedor.edite(data,com['foto'])
            else:
                Comedor.edite(data,file.filename)
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
        Comedor_usuario.db = get_db()
        Evento.db=get_db()
        Necesidad.db=get_db()
        User.db=get_db()
        usuario=Comedor_usuario.find_user_by_comedorid(request.args.get('idComedor'))
        evento=Evento.find_evento_by_user(usuario['referente_id'],datetime.now())
        necesidad=Necesidad.find_tipo_necesidad_by_comedorid(request.args.get('idComedor'))
        if len(evento)==0 and len(necesidad)==0:
            Comedor_usuario.delete(request.args.get('idComedor'),usuario['referente_id'])
            Comedor.delete(request.args.get('idComedor'))
            User.delete(usuario['referente_id'])
            flash(["El comedor se elimino exitosamente", 'green'])
            return redirect(url_for('comedor_list'))
        else:
            flash(["El comedor no puede eliminarse, tiene eventos o necesidades pendientes", 'red'])
            return redirect(url_for('comedor_list'))
    return render_template(Permiso)

def actualizarEstado():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Comedor.db=get_db()
        Comedor_usuario.db=get_db()
        User.db=get_db()
        rol = request.args.get('rol')
        Comedor.updateRol(rol,request.args.get('idCom'))        
        data = Comedor_usuario.find_user_by_comedorid(request.args.get('idCom'))
        user = User.find_user_by_id(data['referente_id'])
        User.updateRol(rol,data['referente_id'])        
        if rol == '1':    
            flash(["El comedor es parte del sistema", 'green'])
            # enviar('Comedor Aceptado','El usuario ha sido aceptado y ahora posee acceso al sistema.',user['mail_u'])
        else:
            flash(["El comedor fue rechazado, no es parte del sistema", 'red'])    
            # enviar('Comedor Rechazado','El usuario ha sido rechazado.',user['mail_u']) 
        return redirect(url_for('comedor_list_p'))
    return render_template(Permiso)

def altaAA():
    Permiso = habilitedAcces()
    if Permiso == 'true':  
        return render_template(  'comedor/altaAA.html' )

# Deberia crear un comedor y un comedor_usuario
def createAA():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Comedor.db = get_db()
        Comedor_usuario.db = get_db()
        User.db=get_db()
        data = request.form
        exist =  User.find_user(data["idRefe"])
        if not exist:
            file = request.files['file']
            Comedor.createAA(data,file.filename)          
            Comedor_usuario.create(Comedor.last_comedor()['id'], data["idRefe"])
            filename = Comedor.last_comedor()
            upload_file('comedor',str(filename['id']),file)
            flash(["El comedor fue creado correctamente", 'green'])
            return redirect(url_for('comedor_profile',idComedor=filename["id"]))
        flash(["Ya existe un usuario con ese nombre, elija otro!", 'red'])   
        return redirect(url_for('altaComedor'))
    return render_template(Permiso)   


def cambioComedor():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Comedor.db = get_db()
        com = request.args.get('id')
        exist = Comedor.find_comedor_by_id(com)
        if(exist):
            session['idComedor'] = request.args.get('id')
            return redirect(url_for('index'))
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

def allComedoresDeUnReferente():
    Comedor_usuario.db=get_db()
    comedores = Comedor_usuario.getAllComedoresByIdReferente(request.args.get('id'))
    return jsonify(comedores=comedores)
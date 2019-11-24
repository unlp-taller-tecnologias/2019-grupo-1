from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.user import User
from flaskps.models.sitio import Sitio
from flaskps.models.evento import Evento
from flaskps.helpers.mail import enviar
from flaskps.db import get_db
from flaskps.helpers.auth import *
from flaskps.helpers.files import upload_file

from datetime import datetime, date, time, timedelta
import calendar

def new():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        return render_template('user/alta_usuario.html' )
    return render_template(Permiso)    

def create():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        User.db = get_db()
        data = request.form
        exist = User.find_user(data['user'])
        if not exist:
            file = request.files['file']
            User.create(data,file.filename)
            filename =User.last_user()
            upload_file('usuario',str(filename['id']),file)
            flash(["El usuario debe ser confirmado por el Admin para poder ser utilizado.", 'green'])
            enviar('Nuevo usuario','Un nuevo usuario se ha registrado y requiere de validacion del administrador.')
            return redirect(url_for('altaUser'))
        flash(["Ya existe un usuario con ese nombre, elija otro!", 'red'])   
        return redirect(url_for('altaUser'))
    return render_template(Permiso)

def listadoUsuario():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        User.db=get_db()
        Sitio.db=get_db()
        cantPag=Sitio.cantPaginado()    
        usuarios=User.allUsers()
        return render_template('user/listadoUsuario.html',cant=cantPag[0]['cant_paginado'],users=usuarios,tam=len(usuarios))
    return render_template(Permiso)    


def delete():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        User.db=get_db()
        Evento.db=get_db()
        evento=Evento.find_evento_by_user(request.args.get('idUser'),datetime.now())
        if User.find_user_by_id(request.args.get('idUser'))['rol'] == '3':
            flash(["No se puede eliminar un administrador", 'red'])
            return redirect(url_for('user_list'))
        else:
            if len(evento)==0:
                User.delete(request.args.get('idUser'))
                return jsonify(ok=True)
            else:
                return jsonify(ok=False)
    return render_template(Permiso)  

def profile():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        User.db=get_db()
        us = User.find_user_by_id(request.args.get('idUser'))
        return render_template('user/usuarioProfile.html', user=us)  
    return render_template(Permiso)        
    
def listadoUsuarioP():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        User.db=get_db()
        Sitio.db=get_db()
        cantPag=Sitio.cantPaginado()    
        users= User.allUsersP()
        return render_template('user/listadoUsuariosPendientes.html', users=users,cant=cantPag[0]['cant_paginado'])
    return render_template(Permiso)      

def actualizarEstado():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        User.db=get_db()
        Sitio.db=get_db()
        User.updateRol(request.args.get('rol'),request.args.get('idUser'))
        user = User.find_user_by_id(request.args.get('idUser'))
        if request.args.get('rol') == '1':
            flash(['El usuario fue aceptado en el sistema', 'green'])
            enviar('Usuario Aceptado','El usuario ha sido aceptado y ahora posee acceso al sistema.',user['mail_u'])
        else:
            flash(['El usuario fue rechazado', 'red'])
            enviar('Usuario Rechazado','El usuario ha sido rechazado.',user['mail_u'])  
        return redirect(url_for('usuario_list_p'))
    return render_template(Permiso)  

def edite():
    Permiso = habilitedAccesLogin()
    if Permiso == 'true':
        User.db=get_db()
        user = User.find_user_by_id(request.args.get('id'))                                       
        return render_template('user/editar_usuario.html', user= user)

def editando():
    Permiso = habilitedAccesLogin()
    if Permiso == 'true':    
        User.db = get_db()
        data = request.form                  
        exist = User.find_user(data['user'])
        ok= False
        if not exist:
            ok= True    
        elif str(exist['id']) == str(data['idU']):
            ok= True
        if ok:
            file = request.files['file']            
            flash(["La informacion se actualizo correctamente", "green"])
            if  not upload_file('usuario',str(data['idU']),file):
                User.edite(data,exist['foto'])
            else:
                User.edite(data,file.filename)    
            session['name'] = data['user']
            return redirect(url_for( 'user_profile' , idUser=data['idU']))    
        flash(["Ya existe un usuario con ese nombre, elija otro!", "red"])   
        return redirect(url_for( 'user_profile' , idUser=data['idU']))
    return render_template(Permiso)      
    
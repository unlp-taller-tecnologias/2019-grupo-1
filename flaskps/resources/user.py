from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.user import User
from flaskps.models.sitio import Sitio
from flaskps.models.evento import Evento
#from flaskps.helpers.auth import authenticated
from flaskps.db import get_db

def new():
    return render_template('user/alta_usuario.html' )

def create():
    User.db = get_db()
    data = request.form
    exist = User.find_user(data['user'])
    if not exist:
        User.create(data)
        flash(["El usuario debe ser confirmado por el Admin para poder ser utilizado.", 'green'])
        return redirect(url_for('altaUser'))
    flash(["Ya existe un usuario con ese nombre, elija otro!", 'red'])   
    return redirect(url_for('altaUser'))


def listadoUsuario():
    if not session:
        return render_template('autorizacion.html')
    User.db=get_db()
    Sitio.db=get_db()
    cantPag=Sitio.cantPaginado()    
    usuarios=User.allUsers()
    return render_template('user/listadoUsuario.html',cant=cantPag[0]['cant_paginado'],users=usuarios,tam=len(usuarios))


def delete():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == "3":
        User.db=get_db()
        Evento.db=get_db()
        evento=Evento.find_evento_by_user(request.args.get('idUser'))
        if len(evento)==0:
            User.delete(request.args.get('idUser'))
            return jsonify(ok=True)
        else:
            return jsonify(ok=False)
    else:
        return render_template('autorizacion.html')
    
def profile():
    
    User.db=get_db()
    us = User.find_user_by_id(request.args.get('idUser'))
    return render_template('user/usuarioProfile.html', user=us)    
    
def listadoUsuarioP():
    if not session:
        return render_template('autorizacion.html')
    User.db=get_db()
    Sitio.db=get_db()
    cantPag=Sitio.cantPaginado()    
    users= User.allUsersP()
    return render_template('user/listadoUsuariosPendientes.html', users=users,cant=cantPag[0]['cant_paginado'])

def actualizarEstado():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == 3:
        User.db=get_db()
        User.updateRol(request.args.get('rol'),request.args.get('idUser'))
        return jsonify(True)
    else:
        return render_template('autorizacion.html')

def edite():
    User.db=get_db()
    user = User.find_user_by_id(request.args.get('id'))                                       
    return render_template('user/editar_usuario.html', user= user)

def editando():    
    User.db = get_db()
    data = request.form                  
    exist = User.find_user(data['user'])
    ok= False
    if not exist:
        ok= True    
    elif str(exist['id']) == str(data['idU']):
        ok= True
    if ok:
        flash(["La informacion se actualizo correctamente", "green"])
        User.edite(data)
        session['name'] = data['user']
        return redirect(url_for( 'user_profile' , idUser=data['idU']))    
    flash(["Ya existe un usuario con ese nombre, elija otro!", "red"])   
    return redirect(url_for( 'user_profile' , idUser=data['idU']))
    
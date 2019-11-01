from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.user import User
from flaskps.models.sitio import Sitio
from flaskps.helpers.auth import authenticated
from flaskps.db import get_db

def new():
    return render_template('alta_usuario.html' )

def create():
    User.db = get_db()
    data = request.form
    exist = User.find_user(data['user'])
    if not exist:
        User.create(data)
        flash("El usuario debe ser confirmado por el Admin para poder ser utilizado.")
        return redirect(url_for('altaUser' ))
    flash("Ya existe un usuario con ese nombre, elija otro!")   
    return redirect(url_for('altaUser'))


def listadoUsuario():
    if not session:
        return render_template('autorizacion.html')
    User.db=get_db()
    Sitio.db=get_db()
    cantPag=Sitio.cantPaginado()    
    usuarios=User.allUsers()
    return render_template('listadoUsuario.html',cant=cantPag[0]['cant_paginado'],users=usuarios,tam=len(usuarios))


def delete():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == 3:
        User.db=get_db()
        User.delete(request.args.get('idUser'))
        flash("El usuario se elimino exitosamente")
        return redirect(url_for('user_list'))
    else:
        return render_template('autorizacion.html')
    
def profile():
    if not session:
        return render_template('autorizacion.html')
    User.db=get_db()
    us = User.find_user_by_id(request.args.get('idUser'))
    return render_template('userProfile.html', user=us)    
    
def listadoUsuarioP():
    if not session:
        return render_template('autorizacion.html')
    User.db=get_db()
    Sitio.db=get_db()
    cantPag=Sitio.cantPaginado()    
    users= User.allUsersP()
    return render_template('listadoUsuariosPendientes.html', users=users,cant=cantPag[0]['cant_paginado'])  

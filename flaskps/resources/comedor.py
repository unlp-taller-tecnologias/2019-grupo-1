from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.user import User 
from flaskps.models.comedor import Comedor
from flaskps.models.comedor_usuario import Comedor_usuario
from flaskps.models.sitio import Sitio
from flaskps.helpers.auth import authenticated
from flaskps.db import get_db

def new():  
    return render_template('alta_comedor.html' )

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
    return render_template('listadoComedoresPendientes.html',cant=cantPag[0]['cant_paginado'],come=comedores,tam=len(comedores))

def listadoComedor():
    if not session:
        return render_template('autorizacion.html')
    Sitio.db=get_db()
    Comedor.db=get_db()
    cantPag=Sitio.cantPaginado()
    comedores=Comedor.allComedores()
    return render_template('listadoComedor.html',cant=cantPag[0]['cant_paginado'],come=comedores,tam=len(comedores))
    
def profile():
    if not session:
        return render_template('autorizacion.html')
    Comedor.db=get_db()
    comedor = Comedor.find_comedor_by_id(request.args.get('idComedor'))
    return render_template('comedorProfile.html', comedor=comedor)

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
    if session['rol'] == 3:
        Comedor.db=get_db()
        Comedor.updateRol(request.args.get('rol'),request.args.get('idCom'))
        return jsonify(True)
    else:
        return render_template('autorizacion.html')
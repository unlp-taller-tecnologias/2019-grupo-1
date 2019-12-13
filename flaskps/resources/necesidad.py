from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.models.necesidad import Necesidad
from flaskps.models.tiposDeNecesidades import Tipo_necesidad
from flaskps.models.comedor import Comedor
from flaskps.db import get_db
from flaskps.helpers.auth import *

def new_necesidad():
    Permiso = habilitedAccesComedor()
    if Permiso == 'true': 
        Tipo_necesidad.db=get_db()
        Comedor.db=get_db()
        tipo_necesidades = Tipo_necesidad.all()
        comedores = Comedor.allActives()
        return render_template('alta_necesidad.html',tipo_necesidades= tipo_necesidades, comedores= comedores)
    return render_template(Permiso)	
    

def listado_necesidades():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Necesidad.db=get_db()
        Sitio.db = get_db()
        Tipo_necesidad.db=get_db()
        Comedor.db=get_db()
        necesidades = Necesidad.all()
        tipo_necesidades = Tipo_necesidad.all()
        comedores = Comedor.all()
        cantPag = Sitio.cantPaginado()
        return render_template('listado_necesidades.html', necesidades= necesidades, tipo_necesidades= tipo_necesidades, comedores= comedores, cant=cantPag[0]['cant_paginado'])
    return render_template(Permiso)

def create():
    Permiso = habilitedAccesComedor()
    if Permiso == 'true': 
        Necesidad.db = get_db()
        data = request.form
        Necesidad.create(data)
        flash(["Se creo la necesidad exitosamente!", 'green'])   
        return redirect(url_for('listado_necesidades'))
    return render_template(Permiso)
    

def edite():
    Permiso = habilitedAccesComedor()
    if Permiso == 'true': 
        Necesidad.db = get_db()
        necesidad = Necesidad.find_necesidad_by_id(request.args.get('id'))
        Tipo_necesidad.db=get_db()
        Comedor.db=get_db()
        tipo_necesidades = Tipo_necesidad.all()
        comedores = Comedor.all()
        return render_template('editeNecesidad.html', necesidad = necesidad,tipo_necesidades= tipo_necesidades, comedores= comedores)
    return render_template(Permiso)

def editando():
    Permiso = habilitedAccesComedor()
    if Permiso == 'true':    
        Necesidad.db = get_db()
        data = request.form
        Necesidad.edite(data)
        flash(["Se edito la necesidad exitosamente!", 'green'])     
        return redirect(url_for('listado_necesidades'))
    return render_template(Permiso)
    
def cumplir():
    Permiso = habilitedAccesComedor()
    if Permiso == 'true':
        Necesidad.db = get_db()
        Necesidad.cumplir(request.args.get('id'))
        flash(["Se cumplio la necesidad exitosamente!", 'green'])   
        return jsonify(ok=True)
    return render_template(Permiso)

def delete():
    Permiso = habilitedAccesComedor()
    if Permiso == 'true':
        Necesidad.db = get_db()
        Necesidad.delete(request.args.get('id'))
        flash(["Se elimino la necesidad exitosamente!", 'green'])   
        return jsonify(ok=True)
    return render_template(Permiso)
    

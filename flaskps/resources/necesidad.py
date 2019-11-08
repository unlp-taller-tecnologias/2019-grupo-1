from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.models.necesidad import Necesidad
from flaskps.models.tiposDeNecesidades import Tipo_necesidad
from flaskps.models.comedor import Comedor      
from flaskps.helpers.auth import authenticated
from flaskps.db import get_db

def new_necesidad():
    Tipo_necesidad.db=get_db()
    Comedor.db=get_db()
    tipo_necesidades = Tipo_necesidad.all()
    comedores = Comedor.all()
    
    return render_template('alta_necesidad.html',tipo_necesidades= tipo_necesidades, comedores= comedores)

def listado_necesidades():
    Necesidad.db=get_db()
    Tipo_necesidad.db=get_db()
    Comedor.db=get_db()
    necesidades = Necesidad.all()
    tipo_necesidades = Tipo_necesidad.all()
    comedores = Comedor.all()
    
    return render_template('listado_necesidades.html', necesidades= necesidades, tipo_necesidades= tipo_necesidades, comedores= comedores)

def create():
    Necesidad.db = get_db()
    data = request.form
    Necesidad.create(data)
    flash("Se creo la necesidad exitosamente!")   
    return redirect(url_for('listado_necesidades'))

def delete():
    Necesidad.db = get_db()
    data = request.form
    Necesidad.create(data)
    flash("Se creo la necesidad exitosamente!")   
    return redirect(url_for('listado_necesidades'))

 

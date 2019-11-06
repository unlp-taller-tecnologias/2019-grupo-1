from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.models.tiposDeNecesidades import Tipo_necesidad    
from flaskps.helpers.auth import authenticated
from flaskps.db import get_db

def create():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == '3':
        Tipo_necesidad.db=get_db()
        Tipo_necesidad.create(request.args.get('nombre'))
        return jsonify(True)
    else:
        return render_template('autorizacion.html')

def listadoTipos():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == '3':
        Tipo_necesidad.db=get_db()
        Sitio.db=get_db()
        cantPag=Sitio.cantPaginado()    
        tipos=Tipo_necesidad.all()
        return render_template('admin/listadoDeTiposDeNecesidad.html',cant=cantPag[0]['cant_paginado'],alimentos=tipos,tam=len(tipos))
    else:
        return render_template('autorizacion.html')

def delete():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == '3':
        Tipo_necesidad.db=get_db()
        Tipo_necesidad.delete(request.args.get('id'))
        # eliminar necesidades que tengan el tipo
        return jsonify(True)
    else:
        return render_template('autorizacion.html')
 

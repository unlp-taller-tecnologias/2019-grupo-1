from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.models.tiposDeNecesidades import Tipo_necesidad  
from flaskps.models.necesidad import Necesidad   
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
        Necesidad.db=get_db()
        Sitio.db=get_db()
        cantPag=Sitio.cantPaginado()    
        tipos=Tipo_necesidad.all()
        id_necesidades=Necesidad.find_tipo_necesidades()
        return render_template('admin/listadoDeTiposDeNecesidad.html',cant=cantPag[0]['cant_paginado'],ids=id_necesidades,alimentos=tipos,tam=len(tipos))
    else:
        return render_template('autorizacion.html')

def delete():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == '3':
        Tipo_necesidad.db=get_db()
        try:
            Tipo_necesidad.delete(request.args.get('id'))
        except:
            return jsonify(ok=False)
        
        return jsonify(ok=True)
    else:
        return render_template('autorizacion.html')
 

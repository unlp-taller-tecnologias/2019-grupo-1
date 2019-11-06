from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.models.tiposDeAlimentos import Alimento    
from flaskps.helpers.auth import authenticated
from flaskps.db import get_db

def create():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == '3':
        Alimento.db=get_db()
        Alimento.create(request.args.get('nombre'))
        return jsonify(True)
    else:
        return render_template('autorizacion.html')

def listado_necesidades():

    return render_template('listado_necesidades.html')


def delete():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == '3':
        Alimento.db=get_db()
        Alimento.delete(request.args.get('idAlm'))
        # eliminar de los registros
        return jsonify(True)
    else:
        return render_template('autorizacion.html')
 

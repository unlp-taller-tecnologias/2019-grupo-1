from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.models.tiposDeAlimentos import Alimento
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

def listadoAlimentos():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == '3':
        Alimento.db=get_db()
        Sitio.db=get_db()
        cantPag=Sitio.cantPaginado()    
        alimentos=Alimento.all()
        return render_template('admin/listadoTiposDeAlimentos.html',cant=cantPag[0]['cant_paginado'],alimentos=alimentos,tam=len(alimentos))
    else:
        return render_template('autorizacion.html')

def delete():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == '3':
        Alimento.db=get_db()
        try:
            Alimento.delete(request.args.get('idAlm'))
        except:
            return jsonify(ok=False)
        return jsonify(ok=True)
    else:
        return render_template('autorizacion.html')
 

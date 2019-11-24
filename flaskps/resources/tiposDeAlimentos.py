from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.models.tiposDeAlimentos import Alimento
from flaskps.models.tiposDeAlimentos import Alimento
from flaskps.db import get_db
from flaskps.helpers.auth import habilitedAccesAdmin

def create():
    Permiso = habilitedAccesAdmin() 
    if Permiso == 'true': 
        Alimento.db=get_db()
        Alimento.create(request.args.get('nombre'))
        return jsonify(True)
    return render_template(Permiso)

def listadoAlimentos():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true': 
        Alimento.db=get_db()
        Sitio.db=get_db()
        cantPag=Sitio.cantPaginado()    
        alimentos=Alimento.all()
        return render_template('admin/listadoTiposDeAlimentos.html',cant=cantPag[0]['cant_paginado'],alimentos=alimentos,tam=len(alimentos))
    return render_template(Permiso)

def delete():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true': 
        Alimento.db=get_db()
        exist = Alimento.exist_alimento(request.args.get('idAlm'))
        if not exist:
            Alimento.delete(request.args.get('idAlm'))
            return jsonify(ok=True)
        return jsonify(ok=False)
    return render_template(Permiso)
 

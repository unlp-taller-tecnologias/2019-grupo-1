from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.db import get_db
from flaskps.models.informativa import Informativa
from flaskps.helpers.auth import *
from flaskps.helpers.files import upload_file
from datetime import datetime, date, time, timedelta
import calendar

def new():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        return render_template( 'informesnormativas/altaInfor.html' )
    return render_template(Permiso)    

def listado_inform():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Sitio.db=get_db()
        Informativa.db=get_db()
        cantPag=Sitio.cantPaginado()
        informativas = Informativa.allInformes()
        for elem in informativas:
            elem['fecha'] = elem['fecha'].strftime("%d/%m/%y")
        if not session:
            return render_template('informesnormativas/listado_usuario_informe.html',informativas=informativas)
        return render_template('informesnormativas/listado_informe.html',cant=cantPag[0]['cant_paginado'],informativas=informativas,tam=len(informativas))
    return render_template(Permiso)


def create():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db=get_db()
        Informativa.db = get_db()
        data = request.form
        Informativa.create(data,datetime.now())
        flash(["El informe y/o normativa se ha creado con exito", 'green'])
        return redirect(url_for('listado_inform'))
    return  render_template(Permiso)  


def delete():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Informativa.db=get_db()
        Informativa.delete(request.args.get('id'))
        return jsonify(ok=True)
    return render_template(Permiso)   

def edite():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        if not session:
            return render_template('autorizacion.html')
        if session['rol'] == "3":
            Informativa.db = get_db()
            informe = Informativa.find_informe_by_id(request.args.get('idInform'))
            return render_template('informesnormativas/editeInforme.html', informe = informe)
        else:
            return render_template('autorizacion.html')
    return render_template(Permiso) 

def editando():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':    
        Informativa.db = get_db()
        data = request.form
        Informativa.edite(data)
        flash(["El informe y/o normativa se ha editado con exito", 'green'])  
        return redirect(url_for('listado_inform'))
    return render_template(Permiso)


def ver():
    Permiso = habilitedAcces()
    links=[]
    if Permiso == 'true':    
        Informativa.db = get_db()
        informe = Informativa.find_informe_by_id(request.args.get('idinform'))
        links = ((informe['links']).split("\r"))
        informe['links'] = links
        informe['fecha'] = informe['fecha'].strftime("%d/%m/%Y")
        return render_template('informesnormativas/ver_informe.html',informe=informe)
    return render_template(Permiso)
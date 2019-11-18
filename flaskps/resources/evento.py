from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.db import get_db
from flaskps.models.evento import Evento
from flaskps.helpers.auth import *

from datetime import datetime, date, time, timedelta
import calendar

def new():
    Permiso = habilitedAccesLogin()
    if Permiso == 'true':  
        return render_template( 'alta_evento.html' )
    return render_template(Permiso)

def listado_eventos():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Sitio.db=get_db()
        Evento.db=get_db()
        cantPag=Sitio.cantPaginado()
        eventos=Evento.allEventos(datetime.now())
        if not session:
            return render_template('listado_eventos_usuarios.html',eventos=eventos)
        if session['rol'] == "3":
            return render_template('listado_eventos.html',cant=cantPag[0]['cant_paginado'],eventos=eventos,tam=len(eventos))
        else:
            return render_template('listado_eventos_usuarios.html',eventos=eventos)
    return render_template(Permiso)

def mis_eventos():
    Permiso = habilitedAccesLogin()
    if Permiso == 'true':
        if not session:
            return render_template('autorizacion.html')
        Sitio.db=get_db()
        Evento.db=get_db()
        cantPag=Sitio.cantPaginado()
        eventos=Evento.find_evento_by_user(session['id'])
        return render_template('listado_mis_eventos.html',cant=cantPag[0]['cant_paginado'],eventos=eventos,tam=len(eventos))
    return render_template(Permiso)

def create():
    Permiso = habilitedAccesLogin()
    if Permiso == 'true':
        Sitio.db=get_db()
        Evento.db = get_db()
        data = request.form
        Evento.create(data,session['id'],datetime.now())
        flash(["El evento se ha creado con exito", 'green']) 
        return redirect(url_for('listado_eventos'))
    return render_template(Permiso)

def delete():
    Permiso = habilitedAccesLogin()
    if Permiso == 'true':
        if not session:
            return render_template('autorizacion.html')
        else:
            Evento.db=get_db()
            Evento.delete(request.args.get('id'))
            return jsonify(ok=True)
    return render_template(Permiso)   

def edite():
    Permiso = habilitedAccesLogin()
    if Permiso == 'true':
        if not session:
            return render_template('autorizacion.html')
        else:
            Evento.db = get_db()
            evento = Evento.find_evento_by_id(request.args.get('idEvento'))
            return render_template('editeEvento.html', evento = evento)
    return render_template(Permiso)

def editando():
    Permiso = habilitedAccesLogin()
    if Permiso == 'true':    
        Evento.db = get_db()
        data = request.form
        Evento.edite(data,datetime.now())
        flash(["Se edito  exitosamente!", 'green'])     
        return redirect(url_for('listado_eventos'))
    return render_template(Permiso)    
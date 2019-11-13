from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio    

#from flaskps.helpers.auth import authenticated
from flaskps.db import get_db
from flaskps.models.evento import Evento

from datetime import datetime, date, time, timedelta
import calendar

def new():  
    return render_template( 'alta_evento.html' )


def listado_eventos():
    Sitio.db=get_db()
    Evento.db=get_db()
    cantPag=Sitio.cantPaginado()
    eventos=Evento.allEventos()
    # Falta mostrar solo los eventos futuros
    return render_template('listado_eventos.html',cant=cantPag[0]['cant_paginado'],eventos=eventos,tam=len(eventos))

def mis_eventos():
    if not session:
        return render_template('autorizacion.html')
    Sitio.db=get_db()
    Evento.db=get_db()
    cantPag=Sitio.cantPaginado()
    eventos=Evento.find_evento_by_user(session['id'])
    # Falta mostrar solo los eventos futuros
    return render_template('listado_mis_eventos.html',cant=cantPag[0]['cant_paginado'],eventos=eventos,tam=len(eventos))


def create():
    Sitio.db=get_db()
    Evento.db = get_db()
    data = request.form
    #exist = User.find_user(data['user'])
   # if not exist:
    Evento.create(data,session['id'],datetime.now())
    flash("El evento se ha creado con exito")
        #return redirect(url_for('altaUser'))
    #flash("Ya existe un usuario con ese nombre, elija otro!")   
    return redirect(url_for('listado_eventos'))


def delete():
    if not session:
        return render_template('autorizacion.html')
    else:
        Evento.db=get_db()
        Evento.delete(request.args.get('idEvento'))
        flash("El evento se elimino exitosamente")
        return redirect(url_for('listado_eventos'))


def edite():
    if not session:
        return render_template('autorizacion.html')
    else:
        Evento.db = get_db()
        evento = Evento.find_evento_by_id(request.args.get('idEvento'))
        return render_template('editeEvento.html', evento = evento)
  

def editando():    
    Evento.db = get_db()
    data = request.form
    Evento.edite(data,datetime.now())
    flash("Se edito  exitosamente!")     
    return redirect(url_for('listado_eventos'))
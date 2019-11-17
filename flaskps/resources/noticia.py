from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.db import get_db
from flaskps.models.noticia import Noticia

from datetime import datetime, date, time, timedelta
import calendar

def new():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == "3":
        return render_template( 'alta_noticia.html' )
    else:
        return render_template('autorizacion.html')


def listado_noticias():
    Sitio.db=get_db()
    Noticia.db=get_db()
    cantPag=Sitio.cantPaginado()
    noticias=Noticia.allNoticias()
    if not session:
        return render_template('listado_noticias_usuarios.html', noticias=noticias)
    if session['rol'] == "3":
        return render_template('listado_noticias.html',cant=cantPag[0]['cant_paginado'],noticias=noticias,tam=len(noticias))
    else:
        return render_template('listado_noticias_usuarios.html', noticias=noticias)


def create():
    Sitio.db=get_db()
    Noticia.db = get_db()
    data = request.form
    #exist = User.find_user(data['user'])
   # if not exist:
    Noticia.create(data,datetime.now())
    flash(["La noticia se ha creado con exito", 'green'])
    return redirect(url_for('listado_noticias'))

def delete():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == "3":
        Noticia.db=get_db()
        Noticia.delete(request.args.get('id'))
        return jsonify(ok=True)
    else:
        return render_template('autorizacion.html')

def edite():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == "3":
        Noticia.db = get_db()
        noticia = Noticia.find_noticia_by_id(request.args.get('idNoticia'))
        return render_template('editeNoticia.html', noticia = noticia)
    else:
        return render_template('autorizacion.html')

def editando():    
    Noticia.db = get_db()
    data = request.form
    Noticia.edite(data)
    #flash("Se edito la noticia exitosamente!")  
    return redirect(url_for('listado_noticias'))
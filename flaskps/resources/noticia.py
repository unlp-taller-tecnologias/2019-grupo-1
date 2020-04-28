from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.db import get_db
from flaskps.models.noticia import Noticia
from flaskps.helpers.auth import *
from flaskps.helpers.files import upload_file
from datetime import datetime, date, time, timedelta
import calendar

def new():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        return render_template( 'noticia/alta_noticia.html' )
    return render_template(Permiso)        


def listado_noticias():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Sitio.db=get_db()
        Noticia.db=get_db()
        cantPag=Sitio.cantPaginado()
        noticias=Noticia.allNoticias()
        for elem in noticias:
            elem['fecha'] = elem['fecha'].strftime("%d/%m/%Y")
        if session and session['rol'] == "3":
            return render_template('noticia/listado_noticias.html',cant=cantPag[0]['cant_paginado'],noticias=noticias,tam=len(noticias))
        else:
            return render_template('noticia/listado_noticias_usuarios.html', noticias=noticias)
    return render_template(Permiso)        


def create():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db=get_db()
        Noticia.db = get_db()
        data = request.form
        file = request.files['file']
        Noticia.create(data,datetime.now(),file.filename)
        filename =Noticia.last_noticia()
        upload_file('noticia',str(filename['id']),file)
        flash(["La noticia se ha creado con exito", 'green'])
        return redirect(url_for('listado_noticias'))
    return  render_template(Permiso)    

def delete():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Noticia.db=get_db()
        Noticia.delete(request.args.get('id'))
        return jsonify(ok=True)
    return render_template(Permiso)         

def edite():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        if not session:
            return render_template('autorizacion.html')
        if session['rol'] == "3":
            Noticia.db = get_db()
            noticia = Noticia.find_noticia_by_id(request.args.get('idNoticia'))
            return render_template('noticia/editeNoticia.html', noticia = noticia)
        else:
            return render_template('autorizacion.html')
    return render_template(Permiso) 

def editando():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':    
        Noticia.db = get_db()
        data = request.form
        exist = Noticia.find_noticia_by_id(str(data['idNoticia']))
        file = request.files['file']
        if not upload_file('noticia',str(data['idNoticia']),file):
            Noticia.edite(data,exist['foto'])
        else:
            Noticia.edite(data,file.filename)
        flash(["La noticia se ha editado con exito", 'green'])  
        return redirect(url_for('listado_noticias'))
    return render_template(Permiso)   

def ver():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Noticia.db = get_db()
        data = request.form
        noticia = Noticia.find_noticia_by_id(request.args.get('idNoticia'))
        noticia['fecha'] = noticia['fecha'].strftime("%d/%m/%Y")
        links = ((noticia['links']).split("\r"))
        noticia['links'] = links
        return render_template('noticia/ver_noticia.html', noticia = noticia)
    return render_template(Permiso) 
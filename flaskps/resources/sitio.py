from flask import redirect, render_template, request, url_for, session, abort
from flaskps.db import get_db
from flaskps.models.sitio import Sitio
from flaskps.helpers.auth import authenticated


def hello():
    return render_template('home.html')

def habSitio():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == 3:
        Sitio.db = get_db()
        Sitio.updateStateSitioHabilitar()
        return renderPanelAdmin()
    else:
        return render_template('autorizacion.html')

def deshSitio():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == 3:
        Sitio.db = get_db()
        Sitio.updateStateSitioDeshabilitar()
        return renderPanelAdmin()
    else:
        return render_template('autorizacion.html')

def renderPanelAdmin():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == 3:
        Sitio.db=get_db()
        stateSitio=Sitio.stateSitio()
        cantP=Sitio.cantPaginado()
        return render_template('panelAdmin.html',state=stateSitio[0]['estado'],cantPaginado=cantP[0]['cant_paginado'])
    else:
        return render_template('autorizacion.html')

def cambiarCantidad():
    if not session:
        return render_template('autorizacion.html')
    if session['rol'] == 3:
        Sitio.db = get_db()
        data = request.form
        Sitio.cambiarCantidad(data['select'])
        stateSitio=Sitio.stateSitio()
        cantP=Sitio.cantPaginado()
        return render_template('panelAdmin.html',state=stateSitio[0]['estado'],cantPaginado=cantP[0]['cant_paginado'],alertChangeCant=True)
    else:
        return render_template('autorizacion.html')

def autorizacion():
    return render_template('autorizacion.html')

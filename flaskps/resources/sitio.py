from flask import redirect, render_template, request, url_for, session, flash, abort
from flaskps.db import get_db
from flaskps.models.sitio import Sitio
from flaskps.models.comedor import Comedor
from flaskps.helpers.auth import *



def hello():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Comedor.db = get_db()
        comedores = Comedor.all()
        return render_template('home.html',comedores=comedores)
    return renderPanelAdmin(Permiso)    

def habSitio():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db = get_db()
        Sitio.updateStateSitioHabilitar()
        return renderPanelAdmin()
    return renderPanelAdmin(Permiso)    

def deshSitio():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db = get_db()
        Sitio.updateStateSitioDeshabilitar()
        return renderPanelAdmin()
    return renderPanelAdmin(Permiso)

def renderPanelAdmin():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db=get_db()
        stateSitio=Sitio.stateSitio()
        cantP=Sitio.cantPaginado()
        return render_template('admin/panelAdmin.html',state=stateSitio[0]['estado'],cantPaginado=cantP[0]['cant_paginado'])
    return renderPanelAdmin(Permiso)

def cambiarCantidad():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db = get_db()
        data = request.form
        Sitio.cambiarCantidad(data['select'])
        stateSitio=Sitio.stateSitio()
        cantP=Sitio.cantPaginado()
        flash(['La cantidad se cambio correctamente', 'green'])
        return render_template('admin/panelAdmin.html',state=stateSitio[0]['estado'],cantPaginado=cantP[0]['cant_paginado'])
    return renderPanelAdmin(Permiso)
    
def autorizacion():
    return render_template('autorizacion.html')

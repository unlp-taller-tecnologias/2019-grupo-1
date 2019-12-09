from flask import redirect, render_template, request, url_for, session, flash, abort, jsonify
from flaskps.db import get_db
from flaskps.models.sitio import Sitio
from flaskps.models.comedor import Comedor
from flaskps.helpers.auth import *
import json



def hello():
    Permiso = habilitedAcces()
    if Permiso == 'true':
        Comedor.db = get_db()
        Sitio.db=get_db()
        comedores = Comedor.all()
        nosotros = Sitio.getNosotros()
        return render_template('home.html',comedores=comedores,nosotros=nosotros)
    return render_template(Permiso)    

def habSitio():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db = get_db()
        Sitio.updateStateSitioHabilitar()
        return renderPanelAdmin()
    return render_template(Permiso)    

def deshSitio():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db = get_db()
        Sitio.updateStateSitioDeshabilitar()
        return renderPanelAdmin()
    return render_template(Permiso)

def renderPanelAdmin():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db=get_db()
        stateSitio=Sitio.stateSitio()
        cantP=Sitio.cantPaginado()
        noso=Sitio.getNosotros()
        a = Sitio.getRedes()
        f= a[0]['facebook']
        i= a[0]['instagram']
        t= a[0]['twitter']
        return render_template('admin/panelAdmin.html',state=stateSitio[0]['estado'],cantPaginado=cantP[0]['cant_paginado'],face=f,twi=t,ins=i,nosotros=noso)
    return render_template(Permiso)

def cambiarCantidad():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db = get_db()
        data = request.form
        Sitio.cambiarCantidad(data['select'])
        stateSitio=Sitio.stateSitio()
        cantP=Sitio.cantPaginado()
        flash(['La cantidad se cambio correctamente', 'green'])
        return redirect(url_for('panelAdmin'))
    return render_template(Permiso)
    
def autorizacion():
    return render_template('autorizacion.html')

def actualizarNosotros():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db = get_db()
        noso = request.form
        Sitio.cambiarNosotros(noso['nos'])
        flash(['El campo "nosotros" se cambio correctamente', 'green'])
        return redirect(url_for('panelAdmin'))
    else:
        return render_template(Permiso)

def actualizarRedes():
    Permiso = habilitedAccesAdmin()
    if Permiso == 'true':
        Sitio.db = get_db()
        redes = request.form
        Sitio.cambiarRedes(redes['t'],redes['f'],redes['i'])
        flash(['Las redes sociales se cambiaron correctamente', 'green'])
        return redirect(url_for('panelAdmin'))
    else:
        return render_template(Permiso)

def nosotros():
    Sitio.db = get_db()
    nosotros = Sitio.getNosotros()
    return render_template('nosotros.html', noso = nosotros[0]['nosotros'])

    
def getRedes():
    Sitio.db=get_db()
    redes = Sitio.getRedes()
    return jsonify(redes = redes)

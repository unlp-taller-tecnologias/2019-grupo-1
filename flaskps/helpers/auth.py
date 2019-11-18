from flask import redirect, render_template, request, url_for, session, abort
from flaskps.db import get_db
from flaskps.models.sitio import Sitio

#verifica que este habilitado
def habilitedAcces():
    Sitio.db = get_db()
    estado = Sitio.stateSitio()
    if estado[0]['estado'] == 1 or (session and session['rol'] == '3') :
        return 'true'
    else:
        return 'mantenimiento.html'

#verifica que este logueado
def habilitedAccesLogin():
    estado= habilitedAcces()
    if not session and estado == 'true':
        return 'autorizacion.html'
    return estado


def habilitedAccesComedor():
    estado= habilitedAccesLogin()
    if  (estado == 'true' and  session['rol'] == '1') or ( session and session['rol'] == '3' ) :
        return 'true'        
    return estado  

#verifica que sea admin
def habilitedAccesAdmin():
    estado= habilitedAccesLogin()
    if session and session['rol'] == '3' :
        return 'true'
    elif estado == 'true':
        return  'autorizacion.html'         
    return estado  

def habilitedAccesEdit(id):
    estado= habilitedAccesLogin()
    if  (estado == 'true' and  session['id'] == id ) or ( session and session['rol'] == '3' ) :
        return 'true'        
    return estado  
  
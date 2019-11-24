from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.models.necesidad import Necesidad
from flaskps.models.tiposDeNecesidades import Tipo_necesidad
from flaskps.models.comedor import Comedor
from flaskps.models.registro import Registro
from flaskps.models.tiposDeAlimentos import Alimento 
from flaskps.db import get_db
from flaskps.helpers.auth import *

def new():
	Permiso = habilitedAccesComedor()
	if Permiso == 'true': 
		Alimento.db = get_db()
		Comedor.db = get_db()
		tiposAli = Alimento.all()
		comedores = Comedor.allActives()
		return render_template('alta_registro_alimentacion.html',alimentos=tiposAli, comedores=comedores)
	return render_template(Permiso)
	

def create():
	Permiso = habilitedAccesComedor()
	if Permiso == 'true': 
		Alimento.db = get_db()
		Registro.db =get_db()
		alimentos = request.form.getlist('multi')
		data = request.form
		Registro.create(data, alimentos)
		flash(["Se creo el registro exitosamente!", 'green'])
		return redirect(url_for('new_registro'))
	return render_template(Permiso)

def edite():
	Permiso = habilitedAccesComedor()
	if Permiso == 'true':
		Registro.db = get_db()
		Alimento.db = get_db()
		Comedor.db = get_db()
		tiposAli = Alimento.all()
		comedores = Comedor.allActives()
		registro= Registro.getRegistro(request.args.get('idReg'))
		alimentosAnteriores=[] 
		for el in registro[0]['comidas']:
			alimentosAnteriores.append(el[0])
		return render_template('edite_registro.html',alimentos=tiposAli, comedores=comedores, registro=registro[0],alimentosAnteriores=alimentosAnteriores)
	return render_template(Permiso)	
	   
def editando():
	Permiso = habilitedAccesComedor()
	if Permiso == 'true': 
		Alimento.db = get_db()
		Registro.db =get_db()
		alimentos = request.form.getlist('multi')
		data = request.form
		alimentosAnteriores =[]
		registro= Registro.getRegistro(request.args.get('idReg'))
		for el in registro[0]['comidas']:
			alimentosAnteriores.append(str(el[1]))
		Registro.edite(data, alimentos,alimentosAnteriores,request.args.get('idReg'))
		flash(["Se edito el registro exitosamente!", 'green'])
		return redirect(url_for('list_registro'))
	return render_template(Permiso)	

def listar():
	Permiso = habilitedAccesLogin()
	if Permiso == 'true': 
		registrosCom = []
		Registro.db = get_db()
		Sitio.db = get_db()
		cantPag=Sitio.cantPaginado()
		registrosCom = Registro.getAllRegistros()
		return render_template('listadoRegistroComedor.html', regis = registrosCom, cant=cantPag[0]['cant_paginado'])
	return render_template(Permiso)
	

def eliminar():
	Permiso = habilitedAccesComedor()
	if Permiso == 'true': 
		Registro.db = get_db()
		Registro.delete(request.args.get('idReg'))
		flash(["El registro se elimino exitosamente" , 'green'])
		#falta lo de redireccionar con el idComedor= en el link
		return redirect(url_for('list_registro', idComedor=request.args.get('idComedor')))
	return render_template(Permiso)

	
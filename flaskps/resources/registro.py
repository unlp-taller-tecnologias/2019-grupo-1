from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.sitio import Sitio
from flaskps.models.necesidad import Necesidad
from flaskps.models.tiposDeNecesidades import Tipo_necesidad
from flaskps.models.comedor import Comedor
from flaskps.models.registro import Registro
from flaskps.models.tiposDeAlimentos import Alimento   
from flaskps.helpers.auth import authenticated
from flaskps.db import get_db

def new():
	Alimento.db = get_db()
	Comedor.db = get_db()
	tiposAli = Alimento.all()
	comedores = Comedor.allActives()
	return render_template('alta_registro_alimentacion.html',alimentos=tiposAli, comedores=comedores)

def create():
	Alimento.db = get_db()
	Registro.db =get_db()
	alimentos = request.form.getlist('multi')
	data = request.form
	Registro.create(data, alimentos)
	flash("Se creo la necesidad exitosamente!")   
	return redirect(url_for('new_registro'))

def listar():
	Registro.db = get_db()
	Sitio.db = get_db()
	cantPag=Sitio.cantPaginado()
	registrosCom = Registro.getRegistros(request.args.get('idComedor'))
	return render_template('listadoRegistroComedor.html', regis = registrosCom, cant=cantPag[0]['cant_paginado'])
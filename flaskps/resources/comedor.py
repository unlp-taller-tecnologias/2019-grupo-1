from flask import redirect, render_template, request, url_for, session, abort, flash, jsonify
from flaskps.models.user import User 
from flaskps.models.comedor import Comedor
from flaskps.helpers.auth import authenticated
from flaskps.db import get_db

def new():
    return render_template('alta_comedor.html' )

def create():

    Comedor.db = get_db()
    data = request.form
    exist =  User.find_user(data['user'])
    if not exist:
        Comedor.create(data)
        User.createRef(data)
        flash("El comedor debe ser confirmado por el Admin")
        return redirect(url_for('altaComedor' ))
    flash("Ya existe un usuario con ese nombre, elija otro!")   
    return redirect(url_for('altaComedor'))

    


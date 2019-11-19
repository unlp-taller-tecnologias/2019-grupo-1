from flask import redirect, render_template, request, url_for, abort, session, flash
from flaskps.db import get_db
from flaskps.models.user import User
from flaskps.models.comedor_usuario import Comedor_usuario


def login():
    return render_template('login.html')


def authenticate():
    params = request.form
    Comedor_usuario.db = get_db()
    User.db = get_db()
    user = User.find_by_email_and_pass(params['username'], params['pass'])

    if not user:
        flash(['El nombre de usuario y/o contraseña son incorrectas.', 'red'])
        return redirect(url_for('auth_login'))
    if user['estado_u'] == '2':
        flash(['El usuario no existe o fue rechazado del sistema.', 'red'])
        return redirect(url_for('auth_login'))
    session['username'] = user['user_name']
    session['id'] = user['id']
    session['rol'] = str(user['rol'])
    if user['rol'] == '1':
        session['idComedor'] = Comedor_usuario.find_comedor_by_userid(user['id'])['comedor_id']
    return redirect(url_for('index' ))



def logout():
    session.clear()
    return redirect(url_for('index'))

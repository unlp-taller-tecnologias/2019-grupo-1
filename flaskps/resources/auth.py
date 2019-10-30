from flask import redirect, render_template, request, url_for, abort, session, flash
from flaskps.db import get_db
from flaskps.models.user import User


def login():
    return render_template('login.html')


def authenticate():
    params = request.form

    User.db = get_db()
    user = User.find_by_email_and_pass(params['username'], params['pass'])

    if not user:
        flash('El nombre de usuario y/o contraseña son incorrectas.')
        return redirect(url_for('auth_login'))
    session['username'] = user['nombre_usuario']
    session['rol'] = user['rol']
    return redirect(url_for('index'))


def logout():
    del session['username']
    del session['rol']
    return redirect(url_for('index'))

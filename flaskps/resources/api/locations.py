from flask import jsonify
from flaskps.db import get_db
from flaskps.models.comedor import Comedor


def index():
    Comedor.db=get_db()
    comedor = Comedor.all()
    return jsonify(comedor =comedor)

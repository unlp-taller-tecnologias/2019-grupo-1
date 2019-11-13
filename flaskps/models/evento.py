class Evento(object):

    db = None


    @classmethod
    def create(cls, data, idUser, hoy):
        sql = """
            INSERT INTO evento (usuario_id,fecha,titulo,descripcion,fecha_evento,horario)
            VALUES (%s,%s,%s,%s,%s,%s)
        """
        cursor = cls.db.cursor()
        cursor.execute(sql,(idUser,hoy,data['titulo'],data['descripcion'],data['fecha_evento'],data['horario']))
        cls.db.commit()

        return True

    @classmethod
    def allEventos(cls):
        sql = """
            SELECT id,usuario_id,fecha,titulo,descripcion,fecha_evento,horario FROM evento WHERE estado_e=0
            """
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()


    @classmethod
    def find_evento_by_user(cls, idUser):
        sql = """   SELECT * FROM evento WHERE usuario_id = %s AND estado_e=0"""
        cursor = cls.db.cursor()
        cursor.execute(sql, idUser)
        return cursor.fetchall()

    @classmethod
    def delete(cls,idEvento):
        sql="""UPDATE evento SET estado_e=1 WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(idEvento))
        cls.db.commit()
        return True

    @classmethod
    def find_evento_by_id(cls, idEvento):
        sql = """   SELECT * FROM evento WHERE id = %s """
        cursor = cls.db.cursor()
        cursor.execute(sql, idEvento)
        return cursor.fetchone()

    @classmethod
    def edite(cls, data, hoy):
        sql = """  UPDATE evento  SET fecha=%s,titulo=%s, descripcion=%s, fecha_evento=%s, horario=%s  WHERE id =%s """
        cursor = cls.db.cursor()
        cursor.execute(sql, (hoy,data['titulo'],data['descripcion'],data['fecha_evento'],data['horario'],data['idEvento']))
        cls.db.commit()
        return True
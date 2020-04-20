class Evento(object):

    db = None


    @classmethod
    def create(cls, data, idUser, hoy):
        sql = """
            INSERT INTO evento (usuario_id,fecha,titulo,descripcion,fecha_evento,horario)
            VALUES (%s,%s,%s,%s,%s,%s)
        """
        x = data['fecha_evento'].split('/')
        x = x[2]+'-'+x[1]+'-'+x[0]
        cursor = cls.db.cursor()
        cursor.execute(sql,(idUser,hoy,data['titulo'],data['descripcion'],x,data['horario']))
        cls.db.commit()

        return True

    @classmethod
    def allEventos(cls, hoy):
        sql = """
            SELECT id,usuario_id,fecha,titulo,descripcion,fecha_evento,horario FROM evento WHERE estado_e=0 ORDER BY fecha_evento DESC
            """
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()


    @classmethod
    def find_evento_by_user(cls, idUser, hoy):
        sql = """   SELECT * FROM evento WHERE usuario_id = %s AND fecha_evento > %s AND estado_e=0"""
        cursor = cls.db.cursor()
        cursor.execute(sql,(idUser,hoy))
        return cursor.fetchall()

    @classmethod
    def delete(cls,idEvento):
        sql="""UPDATE evento SET estado_e=1 WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(idEvento))
        cls.db.commit()
        return True

    @classmethod
    def find_evento_by_id(cls, idEvento, hoy):
        sql = """   SELECT * FROM evento WHERE id = %s AND fecha_evento > %s"""
        cursor = cls.db.cursor()
        cursor.execute(sql, (idEvento, hoy))
        return cursor.fetchone()

    @classmethod
    def edite(cls, data, hoy):
        sql = """  UPDATE evento  SET fecha=%s,titulo=%s, descripcion=%s, fecha_evento=%s, horario=%s  WHERE id =%s """
        cursor = cls.db.cursor()
        cursor.execute(sql, (hoy,data['titulo'],data['descripcion'],data['fecha_evento'],data['horario'],data['idEvento']))
        cls.db.commit()
        return True

    @classmethod
    def find_evento_only_id(cls, idEvento):
        sql = """   SELECT * FROM evento WHERE id = %s"""
        cursor = cls.db.cursor()
        cursor.execute(sql, (idEvento))
        return cursor.fetchone()

    
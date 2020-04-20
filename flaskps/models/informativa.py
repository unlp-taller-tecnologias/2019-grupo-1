class Informativa(object):

    db = None


    @classmethod
    def create(cls, data, hoy):
        sql = """
            INSERT INTO informes_normativas (fecha,titulo,cuerpo,links,estado_n)
            VALUES (%s,%s,%s,%s,0)
        """
        cursor = cls.db.cursor()
        cursor.execute(sql,(hoy,data['titulo'],data['descripcion'],data['links']))
        cls.db.commit()
        return True

    @classmethod
    def allInformes(cls):
        sql = """
            SELECT id,fecha,titulo,cuerpo FROM informes_normativas WHERE estado_n=0 ORDER BY fecha
            """
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()


    @classmethod
    def delete(cls,idInform):
        sql="""UPDATE informes_normativas SET estado_n=1 WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(idInform))
        cls.db.commit()
        return True


    @classmethod
    def find_informe_by_id(cls, idInform):
        sql = """SELECT * FROM informes_normativas WHERE id = %s """
        cursor = cls.db.cursor()
        cursor.execute(sql, (idInform))
        return cursor.fetchone()


    @classmethod
    def edite(cls, data):
        sql = """  UPDATE informes_normativas SET fecha=%s,titulo=%s, cuerpo=%s, links=%s WHERE id =%s """

        cursor = cls.db.cursor()
        cursor.execute(sql, ( data['fecha'],data['titulo'],data['descripcion'],data['links'],data['idInform']))
        cls.db.commit()

        return True

    
    @classmethod
    def last_noticia(cls):
        sql = """
           SELECT id FROM informes_normativas ORDER BY id DESC LIMIT 1;"""

        cursor = cls.db.cursor()
        cursor.execute(sql)
        cls.db.commit()

        return cursor.fetchone()
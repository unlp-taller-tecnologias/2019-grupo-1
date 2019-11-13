class Noticia(object):

    db = None


    @classmethod
    def create(cls, data, hoy):
        sql = """
            INSERT INTO noticia (fecha,titulo,descripcion,foto,estado_n)
            VALUES (%s,%s,%s,%s,0)
        """
        cursor = cls.db.cursor()
        cursor.execute(sql,(hoy,data['titulo'],data['descripcion'],data['foto']))
        cls.db.commit()
        return True

    @classmethod
    def allNoticias(cls):
        sql = """
            SELECT id,fecha,titulo,descripcion,foto FROM noticia WHERE estado_n=0
            """
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()


    @classmethod
    def delete(cls,idNoticia):
        sql="""UPDATE noticia SET estado_n=1 WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(idNoticia))
        cls.db.commit()
        return True


    @classmethod
    def find_noticia_by_id(cls, idNoticia):
        sql = """   SELECT * FROM noticia WHERE id = %s """
        cursor = cls.db.cursor()
        cursor.execute(sql, idNoticia)
        return cursor.fetchone()


    @classmethod
    def edite(cls, data):
        sql = """  UPDATE noticia  SET fecha=%s,titulo=%s, descripcion=%s, foto=%s WHERE id =%s """

        cursor = cls.db.cursor()
        cursor.execute(sql, ( data['fecha'],data['titulo'],data['descripcion'],data['foto'],data['idNoticia']))
        cls.db.commit()

        return True
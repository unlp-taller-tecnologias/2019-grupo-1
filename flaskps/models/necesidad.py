class Tipo_necesidad(object):

    db = None

    @classmethod
    def all(cls):
        sql = """SELECT * FROM necesidad """
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

    @classmethod
    def create(cls, data):
        sql = """
            INSERT INTO necesidad (nombre)
            VALUES (%s)
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, nombre)
        cls.db.commit()

        return True

    
    @classmethod
    def find_tipo_necesidad_by_id(cls, user):
        sql = """
            SELECT * FROM necesidad AS u
            WHERE u.id = %s """

        cursor = cls.db.cursor()
        cursor.execute(sql, user)

        return cursor.fetchone()
   
    @classmethod
    def delete(cls,id):
        sql="""DELETE FROM necesidad WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,id)
        cls.db.commit()
        return True



class Necesidad(object):

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
            INSERT INTO necesidad (tipo_necesidad_id,estado,descripcion,comedor_id)
            VALUES (%s,0,%s,%s)
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, (data['tipo'],data['desc'],data['comedor']))
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



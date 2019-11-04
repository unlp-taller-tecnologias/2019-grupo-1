class Alimento(object):

    db = None

    @classmethod
    def all(cls):
        sql = """SELECT * FROM alimento """
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

    @classmethod
    def create(cls, nombre):
        sql = """
            INSERT INTO alimento (nombre)
            VALUES (%s)
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, nombre)
        cls.db.commit()

        return True

    
    @classmethod
    def find_alimento_by_id(cls, user):
        sql = """
            SELECT * FROM alimento AS u
            WHERE u.id = %s """

        cursor = cls.db.cursor()
        cursor.execute(sql, user)

        return cursor.fetchone()
   
    @classmethod
    def delete(cls,id):
        sql="""DELETE FROM alimento WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,id)
        cls.db.commit()
        return True






    
    
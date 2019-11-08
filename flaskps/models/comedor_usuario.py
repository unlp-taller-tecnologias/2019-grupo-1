class Comedor_usuario(object):
    
    db = None

    @classmethod
    def all(cls):
        sql = """SELECT * FROM comedor_usuario WHERE id=%s """
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

    @classmethod
    def create(cls, comedor, referente):
        sql = """
            INSERT INTO comedor_usuario (comedor_id,referente_id)
            VALUES (%s, %s)
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, (comedor,referente))
        cls.db.commit()

        return True
    
    @classmethod
    def find_comedor_by_userid(cls, user):
        sql = """
            SELECT * FROM comedor_usuario AS u
            WHERE u.referente_id = %s """

        cursor = cls.db.cursor()
        cursor.execute(sql, user)

        return cursor.fetchone()
    
    @classmethod
    def find_user_by_comedorid(cls, cm):
        sql = """ SELECT * FROM comedor_usuario WHERE comedor_id = %s """
        cursor = cls.db.cursor()
        cursor.execute(sql, cm)

        return cursor.fetchone()
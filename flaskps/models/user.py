class User(object):

    db = None

    @classmethod
    def all(cls):
        sql = """SELECT * FROM usuario WHERE NOT estado=2 """
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

    @classmethod
    def create(cls, data):
        sql = """
            INSERT INTO usuario (nombre, apellido, mail, password,user_name,descripcion,foto,telefono,estado,privado,rol)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, 0 , 0 , 0)
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, (data['nombre'], data['apellido'], data['mail'], data['pass'], data['user'],data['desc'], data['foto'], data['tel']))
        cls.db.commit()

        return True

    @classmethod
    def find_by_email_and_pass(cls, email, password):
        sql = """
            SELECT * FROM usuario AS u
            WHERE u.user_name = %s AND u.password = %s
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, (email, password))

        return cursor.fetchone()

    @classmethod
    def find_user(cls, user):
        sql = """
            SELECT * FROM usuario AS u
            WHERE u.user_name = %s """

        cursor = cls.db.cursor()
        cursor.execute(sql, user)

        return cursor.fetchone()
    
    @classmethod
    def find_user_by_id(cls, user):
        sql = """
            SELECT * FROM usuario AS u
            WHERE u.id = %s """

        cursor = cls.db.cursor()
        cursor.execute(sql, user)

        return cursor.fetchone()


    @classmethod
    def allUsers(cls):
        sql = """SELECT u.id,u.nombre,u.apellido,u.dni,u.estado,u.nombre_usuario FROM usuario AS u"""
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

   
    @classmethod
    def delete(cls,idUser):
        sql="""UPDATE usuario SET estado=2 WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(idUser))
        cls.db.commit()
        return True



    
    
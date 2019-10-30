class User(object):

    db = None

    @classmethod
    def all(cls):
        sql = """SELECT * FROM usuario WHERE NOT estado="Deleted" """
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

    @classmethod
    def create(cls, data):
        sql = """
            INSERT INTO usuario (nombre, apellido, dni, nombre_usuario,password,rol,estado)
            VALUES (%s, %s, %s, %s, %s,0 ,"activado")
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, (data['nombre'], data['apellido'], data['dni'], data['user'], data['pass']))
        cls.db.commit()

        return True

    @classmethod
    def find_by_email_and_pass(cls, email, password):
        sql = """
            SELECT * FROM usuario AS u
            WHERE u.nombre_usuario = %s AND u.password = %s
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, (email, password))

        return cursor.fetchone()

    @classmethod
    def find_user(cls, user):
        sql = """
            SELECT * FROM usuario AS u
            WHERE u.nombre_usuario = %s """

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
    def allUsersDeactivate(cls):
        sql = """SELECT * FROM usuario WHERE estado="Desactivado" """
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

    @classmethod
    def unBlock(cls,idUser):
        sql="""UPDATE usuario SET estado="Activado" WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(idUser))
        cls.db.commit()
        return True

    @classmethod
    def block(cls,idUser):
        sql="""UPDATE usuario SET estado="Desactivado" WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(idUser))
        cls.db.commit()
        return True

    @classmethod
    def allUsers(cls):
        sql = """SELECT u.id,u.nombre,u.apellido,u.dni,u.estado,u.nombre_usuario FROM usuario AS u"""
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

   
    @classmethod
    def delete(cls,idUser):
        sql="""UPDATE usuario SET estado="Deleted" WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(idUser))
        cls.db.commit()
        return True

    
    @classmethod
    def updateRol(cls,idUser,rol):
        sql="""UPDATE usuario SET rol=%s WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(rol,idUser))
        cls.db.commit()
        return True

    
    
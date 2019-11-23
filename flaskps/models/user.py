class User(object):

    db = None

    # estado : 0= pendiente , 1= aceptado , 2 eliminado

    @classmethod
    def all(cls):
        sql = """SELECT * FROM usuario WHERE NOT estado=2 """
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

    @classmethod
    def create(cls, data,foto):
        sql = """
            INSERT INTO usuario (nombre_u, apellido, mail_u, password,user_name,descripcion,foto,telefono,estado_u,privado,rol)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, 0 , 0 , 0)
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, (data['nombre'], data['apellido'], data['mail'], data['pass'], data['user'],data['desc'],foto, data['tel']))
        cls.db.commit()

        return True

    @classmethod
    def createRef(cls, data):
        sql = """
            INSERT INTO usuario (nombre_u, apellido, mail_u, password,user_name,descripcion,foto,telefono,estado_u,privado,rol)
            VALUES (%s, %s, %s, %s, %s, %s, 'none' , %s, 0 , 0 , 1)
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, (data['nombre'], data['apellido'], data['mail'], data['pass'], data['user'],data['desc'], data['tel']))
        cls.db.commit()

        return True

    @classmethod
    def last_user(cls):
        sql = """
           SELECT id FROM usuario ORDER BY id DESC LIMIT 1;"""

        cursor = cls.db.cursor()
        cursor.execute(sql)
        cls.db.commit()
        return cursor.fetchone()
    
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
        sql = """SELECT u.id,u.nombre_u,u.mail_u,u.apellido,u.estado_u,u.user_name FROM usuario AS u 
                WHERE u.rol <> 1 AND u.estado_u <> 3"""
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

   
    @classmethod
    def delete(cls,idUser):
        sql="""UPDATE usuario SET estado_u=2 WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(idUser))
        cls.db.commit()
        return True

    @classmethod
    def allUsersP(cls):
        sql = """SELECT u.id,u.nombre_u,u.mail_u,u.apellido,u.estado_u,u.user_name 
        FROM usuario AS u
        WHERE u.estado_u=0 AND u.rol <> 1
        """
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod
    def updateRol(cls,rol,idUser):
        sql="""UPDATE usuario SET estado_u=%s WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(rol,idUser))
        cls.db.commit()
        return True



    @classmethod
    def editeRef(cls, data):
        sql = """UPDATE usuario SET nombre_u= %s, apellido= %s, mail_u=%s, password=%s, user_name=%s, telefono=%s
                WHERE id=%s"""
        cursor = cls.db.cursor()
        cursor.execute(sql,(data['nombreR'],data['apellidoR'],data['mailR'],data['pass'],data['user'],data['telR'],data['idRef']))
        cls.db.commit()
        
        return True
    
    @classmethod
    def edite(cls, data,foto):
        sql = """UPDATE usuario SET nombre_u= %s, apellido= %s, mail_u=%s, password=%s, user_name=%s, descripcion=%s ,foto=%s, telefono=%s
                WHERE id=%s"""
        cursor = cls.db.cursor()
        cursor.execute(sql,(data['nombre'],data['apellido'],data['mail'],data['pass'],data['user'],data['desc'],foto,data['tel'],data['idU']))
        cls.db.commit()
        
        return True

    @classmethod
    def find_user_by_idComedor(cls, idComedor):
        sql = """
            SELECT * FROM usuario AS u
            INNER JOIN comedor_usuario AS ca ON (ca.referente_id = u.id)
            WHERE ca.comedor_id = %s """

        cursor = cls.db.cursor()
        cursor.execute(sql, idComedor)

        return cursor.fetchone()

    
    
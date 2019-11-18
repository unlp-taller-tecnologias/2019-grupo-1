class Comedor(object):

    db = None

    # estado : 0= pendiente , 1= aceptado , 2 eliminado
    
    @classmethod
    def all(cls):
        sql = """SELECT * FROM comedor WHERE NOT estado=2 """
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()
        
    @classmethod
    def allActives(cls):
        sql = """SELECT * FROM comedor WHERE estado=1 """
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

    @classmethod
    def create(cls, data,foto):
        sql = """
            INSERT INTO comedor (nombre, direccion, descripcion, organizacion,foto,estado,telefono,red_social,latitud,longitud,dia_yhorario)
            VALUES (%s, %s, %s, %s, %s, 0, %s, %s, %s, %s, %s)
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, (data['nombreC'], data['dir'], data['desc'], data['org'], foto, data['telC'], data['red'],data['lat'], data['lng'], data['dias']))
        cls.db.commit()
        
        return True

    @classmethod
    def edite(cls, data):
        sql = """UPDATE comedor SET nombre = %s, direccion=%s, descripcion=%s, organizacion=%s,foto=%s,telefono=%s,red_social=%s,latitud=%s,longitud=%s,dia_yhorario=%s
                WHERE id=%s"""
        cursor = cls.db.cursor()
        cursor.execute(sql,(data['nombreC'],data['dir'],data['desc'],data['org'],data['foto'],data['telC'],data['red'],data['lat'], data['lng'], data['dias'],data['idComedor']))
        cls.db.commit()
        
        return True
    
    @classmethod
    def find_comedor_by_id(cls, id):
        sql = """ SELECT * FROM comedor WHERE id=%s """
        cursor = cls.db.cursor()
        cursor.execute(sql,id)
        return cursor.fetchone()

    @classmethod
    def allComedoresP(cls):
        sql = """
            SELECT DISTINCT comedor.id,comedor.nombre,usuario.user_name,usuario.apellido,comedor.direccion,comedor.estado 
            FROM comedor
            INNER JOIN comedor_usuario ON comedor.id = comedor_usuario.comedor_id
            INNER JOIN usuario ON comedor_usuario.referente_id = usuario.id
            WHERE comedor.estado=0
            """

        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()


    @classmethod
    def last_comedor(cls):
        sql = """
           SELECT id FROM comedor ORDER BY id DESC LIMIT 1;"""

        cursor = cls.db.cursor()
        cursor.execute(sql)
        cls.db.commit()

        return cursor.fetchone()

    @classmethod
    def allComedores(cls):
        sql = """
            SELECT comedor.id,comedor.nombre,usuario.user_name,usuario.apellido,comedor.direccion FROM comedor
            INNER JOIN comedor_usuario ON comedor.id = comedor_usuario.comedor_id
            INNER JOIN usuario ON comedor_usuario.referente_id = usuario.id
            WHERE comedor.estado=1
            """

        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()

    # Solo elimina, No controla que haya publicaciones pendientes
    @classmethod
    def delete(cls,idComedor):
        sql="""UPDATE comedor SET estado=2 WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(idComedor))
        cls.db.commit()
        return True

    @classmethod
    def updateRol(cls,rol,idCom):
        sql="""UPDATE comedor SET estado=%s WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,(rol,idCom))
        cls.db.commit()
        return True



    
    
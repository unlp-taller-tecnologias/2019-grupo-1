class Necesidad(object):

    db = None

    @classmethod
    def all(cls):
        sql = """
            SELECT necesidad.id,necesidad.descripcion,necesidad.subtipo,tipo_necesidad.nombre, comedor.id as idC, comedor.nombre as nombreC FROM necesidad
            INNER JOIN tipo_necesidad ON tipo_necesidad.id = necesidad.tipo_necesidad_id
            INNER JOIN comedor ON comedor.id = necesidad.comedor_id
            WHERE necesidad.estado=0
            """
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()
    
    @classmethod
    def find_tipo_necesidad_by_comedorid(cls,id):
        sql = """
            SELECT necesidad.id as idN, necesidad.descripcion,necesidad.estado,tipo_necesidad.nombre, comedor.id, comedor.nombre as nombreC FROM necesidad
            INNER JOIN tipo_necesidad ON tipo_necesidad.id = necesidad.tipo_necesidad_id
            INNER JOIN comedor ON comedor.id = necesidad.comedor_id
            WHERE comedor.id=%s
            """   
        cursor = cls.db.cursor()
        cursor.execute(sql, id)

        return cursor.fetchall()     

    @classmethod
    def create(cls, data):
        sql = """
            INSERT INTO necesidad (tipo_necesidad_id,estado,descripcion,comedor_id,subtipo)
            VALUES (%s,0,%s,%s,%s)
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, (data['tipo'],data['desc'],data['comedor'],data['subtipo']))
        cls.db.commit()

        return True

    
    @classmethod
    def edite(cls, data):
        sql = """  UPDATE necesidad  SET tipo_necesidad_id=%s,comedor_id=%s, descripcion=%s, subtipo=%s WHERE id =%s """

        cursor = cls.db.cursor()
        cursor.execute(sql, ( data['tipo'],data['comedor'],data['desc'],data['idU'],data['subtipo']))
        cls.db.commit()

        return True
    
        
    @classmethod
    def cumplir(cls, id):
        sql = """  UPDATE necesidad  SET estado= 1 WHERE id = %s """

        cursor = cls.db.cursor()
        cursor.execute(sql, id)
        cls.db.commit()

        return True
    
    @classmethod
    def find_necesidad_by_id(cls, user):
        sql = """   SELECT * FROM necesidad WHERE id = %s """
        

        cursor = cls.db.cursor()
        cursor.execute(sql, user)

        return cursor.fetchone()
    
        
    @classmethod
    def find_tipo_necesidades(cls):
        sql = """  SELECT tipo_necesidad_id FROM necesidad """

        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()
    
    @classmethod
    def delete(cls,id):
        sql="""DELETE FROM necesidad WHERE id=%s"""
        cursor=cls.db.cursor()
        cursor.execute(sql,id)
        cls.db.commit()
        return True



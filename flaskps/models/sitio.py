class Sitio(object):

    db = None


    @classmethod
    def updateStateSitioHabilitar(cls):
        sql="""UPDATE sitio SET estado=1"""
        cursor=cls.db.cursor()
        cursor.execute(sql)
        cls.db.commit()
        return True

    @classmethod
    def updateStateSitioDeshabilitar(cls):
        sql="""UPDATE sitio SET estado=0"""
        cursor=cls.db.cursor()
        cursor.execute(sql)
        cls.db.commit()
        return True

    @classmethod
    def stateSitio(cls):
        sql = 'SELECT estado FROM sitio'
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()   

    @classmethod
    def cantPaginado(cls):
        sql = 'SELECT cant_paginado FROM sitio'
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall() 

    @classmethod
    def cambiarCantidad(cls,cant):
        sql="UPDATE sitio SET cant_paginado=%s"
        cursor=cls.db.cursor()
        cursor.execute(sql,(cant))
        cls.db.commit()
        return True
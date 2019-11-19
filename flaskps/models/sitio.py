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
    def getRedes(cls):
        sql = 'SELECT facebook,twitter,instagram FROM sitio'
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

    @classmethod
    def cambiarNosotros(cls,nos):
        sql = "UPDATE sitio SET nosotros = %s "
        cursor=cls.db.cursor()
        cursor.execute(sql,(nos))
        cls.db.commit()
        return True

    @classmethod
    def cambiarRedes(cls,t,f,i):
        sql = "UPDATE sitio SET twitter = %s , facebook = %s , instagram = %s "
        cursor=cls.db.cursor()
        cursor.execute(sql,(t,f,i))
        cls.db.commit()
        return True

    @classmethod
    def getNosotros(cls):
        sql = "SELECT nosotros FROM sitio"
        cursor=cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()
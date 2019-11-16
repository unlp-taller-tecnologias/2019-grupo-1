import datetime
class Registro(object):

	db = None
	
	@classmethod
	def create(cls,data,alimentos):
		lis=[]
		sql = """INSERT INTO registro_alimentacion (fecha, asistentes, observaciones, horario_comida, id_comedor) 
			VALUES (%s, %s, %s, %s, %s); """


		sqlformatdate=datetime.datetime.strptime(data['dia'], "%d/%m/%Y").strftime("%Y-%m-%d")
		cursor = cls.db.cursor()
		cursor.execute(sql, (sqlformatdate,data['cant'],data['desc'],data['tipoComida'],data['idCome']))

		for elem in alimentos:
			lis.append(  """ INSERT INTO alimento_xreg (registro_id, alimento_id) 
			VALUES ("""+str(cursor.lastrowid)+""", """+elem+"""); """)
     
		for consulta in lis:
			cursor.execute(consulta)

		cls.db.commit()

		return True

	@classmethod
	def getRegistros(cls,idComedor):
		sql = """ SELECT r_a.*, comedor.nombre
				FROM registro_alimentacion AS r_a
				INNER JOIN comedor ON (r_a.id_comedor = comedor.id)
				WHERE (comedor.id = """+ idComedor +""")"""
		cursor = cls.db.cursor()
		cursor.execute(sql)
		regis = cursor.fetchall()
		for elem in regis:
			elem['fecha'] = elem['fecha'].strftime("%d/%m/%Y")
			sql2= """ SELECT a.nombre 
					FROM alimento_xreg AS ax 
					INNER JOIN alimento AS a ON (ax.alimento_id = a.id)
					WHERE (ax.registro_id ="""+ str(elem['id']) +""")
			"""
			cursor = cls.db.cursor()
			cursor.execute(sql2)
			comidas = cursor.fetchall()
			elem['comidas'] = []
			for c in comidas:
				elem['comidas'].append(c['nombre'])
		return regis

	@classmethod
	def delete(cls,idR):
		sql = """ DELETE FROM registro_alimentacion WHERE registro_alimentacion.id = """+idR
		sql2 = """ DELETE FROM alimento_xreg  WHERE alimento_xreg.registro_id = """+idR
		cursor = cls.db.cursor()
		cursor.execute(sql2)
		cursor.execute(sql)

		cls.db.commit()


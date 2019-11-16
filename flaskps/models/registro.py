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
		sql = """ SELECT al_reg.registro_id,a.nombre,comedor.nombre,r_a.fecha,r_a.asistentes,r_a.observaciones,r_a.horario_comida
				FROM registro_alimentacion AS r_a
				INNER JOIN comedor ON (r_a.id_comedor = comedor.id)
				INNER JOIN alimento_xreg as al_reg ON (al_reg.registro_id = r_a.id)
				INNER JOIN alimento AS a ON (a.id = al_reg.alimento_id)
				WHERE (comedor.id = """+ idComedor +""")"""
		cursor = cls.db.cursor()
		cursor.execute(sql)
		
		return cursor.fetchall()
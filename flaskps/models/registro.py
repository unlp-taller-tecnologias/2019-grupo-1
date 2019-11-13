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

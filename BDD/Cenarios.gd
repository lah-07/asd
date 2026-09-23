class_name Cenarios

static func salvar_cenarios(db, cena, imagem):
	var sql = """
	INSERT INTO Cenarios (cena, imagem)
	VALUES (?, ?)
	ON CONFLICT(cena)
	DO UPDATE SET imagem = excluded.imagem;
	"""
	
	db.query_with_bindings(sql, [
		cena,
		imagem
	])
	
	print("Cena salva: ", cena)


static func get_cena(db, cena):
	var sql = """
	SELECT id, cena, imagem
	FROM Cenarios
	WHERE cena = ?;
	"""
	
	db.query_with_bindings(sql, [cena])
	
	var resultado = db.get_query_result()
	
	if resultado.size() > 0:
		return resultado
	
	return null


static func delete_cena(db, cena):
	var sql = """
	DELETE FROM Cenarios
	WHERE cena = ?;
	"""
	
	db.query_with_bindings(sql, [cena])
	
	print("Cena deletada: ", cena)

class_name Config

static func salvar_configuracao(db, config, valor):
	var sql = """
	INSERT INTO Config (config, valor)
	VALUES (?, ?)
	ON CONFLICT(config)
	DO UPDATE SET valor = excluded.valor;
	"""
	
	db.query_with_bindings(sql, [
		config,
		valor
	])
	
	print("Cena salva: ", config)


static func get_config(db, config):
	var sql = """
	SELECT id, config, valor
	FROM Config
	WHERE config = ?;
	"""
	
	db.query_with_bindings(sql, [config])
	
	var resultado = db.get_query_result()
	
	if resultado.size() > 0:
		return resultado
	
	return null


static func delete_config(db, config):
	var sql = """
	DELETE FROM Config
	WHERE config = ?;
	"""
	
	db.query_with_bindings(sql, [config])
	
	print("Cena deletada: ", config)

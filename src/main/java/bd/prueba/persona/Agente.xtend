package bd.prueba.persona

import java.sql.ResultSet

class Agente extends Persona {
	Double comision_anual
	Persona persona

	new(){}

	new(int id, String nombre, String direccion, Integer tel, Integer dni, String tipo, Double comision) {
		super(id, nombre, direccion, tel, dni, tipo)
		this.comision_anual = comision
	}
	
	def static Agente fromSQL(ResultSet resultado) {
		return new Agente => [
			persona = Persona.fromSQL(resultado)
			comision_anual = resultado.getDouble("comision_anual")
		]
	}

}

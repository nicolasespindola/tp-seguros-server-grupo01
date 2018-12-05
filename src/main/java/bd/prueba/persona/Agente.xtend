package bd.prueba.persona

class Agente extends Persona {
	Double comision_anual

	new(int _id, String _nombre, String _direccion, int _tel, int _dni, String _tipo, Double _comision) {
		super(_id, _nombre, _direccion, _tel, _dni, _tipo)
		this.comision_anual = _comision
	}

}

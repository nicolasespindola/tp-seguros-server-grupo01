package bd.prueba.persona

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Beneficiario extends Persona {
	int id_vinculo
	String lazo_o_vinculo
	new(int _id, String _nombre, String _direccion, int _tel, int _dni, String _tipo,
		String _lazo, int _vinculo) {
		super(_id, _nombre, _direccion, _tel, _dni, _tipo)
		this.id_vinculo = _vinculo
		this.lazo_o_vinculo = _lazo
	}

}

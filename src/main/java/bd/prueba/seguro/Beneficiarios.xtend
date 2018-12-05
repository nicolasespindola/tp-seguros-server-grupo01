package bd.prueba.seguro

import org.eclipse.xtend.lib.annotations.Accessors
import bd.prueba.persona.Beneficiario

@Accessors
class Beneficiarios extends Beneficiario {
	new(int _id, String _nombre, String _direccion, int _tel, int _dni, String _tipo, String _lazo, int _vinculo,
		int _seguro, double porcentaje) {
		super(_id, _nombre, _direccion, _tel, _dni, _tipo, _lazo, _vinculo)
		this.id_seguro = _seguro
		this.porcentaje_asignado = porcentaje
	}
	
	int id_seguro
	double porcentaje_asignado
}

package bd.prueba.persona

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Beneficiario extends Persona {
	Integer id_vinculo
	String lazo_o_vinculo
	
	new(Integer id, String nombre, String direccion, Integer tel, Integer dni, String tipo, String lazo, Integer vinculo) {
		super(id, nombre, direccion, tel, dni, tipo)
		this.id_vinculo = vinculo
		this.lazo_o_vinculo = lazo
	}

}

package bd.prueba.seguro

import bd.prueba.persona.Ocupacion
import bd.prueba.persona.Beneficiario
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class SeguroDeVida {
	Seguro seguro
	Cobertura tipo_de_cobertura
	Ocupacion ocupacion
	Set<Beneficiario> beneficiarios
	
	new(Seguro seguro, Cobertura cobertura, Ocupacion ocupacion, Set<Beneficiario> beneficiarios){
		this.seguro = seguro
		this.tipo_de_cobertura = cobertura
		this.ocupacion = ocupacion
		this.beneficiarios = beneficiarios
	}
}
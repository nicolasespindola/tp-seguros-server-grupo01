package bd.prueba.seguro

import bd.prueba.persona.Beneficiario
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class SeguroVida extends Seguro {
	String ocupacion
	String cobertura
	Set<Beneficiarios> beneficiarios = newHashSet
	
}
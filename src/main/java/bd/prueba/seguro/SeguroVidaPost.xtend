package bd.prueba.seguro

import org.eclipse.xtend.lib.annotations.Accessors
import bd.prueba.persona.Beneficiario
import java.util.Set

@Accessors
class SeguroVidaPost {
	int id_cliente
	int id_agente
	String fecha_inicio
	String fecha_vencimiento
	double prima
	double suma_asegurada
	int id_tipo_de_cobertura
	int id_ocupacion
	Set<Beneficiario> beneficiarios
}
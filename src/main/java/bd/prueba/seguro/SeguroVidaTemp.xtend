package bd.prueba.seguro

import bd.prueba.persona.Beneficiario
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import java.sql.ResultSet

@Accessors
class SeguroVidaTemp {
	int id_seguro
	int id_tipo_de_cobertura
	int id_ocupacion
	
	def static fromSQL(ResultSet rs){
		return new SeguroVidaTemp => [
			id_seguro = rs.getInt("id_seguro_de_vida")
			id_tipo_de_cobertura = rs.getInt("id_tipo_de_cobertura")
			id_ocupacion = rs.getInt("id_ocupacion")
		]
	}
}
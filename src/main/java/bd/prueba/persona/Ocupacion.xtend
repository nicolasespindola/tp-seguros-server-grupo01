package bd.prueba.persona

import java.sql.ResultSet
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ocupacion {
	Integer id_ocupacion
	String descripcion
	Double valor_de_riesgo
	
	def static fromSQL(ResultSet rs) {
		return new Ocupacion => [
			id_ocupacion = rs.getInt("id_ocupacion")
			descripcion = rs.getString("descripcion")
			valor_de_riesgo = rs.getDouble("valor_de_riesgo")
		]
	}
	
}
package bd.prueba.seguro

import java.sql.ResultSet
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Cobertura {
	int id_tipo_de_cobertura
	double valor_prima_base
	String tipo
	String descripcion
	
	def static fromSQL(ResultSet rs) {
		return new Cobertura => [
			id_tipo_de_cobertura = rs.getInt("id_tipo_de_cobertura")
			valor_prima_base = rs.getDouble("valor_prima_base")
			tipo = rs.getString("tipo")
			descripcion = rs.getString("descripcion")
		]
	}
	
}
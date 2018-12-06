package bd.prueba.seguro

import java.time.LocalDateTime
import java.sql.Date
import org.eclipse.xtend.lib.annotations.Accessors
import java.sql.ResultSet
import bd.prueba.persona.Cliente

@Accessors
class Seguro {
	Cliente cliente
	int id_seguro
	int id_agente
	String estado
	Date fecha_inicio
	Date fecha_vencimiento
	double prima
	String tipo
	
	def static fromSQL(ResultSet rs) {
		return new Seguro => [
			id_seguro = rs.getInt("id_seguro")
			id_agente = rs.getInt("id_agente")
			estado = rs.getString("descripcion")
			fecha_inicio = rs.getDate("fecha_inicio")
			fecha_vencimiento = rs.getDate("fecha_vencimiento")
			prima = rs.getInt("prima")
			tipo = rs.getString("tipo")
		]
	}
	
}
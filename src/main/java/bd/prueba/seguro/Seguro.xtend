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
			prima = rs.getDouble("prima")
			tipo = rs.getString("tipo")
		]
	}
	
}
@Accessors
class SeguroShort{
	int id_seguro
	String nombreCliente
	Date fecha_inicio
	Date fecha_vencimiento
	double prima
	String tipo_de_cobertura
	String estado
	def static fromSQL(ResultSet rs) {
		return new SeguroShort => [
			id_seguro = rs.getInt("id_seguro")
			nombreCliente=rs.getString("nombre")
			fecha_inicio = rs.getDate("fecha_inicio")
			fecha_vencimiento = rs.getDate("fecha_vencimiento")
			prima = rs.getDouble("prima")
			tipo_de_cobertura = rs.getString("tipo_de_cobertura")
			estado = rs.getString("Estado")
		]
	}
}
package bd.prueba.seguro

import java.time.LocalDateTime
import java.sql.Date
import org.eclipse.xtend.lib.annotations.Accessors
import java.sql.ResultSet
import bd.prueba.persona.Cliente
import com.fasterxml.jackson.annotation.JsonIgnore
import java.text.SimpleDateFormat
import java.text.DateFormat
import com.fasterxml.jackson.annotation.JsonProperty

@Accessors
class Seguro {
	@JsonIgnore DateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd")
	Cliente cliente
	int id_seguro
	int id_agente
	String estado
	@JsonIgnore Date fecha_inicio
	@JsonIgnore Date fecha_vencimiento
	double prima
	String tipo

	@JsonProperty("fecha_inicio")
	def _fecha_inicio() {
		return dateFormat.format("fecha_inicio")
	}

	@JsonProperty("fecha_vencimiento")
	def _fecha_vencimiento() {
		return dateFormat.format("fecha_vencimiento")
	}

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
class SeguroShort {
	@JsonIgnore DateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd")
	int id_seguro
	String nombreCliente
	@JsonIgnore Date fecha_inicio
	@JsonIgnore Date fecha_vencimiento
	double prima
	String tipo_de_cobertura
	String estado

	@JsonProperty("fecha_inicio")
	def _fecha_inicio() {
		return dateFormat.format(fecha_inicio)
	}

	@JsonProperty("fecha_vencimiento")
	def _fecha_vencimiento() {
		return dateFormat.format(fecha_vencimiento)
	}

	def static fromSQL(ResultSet rs) {
		return new SeguroShort => [
			id_seguro = rs.getInt("id_seguro")
			nombreCliente = rs.getString("nombre")
			fecha_inicio = rs.getDate("fecha_inicio")
			fecha_vencimiento = rs.getDate("fecha_vencimiento")
			prima = rs.getDouble("prima")
			tipo_de_cobertura = rs.getString("tipo_de_cobertura")
			estado = rs.getString("Estado")
		]
	}
}

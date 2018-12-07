package bd.prueba.conexion

import java.sql.ResultSet
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Reporte {
	Integer idAgente
	String nombreAgente
	Integer polizasVigentes
	Double comisionAnual
	
	def static fromSQL(ResultSet resultado) {
		return new Reporte => [
			idAgente = resultado.getInt("ID_Agente")
			nombreAgente = resultado.getString("Nombre")
			polizasVigentes = resultado.getInt("Polizas_Vigentes")
			comisionAnual = resultado.getDouble("Comision_Anual")
		]
	}
}

package bd.prueba.persona

import org.eclipse.xtend.lib.annotations.Accessors
import java.sql.ResultSet

@Accessors
class Beneficiario{
	Persona persona
	String lazo_o_vinculo
	Double porcentaje_asignado
	
	def static fromSQL(ResultSet rs){
		return new Beneficiario => [
			persona = Persona.fromSQL(rs)
			lazo_o_vinculo = rs.getString("lazo_o_vinculo")
			porcentaje_asignado = rs.getDouble("porcentaje_asignado")
		]
	}
}

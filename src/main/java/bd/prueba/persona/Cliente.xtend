package bd.prueba.persona

import java.sql.Date
import java.sql.ResultSet
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Cliente {
	Persona persona
	Date fecha_de_nacimiento
	Integer id_seguro_vinculado
	List<Beneficiario> beneficiarios = new ArrayList

	new(){}

	def static fromSQL(ResultSet resultado) {
		return new Cliente => [
			persona = Persona.fromSQL(resultado)
			fecha_de_nacimiento = resultado.getDate("`Fecha_De_Nacimiento`")
			//id_seguro_vinculado = resultado.getInt("id_seguro_vinculado")
		]
	}

}

package bd.prueba.persona

import java.time.LocalDateTime
import bd.prueba.seguro.SeguroVida
import bd.prueba.seguro.Seguro
import java.util.Set
import java.sql.Date
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import java.sql.ResultSet

@Accessors
class Cliente {
	Persona persona
	Date fecha_de_nacimiento
	int id_seguro_vinculado
	List<Beneficiario> beneficiarios = new ArrayList

	new() {
	}

	def static fromSQL(ResultSet resultado) {

		return new Cliente => [
			persona = Persona.fromSQL(resultado)
			fecha_de_nacimiento = resultado.getDate("fecha_de_nacimiento")
			id_seguro_vinculado = resultado.getInt("id_seguro_vinculado")
		]
	}

}

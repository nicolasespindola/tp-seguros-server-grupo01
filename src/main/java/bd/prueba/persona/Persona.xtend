package bd.prueba.persona
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import bd.prueba.seguro.Seguro
import java.util.ArrayList
import java.sql.ResultSet

@Accessors
class Persona {
	int id_persona
	String nombre
	String direccion
	int telefono
	int dni
	String tipo
	List<Seguro> seguros = new ArrayList()
	new(){
		
	}
	new(int _id, String _nombre, String _direccion, int _tel, int _dni, String _tipo) {
		this.id_persona = _id
		this.nombre = _nombre
		this.direccion = _direccion
		this.telefono = _tel
		this.dni = _dni
		this.tipo = _tipo
	}
	def static fromSQL(ResultSet resultado) {

		return new Persona => [
			id_persona = (resultado.getInt("id_persona"))
			nombre = resultado.getString("nombre")
			direccion = resultado.getString("direccion")
			telefono = resultado.getInt("telefono")
			dni = resultado.getInt("dni")
		]
	}

}

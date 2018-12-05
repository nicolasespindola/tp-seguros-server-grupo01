package bd.prueba.persona

import bd.prueba.seguro.Seguro
import java.sql.ResultSet
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Persona {
	Integer id_persona
	String nombre
	String direccion
	Integer telefono
	Integer dni
	String tipo
	List<Seguro> seguros = new ArrayList()
	
	new(){}
	
	new(Integer id, String nombre, String direccion, Integer tel, Integer dni, String tipo) {
		this.id_persona = id
		this.nombre = nombre
		this.direccion = direccion
		this.telefono = tel
		this.dni = dni
		this.tipo = tipo
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

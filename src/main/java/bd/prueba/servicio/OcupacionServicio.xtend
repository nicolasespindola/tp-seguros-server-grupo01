package bd.prueba.servicio

import bd.prueba.conexion.Conexion
import bd.prueba.persona.Ocupacion
import java.sql.Connection
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class OcupacionServicio {
	def Set<Ocupacion> getAll() {
		val Connection conn = Conexion.obtener();
		var Set<Ocupacion> ocupaciones = newHashSet()
		
		val query = "SELECT * FROM ocupacion"
		
		val stmt = conn.createStatement();
    	
    	try {
        	val rs = stmt.executeQuery(query);        	
        	while(rs.next()) { ocupaciones.add(Ocupacion.fromSQL(rs)) }
        	rs.close()
		}
		catch(Exception e){
			throw e
		}
		
		return ocupaciones
	}
}
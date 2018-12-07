package bd.prueba.servicio

import bd.prueba.conexion.Conexion
import bd.prueba.persona.Persona
import java.sql.Connection
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BeneficiarioServicio {
	def getBeneficiariosPosibles() {
		val Connection conn = Conexion.obtener();
		var Set<Persona> posiblesBeneficiarios = newHashSet()
		
		val query = "SELECT *
					 FROM persona p
					 LEFT JOIN beneficiarios b
					 ON p.id_persona = b.id_persona"
		
		val stmt = conn.createStatement();
    	
    	try {
        	val rs = stmt.executeQuery(query);        	
        	while(rs.next()) { posiblesBeneficiarios.add(Persona.fromSQL(rs)) }
        	rs.close()
		}
		catch(Exception e){
			throw e
		}
		
		return posiblesBeneficiarios
	}
}
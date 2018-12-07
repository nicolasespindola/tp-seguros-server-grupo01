package bd.prueba.servicio

import bd.prueba.conexion.Conexion
import bd.prueba.persona.Persona
import java.sql.Connection
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BeneficiarioServicio {
	def getBeneficiariosPosibles(int idSeguro) {
		val Connection conn = Conexion.obtener();
		var Set<Persona> posiblesBeneficiarios = newHashSet()
		
		val query = "SELECT *
					 FROM persona p
					 LEFT JOIN beneficiarios b
					 ON p.id_persona = b.id_persona
					 WHERE b.id_seguro_de_vida IS NULL
					 OR b.id_seguro_de_vida <> " + idSeguro
		
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
package bd.prueba.servicio

import bd.prueba.conexion.Conexion
import bd.prueba.seguro.Cobertura
import java.sql.Connection
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class TipoDeCoberturaServicio {
	
	def getAll() {
		val Connection conn = Conexion.obtener();
		var Set<Cobertura> coberturas = newHashSet()
		
		val query = "SELECT * 
					 FROM tipo_de_cobertura 
					 WHERE tipo = 'v'"
		
		val stmt = conn.createStatement();
    	
    	try {
        	val rs = stmt.executeQuery(query);        	
        	while(rs.next()) { coberturas.add(Cobertura.fromSQL(rs)) }
        	rs.close()
		}
		catch(Exception e){
			throw e
		}
		
		return coberturas
	}
	
}
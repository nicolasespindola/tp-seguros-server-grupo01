package bd.prueba.servicio

import bd.prueba.conexion.Conexion
import bd.prueba.persona.Beneficiario
import bd.prueba.persona.Cliente
import bd.prueba.persona.Ocupacion
import bd.prueba.seguro.Cobertura
import bd.prueba.seguro.Seguro
import bd.prueba.seguro.SeguroDeVida
import bd.prueba.seguro.SeguroVidaTemp
import java.sql.Connection
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class SeguroServicio {
	def getSeguroDeVida(int id){
		val Connection conn = Conexion.obtener();
		var SeguroDeVida seguroDeVida
		
		val query = "SELECT * FROM Seguro_De_Vida WHERE ID_Seguro_De_Vida = " + id
		
		val stmt = conn.createStatement();
    	
    	try {
        	val rs = stmt.executeQuery(query);        	
        	if(rs.next())
        	{
        		val seguroVidaTemp = SeguroVidaTemp.fromSQL(rs)
        		rs.close()
        		
        		val seguro = this.getSeguro(seguroVidaTemp.id_seguro)        		
        		val tipoCobertura = this.getTipoCobertura(seguroVidaTemp.id_tipo_de_cobertura)        		
        		val ocupacion = this.getOcupacion(seguroVidaTemp.id_ocupacion)        		
        		val beneficiarios = this.getBeneficiarios(seguroVidaTemp.id_seguro)        		
        		
        		seguroDeVida = new SeguroDeVida(seguro, tipoCobertura, ocupacion, beneficiarios)
        	}        		
		}
		catch(Exception e){
			System.out.println(e)
			throw e
		}
		
		return seguroDeVida	
	}
	
	def getOcupacion(int idOcupacion) {
		val Connection conn = Conexion.obtener();
		var Ocupacion ocupacion
		
		val query = "SELECT * FROM Ocupacion WHERE Id_Ocupacion = " + idOcupacion
		
		val stmt = conn.createStatement();
    	
    	try {
        	val rs = stmt.executeQuery(query);        	
        	if(rs.next()) { ocupacion = Ocupacion.fromSQL(rs) }
        	rs.close()
		}
		catch(Exception e){
			throw e
		}
		
		return ocupacion	
	}
	
	def getBeneficiarios(int idSeguro) {
		val Connection conn = Conexion.obtener();
		var Set<Beneficiario> beneficiarios = newHashSet()
		
		val query = "SELECT p.*, b.lazo_o_vinculo, b.porcentaje_asignado  
					 FROM Beneficiarios as b
					 JOIN Persona as p
					 	ON b.id_beneficiario = p.ID_Persona
					 WHERE b.ID_Seguro_De_Vida = " + idSeguro
		
		val stmt = conn.createStatement();
    	
    	try {
        	val rs = stmt.executeQuery(query);        	
        	while(rs.next()) { beneficiarios.add(Beneficiario.fromSQL(rs)) }
        	rs.close()
		}
		catch(Exception e){
			throw e
		}
		
		return beneficiarios	
	}
	
	def getTipoCobertura(int idTipoCobertura) {
		val Connection conn = Conexion.obtener();
		var Cobertura tipoCobertura
		
		val query = "SELECT * FROM Tipo_De_Cobertura WHERE ID_Tipo_De_Cobertura = " + idTipoCobertura
		
		val stmt = conn.createStatement();
    	
    	try {
        	val rs = stmt.executeQuery(query);        	
        	if(rs.next()) { tipoCobertura = Cobertura.fromSQL(rs) }
        	rs.close()
		}
		catch(Exception e){
			throw e
		}
		
		return tipoCobertura	
	}
	
	def getSeguro(int idSeguro) {
		val Connection conn = Conexion.obtener();
		var Seguro seguro
		
		val query = "SELECT s.*, e.descripcion 
					 FROM Seguro as s
					 JOIN Estado as e 
					 	ON s.ID_Estado = e.ID_Estado
					 WHERE ID_Seguro = " + idSeguro
		
		val stmt = conn.createStatement();
    	
    	try {
        	val rs = stmt.executeQuery(query);        	
        	if(rs.next())
        	{
        		val seguroTemp = Seguro.fromSQL(rs)
        		val cliente = this.getCliente(rs.getInt("ID_Cliente"))
        		seguroTemp.cliente = cliente        		
        		rs.close() 
        		
        		
        		seguro = seguroTemp
        	}        		
		}
		catch(Exception e){
			throw e
		}
		
		return seguro	
	}
	
	def getCliente(int idCliente) {
		val Connection conn = Conexion.obtener();
		var Cliente cliente
		
		val query = "SELECT p.*, c.fecha_de_nacimiento 
					 FROM Cliente as c
					 JOIN Persona as p
					 	ON c.ID_Cliente = p.ID_Persona
					 WHERE ID_Cliente = " + idCliente
		
		val stmt = conn.createStatement();
    	
    	try {
        	val rs = stmt.executeQuery(query);        	
        	if(rs.next()) { cliente = Cliente.fromSQL(rs) }
        	rs.close()
		}
		catch(Exception e){
			throw e
		}
		
		return cliente	
	}
}
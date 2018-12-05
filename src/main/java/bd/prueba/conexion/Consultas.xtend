package bd.prueba.conexion

import bd.prueba.persona.Beneficiario
import bd.prueba.persona.Cliente
import bd.prueba.persona.Persona
import bd.prueba.seguro.Beneficiarios
import bd.prueba.seguro.SeguroVida
import java.sql.Connection
import java.sql.PreparedStatement
import java.sql.ResultSet
import java.sql.SQLException
import java.util.ArrayList
import java.util.List
import org.omg.CORBA.UserException

class Consultas {
	var String selectSQL = "SELECT * FROM mydb.persona ";
	static var PreparedStatement ps
	static var Connection conn = Conexion.obtener();

	def void insertar(String tabla, String[] columnas, String[] valores) {
		var int i = 0
		var String nombresCol = ""
		var String valoresCol = ""
		for (i = 0; i < columnas.size; i++) {
			nombresCol = nombresCol + "," + columnas.get(i)
			valoresCol = valoresCol + ",'" + valores.get(i) + "'"
		}
		nombresCol = nombresCol.substring(1)
		valoresCol = valoresCol.substring(1)
		System.out.println(valoresCol)
		var String insertarSQL = "INSERT INTO mydb." + tabla + "(" + nombresCol + ") VALUES (" + valoresCol + ")";

		try {
			val PreparedStatement pstmt = conn.prepareStatement(insertarSQL);
			pstmt.executeUpdate()

		} catch (SQLException e) {
			System.out.println(e)
		}
	}

	def void select() {
		try {

			val PreparedStatement pstmt = conn.prepareStatement(this.selectSQL);
			val ResultSet resultado = pstmt.executeQuery()
			val List<Persona> usuarios = new ArrayList()
			while (resultado.next()) {
				usuarios.add(
					new Persona(resultado.getInt("ID_Persona"), resultado.getString("nombre"),
						resultado.getString("direccion"), resultado.getInt("telefono"), resultado.getInt("dni"),
						resultado.getString("tipo")))
			}
			usuarios.forEach[user|System.out.println(user.nombre + " " + user.dni)]

		} catch (SQLException e) {
			System.out.println(e)
		}

	}

	static def Cliente buscarClienteParaCrearSeguroDeVida(int dni) {

		ps = conn.prepareStatement("call mydb.buscarClientePorDniParaCrearSeguroDeVida(?)");
		ps.setInt(1, dni)
		val ResultSet resultado = ps.executeQuery()
		resultado.next()
		val Integer idPersona = resultado.getInt("id_persona")
		if (idPersona === null) {
			throw new Exception("No Existe el cliente buscado")
		}
		return Cliente.fromSQL(resultado)
		
	}

	static def List<Persona> beneficiariosDeSeguro(int seguro) {
		System.out.println("entro aca")

		ps = conn.prepareStatement("call mydb.beneficiariosDeSeguro(?)");
		ps.setInt(1, seguro)
		val List<Persona> beneficiarios = new ArrayList
		val ResultSet resultado = ps.executeQuery()
		while (resultado.next()) {
			try {
				beneficiarios.add( Persona.fromSQL(resultado))
			} catch (UserException e) {
				System.out.println(e.message)
			}
		}

		beneficiarios
	}

	static def List<Persona> beneficiariosDeCliente(int idCliente) {
		System.out.println("entro aca")

		ps = conn.prepareStatement("call mydb.buscarBeneficiariosDeCliente(?)");
		ps.setInt(1, idCliente)
		val List<Persona> beneficiarios = new ArrayList
		val ResultSet resultado = ps.executeQuery()
		while (resultado.next()) {
			try {
				beneficiarios.add(Persona.fromSQL(resultado))

			} catch (UserException e) {
				System.out.println(e.message)
			}
		}

		return beneficiarios
	}

}

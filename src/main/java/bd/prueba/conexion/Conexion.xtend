package bd.prueba.conexion

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Conexion {
	public static Connection cnx = null;
	public static String contraseniaUno = "creoentuvoz";
	public static String contraseniaDos = "root";

	def static Connection obtener() throws SQLException,ClassNotFoundException {
		if (cnx === null) {
			try {
//				Class.forName("com.mysql.jdbc.Driver");
				cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC", "root", contraseniaUno);
			} catch (SQLException ex) {
				throw new SQLException(ex);
			} catch (ClassNotFoundException ex) {
				throw new ClassCastException(ex.getMessage());
			}
		}
		return cnx;
	}

	def static void cerrar() throws SQLException{
		if (cnx !== null) {
			cnx.close();
		}
	}
}

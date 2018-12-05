package bd.prueba.seguro

import java.time.LocalDateTime
import java.sql.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Seguro {
	Integer id_seguro
	int id_cliente
	int id_agente
	String estado
	Date fecha_inicio
	Date fecha_vencimiento
	double prima
	char tipo
	
}
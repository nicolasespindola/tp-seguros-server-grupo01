package bd.prueba.api

import bd.prueba.conexion.Consultas
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils

@Controller
class PersonasController {
	extension JSONUtils = new JSONUtils

	@Get("/cliente/dni/:dni")
	def Result getClientePorDniSeguroVida() {
		try {
			val dniValue = Integer.valueOf(dni)
			ok(Consultas.buscarClienteParaCrearSeguroDeVida(dniValue).toJson)
		} catch (Exception e) {
			return badRequest("No se encontr� la busqueda. " + e.message)
		}
	}
	
	@Get("/beneficiariosDeClienteParaSeguroDeVida/:id")
	def Result getbeneficiariosDeVidaDeCliente() {
		val idValue = Integer.valueOf(id)
		try {
			ok(Consultas.beneficiariosDeCliente(idValue).toJson)
		} catch (Exception e) {
			return badRequest("No se encontr� la busqueda. " + e.message)
		}
	}
	
	@Get("/agentes/reporte")
	def Result getReporteAgentes() {
		try {
			ok(Consultas.reporteAgentes().toJson)
		} catch (Exception e) {
			return badRequest("No fue posible realizar la consulta" + e.toString())
		}
	}
}

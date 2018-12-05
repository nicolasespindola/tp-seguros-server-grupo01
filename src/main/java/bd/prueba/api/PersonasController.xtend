package bd.prueba.api

import bd.prueba.conexion.Consultas
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils

@Controller
class PersonasController {
	extension JSONUtils = new JSONUtils

	@Get("/buscarClienteParaSeguroVida/:dni")
	def Result getClientePorDniSeguroVida() {
		val dniValue = Integer.valueOf(dni)
		try {
			val cliente = Consultas.buscarClienteParaCrearSeguroDeVida(dniValue)
			ok(cliente.toJson)
		} catch (Exception e) {
			return badRequest("No se encontr� la busqueda. " + e.message)
		}
	}
	
	@Get("/beneficiariosDeClienteParaSeguroDeVida/:id")
	def Result getbeneficiariosDeVidaDeCliente() {
		val idValue = Integer.valueOf(id)
		try {
			val beneficiarios = Consultas.beneficiariosDeCliente(idValue)
			ok(beneficiarios.toJson)
		} catch (Exception e) {
			return badRequest("No se encontr� la busqueda. " + e.message)
		}
	}
	
	@Get("/agentes/reporte")
	def Result getReporteAgentes() {
		try {
			ok("a".toJson)
		} catch (Exception e) {
			return badRequest(e.toString())
		}
	}
}

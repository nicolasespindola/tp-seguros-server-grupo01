package bd.prueba.api

import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils
import bd.prueba.servicio.SeguroServicio
import bd.prueba.servicio.BeneficiarioServicio
import bd.prueba.conexion.Consultas

@Controller
class SegurosController {
	extension JSONUtils = new JSONUtils

	@Get("/seguro/:id")
	def Result getSeguroDeVidaPorID() {
		val idSeguroDeVida = Integer.valueOf(id)
		try {
			val seguroDeVida = new SeguroServicio().getSeguroDeVida(idSeguroDeVida)
			ok(seguroDeVida.toJson)
		} catch (Exception e) {
			return badRequest("No se encontro la busqueda. " + e.message)
		}
	}

	@Get("/seguro/:idSeguro/beneficiariosPosibles")
	def Result getBeneficiariosPosiblesPorIDSeguro() {
		val idSeguroDeVida = Integer.valueOf(idSeguro)
		try {
			val seguroDeVida = new BeneficiarioServicio().getBeneficiariosPosibles(idSeguroDeVida)
			ok(seguroDeVida.toJson)
		} catch (Exception e) {
			return badRequest("No se encontro la busqueda. " + e.message)
		}
	}

	@Get("/seguro/traerHome")
	def Result getSegurosHome() {
		try {
			val seguros = Consultas.getSegurosHome()
			ok(seguros.toJson)
		} catch (Exception e) {
			return badRequest("No se encontro la busqueda. " + e.message)
		}
	}

}

package bd.prueba.api

import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils
import bd.prueba.servicio.SeguroServicio
import bd.prueba.servicio.BeneficiarioServicio

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
			return badRequest("No se encontr� la busqueda. " + e.message)
		}
	}
	
	@Get("/seguro/:idSeguro/beneficiariosPosibles")
	def Result getBeneficiariosPosiblesPorIDSeguro() {
		val idSeguroDeVida = Integer.valueOf(idSeguro)
		try {
			val seguroDeVida = new BeneficiarioServicio().getBeneficiariosPosibles(idSeguroDeVida)
			ok(seguroDeVida.toJson)
		} catch (Exception e) {
			return badRequest("No se encontr� la busqueda. " + e.message)
		}
	}
}
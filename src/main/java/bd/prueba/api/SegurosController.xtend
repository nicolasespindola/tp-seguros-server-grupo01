package bd.prueba.api

import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils
import bd.prueba.servicio.SeguroServicio
import bd.prueba.servicio.BeneficiarioServicio
import bd.prueba.servicio.OcupacionServicio
import bd.prueba.servicio.TipoDeCoberturaServicio
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import bd.prueba.seguro.SeguroVidaPost

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

	@Get("/seguro/beneficiariosPosibles")
	def Result getBeneficiariosPosiblesPorIDSeguro() {
		try {
			val beneficiarios = new BeneficiarioServicio().getBeneficiariosPosibles()
			ok(beneficiarios.toJson)
		} catch (Exception e) {
			return badRequest("No se encontr� la busqueda. " + e.message)
		}
	}

	@Get("/ocupaciones/all")
	def Result getOcupaciones() {
		try {
			val ocupaciones = new OcupacionServicio().getAll()
			ok(ocupaciones.toJson)
		} catch (Exception e) {
			return badRequest("No se encontr� la busqueda. " + e.message)
		}
	}

	@Get("/coberturas/all")
	def Result getTiposDeCoberturas() {
		try {
			val coberturas = new TipoDeCoberturaServicio().getAll()
			ok(coberturas.toJson)
		} catch (Exception e) {
			return badRequest("No se encontr� la busqueda. " + e.message)
		}
	}

	@Post("/seguro/vida/new")
	def Result CrearNuevoSeguro(@Body String seguroBody) {		
		try {
			val seguroPost = seguroBody.fromJson(SeguroVidaPost)
			val idSeguroNuevo = new SeguroServicio().crearSeguro(seguroPost)
			ok(idSeguroNuevo.toJson)
		} catch (Exception exception) {
			return badRequest("Hubo un error intentando crear el seguro. " + exception.message)
		}
	}
}

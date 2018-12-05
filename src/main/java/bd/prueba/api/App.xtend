package bd.prueba.api

import org.uqbar.xtrest.api.XTRest

class App {
		def static void main(String[] args) {
		XTRest.start(9000,SeguroController);
	}
		
	
}
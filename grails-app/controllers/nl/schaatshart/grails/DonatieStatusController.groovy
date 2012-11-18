package nl.schaatshart.grails

import groovyx.net.http.*

class DonatieStatusController {

	def donatiesOpAlvarumRetrieverService

	def index() {
		DonatieStatus status = new DonatieStatus()
		status.doel=2500
		def alvarumDonaties = donatiesOpAlvarumRetrieverService.haalOp()
		if (alvarumDonaties!=null){
			status.verwachteDonaties=Donatie.getOverallAmount() + alvarumDonaties
		}

		render(contentType: "text/json") {
			stand doel: status.doel, verwachteDonaties:status.verwachteDonaties
		}
	}
}

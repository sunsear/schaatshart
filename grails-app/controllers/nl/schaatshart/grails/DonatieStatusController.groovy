package nl.schaatshart.grails

import groovyx.net.http.*

class DonatieStatusController {

	def donatiesOpAlvarumRetrieverService

	def index() {
		DonatieStatus status = bepaalStatus()

		render(contentType: "text/json") {
			stand doel: status.doel, verwachteDonaties:status.verwachteDonaties
		}
	}

	private DonatieStatus bepaalStatus() {
		DonatieStatus status = new DonatieStatus()
		status.doel=5000
		def alvarumDonaties = donatiesOpAlvarumRetrieverService.haalOp()
		if (alvarumDonaties!=null){
			status.verwachteDonaties=Donatie.getOverallAmount() + alvarumDonaties + 250
		}
		return status
	}

	def progress(){
		DonatieStatus status = bepaalStatus()

		[donatieStatus: status]
	}
}

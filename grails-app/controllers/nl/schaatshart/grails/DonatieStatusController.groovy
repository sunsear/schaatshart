package nl.schaatshart.grails

import groovyx.net.http.*
import nl.schaatshart.grails.external.DonatiesOpAlvarumRetriever

class DonatieStatusController {

	DonatiesOpAlvarumRetriever retriever = new DonatiesOpAlvarumRetriever()

	def index() {
		DonatieStatus status = new DonatieStatus()
		status.doel=2500
		def alvarumDonaties = retriever.haalOp()
		if (alvarumDonaties!=null){
			status.verwachteDonaties=Donatie.getOverallAmount() + alvarumDonaties
		}

		render(contentType: "text/json") {
			stand doel: status.doel, verwachteDonaties:status.verwachteDonaties
		}
	}
}

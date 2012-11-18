package nl.schaatshart.grails

import grails.plugin.cache.Cacheable
import groovyx.net.http.HTTPBuilder

class DonatiesOpAlvarumRetrieverService {

	@Cacheable('donatieTotaal')
	public Integer haalOp(){
		def http = new HTTPBuilder( 'http://schaatsenvoorhartekind2013.alvarum.net/martinvandijken/' )
		Integer amount
		http.get( path: 'feed/summary' ) { resp, xml ->
			if (resp.status==200)
				amount = new Integer(xml.raisedAmount.text())
			return resp.status
		}
		return amount;
	}
}

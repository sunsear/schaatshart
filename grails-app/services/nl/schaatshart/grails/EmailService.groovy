package nl.schaatshart.grails

import groovyx.net.http.ContentType
import groovyx.net.http.RESTClient

import org.apache.http.HttpRequest
import org.apache.http.HttpRequestInterceptor
import org.apache.http.protocol.HttpContext

class EmailService {

	static def sendEmail(String to, String subject, String message) {
		try{
			def http = new RESTClient("https://api.mailgun.net/v2/schaatshart.mailgun.org/")

			http.client.addRequestInterceptor(new HttpRequestInterceptor() {
						void process(HttpRequest httpRequest, HttpContext httpContext) {
							httpRequest.addHeader('Authorization', 'Basic ' + 'api:key-3axcmolr9xclceijahwria03eu8npgw3'.bytes.encodeBase64().toString())
						}
					})

			def postBody = [from:'Schaatshart donaties <info@schaatshart.nl>',to:to ,subject:subject,text:message]
			def response = http.post(path: 'messages', body: postBody, requestContentType: ContentType.URLENC)
			if (response.status != 200){
				println "Error opgetreden bij versturen email. headers:";
				response.headers.each { h -> println " ${h.name} : ${h.value}" }
				println "Response:"
				println response.data
			}
		} catch (groovyx.net.http.HttpResponseException ex) {
			println "Fout opgetreden tijdens versturen van email: "+ ex.getMessage()
		} catch (java.net.ConnectException ex) {
			println "Fout opgetreden tijdens verbinden van emailconnectie: "+ ex.getMessage()
		}
	}
}

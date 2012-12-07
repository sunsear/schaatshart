package nl.schaatshart.grails

import grails.plugin.cache.Cacheable
import groovyx.net.http.ContentType
import groovyx.net.http.Method
import groovyx.net.http.RESTClient

import java.text.ParsePosition
import java.text.SimpleDateFormat

import org.apache.http.HttpRequest
import org.apache.http.HttpRequestInterceptor
import org.apache.http.protocol.HttpContext

class RunkeeperActivitiesRetrieverService {

	@Cacheable('runkeeperActivities')
	def getActivities() {
		try{
			def http = new RESTClient("http://api.runkeeper.com/")

			http.client.addRequestInterceptor(new HttpRequestInterceptor() {
						void process(HttpRequest httpRequest, HttpContext httpContext) {
							httpRequest.addHeader('Authorization', 'Bearer 9d6e53c2a6514645b4986fe7c8c4fefb')
						}
					})
			def activities
			http.request( Method.GET, ContentType.JSON ) { req ->
				uri.path = 'fitnessActivities'
				headers.Accept = 'application/vnd.com.runkeeper.FitnessActivityFeed+json'

				response.success = { resp, json ->
					def format = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss", new Locale("en","US"))
					activities = json.items
					activities.each{
						it.start_seconds = format.parse(it.start_time, new ParsePosition(0)).getTime()
					}
					return resp.status
				}
			}
			return activities;
		} catch (groovyx.net.http.HttpResponseException ex) {
			println "Fout opgetreden tijdens ophalen runkeeper activities: "+ ex.getMessage()
		} catch (java.net.ConnectException ex) {
			println "Fout opgetreden tijdens ophalen runkeeper activities: "+ ex.getMessage()
		}
	}
}

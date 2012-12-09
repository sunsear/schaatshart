package nl.schaatshart.grails

import grails.test.mixin.*
import groovy.mock.interceptor.MockFor
import groovyx.net.http.HTTPBuilder
import groovyx.net.http.Method

import org.apache.http.HttpRequestInterceptor
import org.apache.http.client.HttpClient
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(RunkeeperActivitiesRetrieverService)
class RunkeeperActivitiesRetrieverServiceTests {
	void testGetActivities() {
		def requestDelegate = [response: [:]]
		def mock = new MockFor(HTTPBuilder)
		def impl = [
					addRequestInterceptor : {HttpRequestInterceptor interceptor -> println "hi 4"+interceptor},
					clearRequestInterceptors : {println "hi 88"}
				]
		def client = impl as HttpClient

		mock.demand.getClient {return client}
		mock.demand.request { Method method, Closure body ->
			body.delegate = requestDelegate
			body.call()
			requestDelegate.response.success() // or failure depending on what's being tested
		}
		mock.use{
			service.http = new HTTPBuilder()
			println service.getActivities()
			println "hi"
		}



		//		def mockControl = mockFor(RESTClient)
		//		println service.getActivities()
		//		println new RunkeeperActivitiesRetrieverService().getActivities();
	}
	//	void testGetFiveRecentWeeks() {
	//		println new RunkeeperActivitiesRetrieverService().getFiveRecentWeeks();
	//	}
}
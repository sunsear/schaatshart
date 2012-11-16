

package nl.schaatshart.grails

import grails.test.mixin.*
import groovy.mock.interceptor.MockFor
import nl.schaatshart.grails.external.DonatiesOpAlvarumRetriever

import org.junit.*

@TestFor(DonatieStatusController)
@Mock(Donatie)
class DonatieStatusControllerTests {

	@Test
	void allesOphalenLukt() {
		def mock = new MockFor(DonatiesOpAlvarumRetriever)
		mock.demand.haalOp{100}
		mock.use(){
			controller.retriever = new DonatiesOpAlvarumRetriever()
			def donatie = DonatieTests.createDonatie()
			donatie.save(flush:true)
			controller.index()
			assert '{"stand":{"doel":2500,"verwachteDonaties":1100}}' == response.contentAsString
		}
	}

	@Test
	void ophalenBijAlvarumMislukt() {
		def mock = new MockFor(DonatiesOpAlvarumRetriever)
		mock.demand.haalOp{null}
		mock.use(){
			controller.retriever = new DonatiesOpAlvarumRetriever()
			def donatie = DonatieTests.createDonatie()
			donatie.save(flush:true)
			controller.index()
			assert '{"stand":{"doel":2500,"verwachteDonaties":null}}' == response.contentAsString
		}
	}
}

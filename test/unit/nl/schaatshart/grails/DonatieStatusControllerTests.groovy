

package nl.schaatshart.grails

import grails.test.mixin.*
import groovy.mock.interceptor.MockFor

import org.junit.*

@TestFor(DonatieStatusController)
@Mock(Donatie)
class DonatieStatusControllerTests {

	@Test
	void allesOphalenLukt() {
		def mock = new MockFor(DonatiesOpAlvarumRetrieverService)
		mock.demand.haalOp{100}
		mock.use(){
			controller.donatiesOpAlvarumRetrieverService = new DonatiesOpAlvarumRetrieverService()
			def donatie = DonatieTests.createDonatie()
			donatie.save(flush:true)
			controller.index()
			assert '{"stand":{"doel":2500,"verwachteDonaties":1100}}' == response.contentAsString
		}
	}

	@Test
	void ophalenBijAlvarumMislukt() {
		def mock = new MockFor(DonatiesOpAlvarumRetrieverService)
		mock.demand.haalOp{null}
		mock.use(){
			controller.donatiesOpAlvarumRetrieverService = new DonatiesOpAlvarumRetrieverService()
			def donatie = DonatieTests.createDonatie()
			donatie.save(flush:true)
			controller.index()
			assert '{"stand":{"doel":2500,"verwachteDonaties":null}}' == response.contentAsString
		}
	}
}

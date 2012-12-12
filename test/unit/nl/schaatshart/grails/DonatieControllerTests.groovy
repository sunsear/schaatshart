package nl.schaatshart.grails



import grails.test.mixin.*
import groovy.mock.interceptor.MockFor

import org.junit.*

@TestFor(DonatieController)
@Mock(Donatie)
class DonatieControllerTests {

	def populateValidParams(params) {
		assert params != null
		params["name"] = 'Martin van Dijken'
		params["email"] = "m@nu.nl"
		params["amountPerKm"] = "1"
	}

	void testIndex() {
		controller.index()
		assert "/donatie/list" == response.redirectedUrl
	}

	void testList() {
		def mock = new MockFor(DonatiesOpAlvarumRetrieverService)
		mock.demand.haalOp{0}
		mock.use{
			controller.donatiesOpAlvarumRetrieverService = new DonatiesOpAlvarumRetrieverService();
			def model = controller.list()

			assert model.donatieInstanceList.size() == 0
			assert model.donatieInstanceTotal == 0
		}
	}

	void testCreate() {
		def model = controller.create()

		assert model.donatieInstance != null
	}

	void testSaveIncorrectCaptcha() {
		def mailMockControl = mockFor(EmailService, true)
		mailMockControl.demand.sendEmail{}
		def mailMock = mailMockControl.createMock();
		controller.emailService = mailMock

		populateValidParams(params)
		params["url"] = "http://www.test.nl"
		controller.save()

		assert model.donatieInstance != null
		assert view == '/donatie/notreally'
	}

	void testSaveIncorrectInstance() {
		controller.save()

		assert model.donatieInstance != null
		assert view == '/donatie/create'
	}

	void testSaveCorrectInstance(){
		def mailMockControl = mockFor(EmailService, true)
		mailMockControl.demand.sendEmail{}
		def mailMock = mailMockControl.createMock();
		controller.emailService = mailMock
		populateValidParams(params)

		controller.save()

		assert response.redirectedUrl == '/donatie/show'
		assert controller.flash.message != null
		assert controller.flash.donatieId == 1
		assert Donatie.count() == 1
	}

	void testShow() {
		controller.show()

		assert flash.message != null
		assert response.redirectedUrl == '/donatie/list'

		populateValidParams(params)
		def donatie = new Donatie(params)

		assert donatie.save() != null

		controller.flash.donatieId = donatie.id

		def model = controller.show()

		assert model.donatieInstance == donatie
	}
}

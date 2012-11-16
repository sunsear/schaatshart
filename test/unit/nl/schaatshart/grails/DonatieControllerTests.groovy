package nl.schaatshart.grails



import grails.test.mixin.*

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

		def model = controller.list()

		assert model.donatieInstanceList.size() == 0
		assert model.donatieInstanceTotal == 0
	}

	void testCreate() {
		def model = controller.create()

		assert model.donatieInstance != null
	}

	void testSave() {
		controller.save()

		assert model.donatieInstance != null
		assert view == '/donatie/create'

		response.reset()

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

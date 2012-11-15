package nl.schaatshart.grails.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(DonatieController)
@Mock(Donatie)
class DonatieControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
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

        assert response.redirectedUrl == '/donatie/show/1'
        assert controller.flash.message != null
        assert Donatie.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/donatie/list'

        populateValidParams(params)
        def donatie = new Donatie(params)

        assert donatie.save() != null

        params.id = donatie.id

        def model = controller.show()

        assert model.donatieInstance == donatie
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/donatie/list'

        populateValidParams(params)
        def donatie = new Donatie(params)

        assert donatie.save() != null

        params.id = donatie.id

        def model = controller.edit()

        assert model.donatieInstance == donatie
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/donatie/list'

        response.reset()

        populateValidParams(params)
        def donatie = new Donatie(params)

        assert donatie.save() != null

        // test invalid parameters in update
        params.id = donatie.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/donatie/edit"
        assert model.donatieInstance != null

        donatie.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/donatie/show/$donatie.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        donatie.clearErrors()

        populateValidParams(params)
        params.id = donatie.id
        params.version = -1
        controller.update()

        assert view == "/donatie/edit"
        assert model.donatieInstance != null
        assert model.donatieInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/donatie/list'

        response.reset()

        populateValidParams(params)
        def donatie = new Donatie(params)

        assert donatie.save() != null
        assert Donatie.count() == 1

        params.id = donatie.id

        controller.delete()

        assert Donatie.count() == 0
        assert Donatie.get(donatie.id) == null
        assert response.redirectedUrl == '/donatie/list'
    }
}

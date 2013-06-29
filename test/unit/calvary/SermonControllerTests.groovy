package calvary



import org.junit.*
import grails.test.mixin.*

@TestFor(SermonController)
@Mock(Sermon)
class SermonControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sermon/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sermonInstanceList.size() == 0
        assert model.sermonInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.sermonInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sermonInstance != null
        assert view == '/sermon/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sermon/show/1'
        assert controller.flash.message != null
        assert Sermon.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sermon/list'

        populateValidParams(params)
        def sermon = new Sermon(params)

        assert sermon.save() != null

        params.id = sermon.id

        def model = controller.show()

        assert model.sermonInstance == sermon
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sermon/list'

        populateValidParams(params)
        def sermon = new Sermon(params)

        assert sermon.save() != null

        params.id = sermon.id

        def model = controller.edit()

        assert model.sermonInstance == sermon
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sermon/list'

        response.reset()

        populateValidParams(params)
        def sermon = new Sermon(params)

        assert sermon.save() != null

        // test invalid parameters in update
        params.id = sermon.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sermon/edit"
        assert model.sermonInstance != null

        sermon.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sermon/show/$sermon.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sermon.clearErrors()

        populateValidParams(params)
        params.id = sermon.id
        params.version = -1
        controller.update()

        assert view == "/sermon/edit"
        assert model.sermonInstance != null
        assert model.sermonInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sermon/list'

        response.reset()

        populateValidParams(params)
        def sermon = new Sermon(params)

        assert sermon.save() != null
        assert Sermon.count() == 1

        params.id = sermon.id

        controller.delete()

        assert Sermon.count() == 0
        assert Sermon.get(sermon.id) == null
        assert response.redirectedUrl == '/sermon/list'
    }
}

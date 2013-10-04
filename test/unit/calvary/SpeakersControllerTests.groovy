package calvary



import org.junit.*
import grails.test.mixin.*

@TestFor(SpeakersController)
@Mock(Speakers)
class SpeakersControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/speakers/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.speakersInstanceList.size() == 0
        assert model.speakersInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.speakersInstance != null
    }

    void testSave() {
        controller.save()

        assert model.speakersInstance != null
        assert view == '/speakers/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/speakers/show/1'
        assert controller.flash.message != null
        assert Speakers.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/speakers/list'

        populateValidParams(params)
        def speakers = new Speakers(params)

        assert speakers.save() != null

        params.id = speakers.id

        def model = controller.show()

        assert model.speakersInstance == speakers
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/speakers/list'

        populateValidParams(params)
        def speakers = new Speakers(params)

        assert speakers.save() != null

        params.id = speakers.id

        def model = controller.edit()

        assert model.speakersInstance == speakers
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/speakers/list'

        response.reset()

        populateValidParams(params)
        def speakers = new Speakers(params)

        assert speakers.save() != null

        // test invalid parameters in update
        params.id = speakers.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/speakers/edit"
        assert model.speakersInstance != null

        speakers.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/speakers/show/$speakers.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        speakers.clearErrors()

        populateValidParams(params)
        params.id = speakers.id
        params.version = -1
        controller.update()

        assert view == "/speakers/edit"
        assert model.speakersInstance != null
        assert model.speakersInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/speakers/list'

        response.reset()

        populateValidParams(params)
        def speakers = new Speakers(params)

        assert speakers.save() != null
        assert Speakers.count() == 1

        params.id = speakers.id

        controller.delete()

        assert Speakers.count() == 0
        assert Speakers.get(speakers.id) == null
        assert response.redirectedUrl == '/speakers/list'
    }
}

package calvary

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException
@Secured(['ROLE_ADMIN'])
class SpeakersController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [speakersInstanceList: Speakers.list(params), speakersInstanceTotal: Speakers.count()]
    }

    def create() {
        [speakersInstance: new Speakers(params)]
    }

    def save() {
        def speakersInstance = new Speakers(params)
        if (!speakersInstance.save(flush: true)) {
            render(view: "create", model: [speakersInstance: speakersInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'speakers.label', default: 'Speakers'), speakersInstance.id])
        redirect(action: "show", id: speakersInstance.id)
    }

    def show(Long id) {
        def speakersInstance = Speakers.get(id)
        if (!speakersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'speakers.label', default: 'Speakers'), id])
            redirect(action: "list")
            return
        }

        [speakersInstance: speakersInstance]
    }

    def edit(Long id) {
        def speakersInstance = Speakers.get(id)
        if (!speakersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'speakers.label', default: 'Speakers'), id])
            redirect(action: "list")
            return
        }

        [speakersInstance: speakersInstance]
    }

    def update(Long id, Long version) {
        def speakersInstance = Speakers.get(id)
        if (!speakersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'speakers.label', default: 'Speakers'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (speakersInstance.version > version) {
                speakersInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'speakers.label', default: 'Speakers')] as Object[],
                        "Another user has updated this Speakers while you were editing")
                render(view: "edit", model: [speakersInstance: speakersInstance])
                return
            }
        }

        speakersInstance.properties = params

        if (!speakersInstance.save(flush: true)) {
            render(view: "edit", model: [speakersInstance: speakersInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'speakers.label', default: 'Speakers'), speakersInstance.id])
        redirect(action: "show", id: speakersInstance.id)
    }

    def delete(Long id) {
        def speakersInstance = Speakers.get(id)
        if (!speakersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'speakers.label', default: 'Speakers'), id])
            redirect(action: "list")
            return
        }

        try {
            speakersInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'speakers.label', default: 'Speakers'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'speakers.label', default: 'Speakers'), id])
            redirect(action: "show", id: id)
        }
    }
}

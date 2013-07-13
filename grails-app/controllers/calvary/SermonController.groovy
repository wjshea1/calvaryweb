package calvary

import org.springframework.dao.DataIntegrityViolationException

class SermonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = "pubDate"
        [sermonInstanceList: Sermon.list(params), sermonInstanceTotal: Sermon.count()]
    }

    def create() {
        [sermonInstance: new Sermon(params)]
    }

    def save() {
        def sermonInstance = new Sermon(params)
        if (!sermonInstance.save(flush: true)) {
            render(view: "create", model: [sermonInstance: sermonInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sermon.label', default: 'Sermon'), sermonInstance.id])
        redirect(action: "show", id: sermonInstance.id)
    }

    def show(Long id) {
        def sermonInstance = Sermon.get(id)
        if (!sermonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sermon.label', default: 'Sermon'), id])
            redirect(action: "list")
            return
        }

        [sermonInstance: sermonInstance]
    }

    def edit(Long id) {
        def sermonInstance = Sermon.get(id)
        if (!sermonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sermon.label', default: 'Sermon'), id])
            redirect(action: "list")
            return
        }

        [sermonInstance: sermonInstance]
    }

    def update(Long id, Long version) {
        def sermonInstance = Sermon.get(id)
        if (!sermonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sermon.label', default: 'Sermon'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sermonInstance.version > version) {
                sermonInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sermon.label', default: 'Sermon')] as Object[],
                          "Another user has updated this Sermon while you were editing")
                render(view: "edit", model: [sermonInstance: sermonInstance])
                return
            }
        }

        sermonInstance.properties = params

        if (!sermonInstance.save(flush: true)) {
            render(view: "edit", model: [sermonInstance: sermonInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sermon.label', default: 'Sermon'), sermonInstance.id])
        redirect(action: "show", id: sermonInstance.id)
    }

    def delete(Long id) {
        def sermonInstance = Sermon.get(id)
        if (!sermonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sermon.label', default: 'Sermon'), id])
            redirect(action: "list")
            return
        }

        try {
            sermonInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sermon.label', default: 'Sermon'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sermon.label', default: 'Sermon'), id])
            redirect(action: "show", id: id)
        }
    }
}

package calvary

import org.springframework.dao.DataIntegrityViolationException

class NewsItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [newsItemInstanceList: NewsItem.list(params), newsItemInstanceTotal: NewsItem.count()]
    }

    def create() {
        [newsItemInstance: new NewsItem(params)]
    }

    def save() {
        def newsItemInstance = new NewsItem(params)
        if (!newsItemInstance.save(flush: true)) {
            render(view: "create", model: [newsItemInstance: newsItemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), newsItemInstance.id])
        redirect(action: "show", id: newsItemInstance.id)
    }

    def show(Long id) {
        def newsItemInstance = NewsItem.get(id)
        if (!newsItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), id])
            redirect(action: "list")
            return
        }

        [newsItemInstance: newsItemInstance]
    }

    def edit(Long id) {
        def newsItemInstance = NewsItem.get(id)
        if (!newsItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), id])
            redirect(action: "list")
            return
        }

        [newsItemInstance: newsItemInstance]
    }

    def update(Long id, Long version) {
        def newsItemInstance = NewsItem.get(id)
        if (!newsItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (newsItemInstance.version > version) {
                newsItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'newsItem.label', default: 'NewsItem')] as Object[],
                        "Another user has updated this NewsItem while you were editing")
                render(view: "edit", model: [newsItemInstance: newsItemInstance])
                return
            }
        }

        newsItemInstance.properties = params

        if (!newsItemInstance.save(flush: true)) {
            render(view: "edit", model: [newsItemInstance: newsItemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), newsItemInstance.id])
        redirect(action: "show", id: newsItemInstance.id)
    }

    def delete(Long id) {
        def newsItemInstance = NewsItem.get(id)
        if (!newsItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), id])
            redirect(action: "list")
            return
        }

        try {
            newsItemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), id])
            redirect(action: "show", id: id)
        }
    }
}

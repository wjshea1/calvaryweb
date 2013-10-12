package calvary
import grails.plugins.springsecurity.Secured



class SecureContentController {

    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def index = {


        render "secure stuff"}
}

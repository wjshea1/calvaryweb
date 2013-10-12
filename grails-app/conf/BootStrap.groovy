class BootStrap {

    def init = { servletContext ->

        def adminRole = new calvary.Authority(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new calvary.Authority(authority: 'ROLE_USER').save(flush: true)

        def testUser = new calvary.Person(username: 'ccadmin', enabled: true, password: 'admin_test')
        testUser.save(flush: true)
       //    def joinTable = new calvary.PersonAuthority( authority )
        calvary.PersonAuthority.create testUser, adminRole, true




    }
    def destroy = {
    }
}

class BootStrap {

    def init = { servletContext ->

/*        def adminRole = new calvary.Authority(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new calvary.Authority(authority: 'ROLE_USER').save(flush: true)

        def testUser = new calvary.Person(username: 'ccadmin', enabled: true, password: 'Fr0j1n87')
        testUser.save(flush: true)
      //  def joinTable = new calvary.PersonAuthority( authorityI)
        calvary.PersonAuthority.create testUser, adminRole, true


  */

    }
    def destroy = {
    }
}

includeTargets << grailsScript("_GrailsInit")

import groovy.sql.Sql


target(main: "The description of the script goes here!") {
    // TODO: Implement script here

    // Setup Access to the sql db
    def sql = Sql.newInstance("jdbc:mysql://localhost/calvary_app_dev", "root", "", "com.mysql.jdbc.Driver")

    def url = "http://ccmc.dyndns.org/audio.xml"
    def rss = new XmlSlurper().parse(url)
    println rss.channel.title
    rss.channel.item.each {
        println " - ${it.subtitle }"

        def sermon = sql.dateSet('sermon')

        sermon.add(title:it.title, pubDate:it.pubDate, summary: it.summary, keywords:it.keywords,
                audioFileLocation:it.link)


    }

}

setDefaultTarget(main)

package calvary

class Sermon {
    def grailsApplication

    static constraints = {
        title size: 1..200, blank: false
        pubDate blank: false
        summary size:1..1024, blank: false
        keywords size:1..250, blank: false
        audioFileLocation blank: false
        imageFileLocation url:true, blank: false
        book blank:false, nullable:true
        startChapter blank:false, nullable:true
        startVerse blank:false, nullable:true
        endChapter blank:false, nullable:true
        endVerse   blank:false, nullable:true
        service inList:['Sunday', 'Wednesday', 'other']
        speaker blank:true, nullable:true


    }

    String title
    Date   pubDate
    String summary
    String keywords
    String duration = "35:00"
    String imageFileLocation = "http://calvary.cfapps.io/static/images/ccmc-rss-logo.png"
    String audioFileLocation
    Book book
    // Create Speaker Class to make easier to sort and create dynamic feeds
    //Speaker speaker
    int startChapter = 0
    int startVerse = 0
    int endChapter = 0
    int endVerse   = 0
    String service = "Sunday"
    boolean featured  = false;
    Speakers speaker

    def getAudioFileURL(){


        def myServer = grailsApplication.config.grails.calvaryweb.media_file_location
        def myURL = myServer + URLEncoder.encode(this.audioFileLocation)
        println myURL
        return  myURL

    }

    static transients = ['audioFileURL']
}

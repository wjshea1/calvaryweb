package calvary

import grails.converters.JSON
import groovy.json.JsonBuilder
import feedsplugin.FeedBuilder
import com.sun.syndication.feed.module.itunes.types.*
import com.sun.syndication.feed.synd.SyndImageImpl


class FeedsController {

    def index() {
        def sermonList = Sermon.list (sort:'pubDate', order:'desc').collect{ [
                id: it.id,
                title: it.title,
                summary: it.summary,
                pubDate: it.pubDate,
                audioFileLocation: it.audioFileURL,
                imageFileLocation: it.imageFileLocation,
                pdfFileLocation: it.pdfFileURL,
                speaker: it.speaker.name
        ]}
        render sermonList as JSON
    }

    def current() {
        println('current feed being called');
        def result = [success:true];
        // we need to build a wrapper around the json
        result.sermons = collectFieldsList(Sermon);
        render result as JSON


    }

    def collectFieldsList(myList){
       def feilds =myList.list (sort:'pubDate', max:5, order:'desc') .collect{ [
                id: it.id,
                title: it.title,
                summary: it.summary,
                pubDate: it.pubDate.getDateString(),
                audioFileLocation: it.audioFileURL,
                imageFileLocation: it.imageFileLocation,
                videoFileLocation:  it.videoFileLocation,
                pdfFileLocation: it.pdfFileURL,
                speaker: it.speaker.name
        ]}
        return feilds
    }


    def sermon () {

        def result = [success:true]
        println "loading sermon = " + params.id
        def sermon = Sermon.get(params.id)
        def builder = new groovy.json.JsonBuilder()
        def sermonObj = builder.sermon {
            id                sermon.id
            title              sermon.title
            summary            sermon.summary
            audioFileLocation  sermon.audioFileLocation
            imageFileLocation  sermon.imageFileLocation
            videoFileLocation  sermon.videoFileLocation
            pdfFileLocation    sermon.pdfFileURL
            speaker            sermon.speaker.name
        }
        result.sermon = sermonObj

        render result as JSON

    }

    def book() {
         def result
         def book = Book.get(params.id )
         def list  = Sermon.findAllByBook(book, [sort: "pubDate", order: "asc"])
         if (!list){
             result = [success:false]
             result.message = "No Studies found for that book, coming soon"
         }  else {
             result = [success:true]
             result.sermons = list.collect { [
                     id: it.id,
                     title: it.title,
                     summary: it.summary,
                     pubDate: it.pubDate.getDateString(),
                     audioFileLocation: it.audioFileURL,
                     imageFileLocation: it.imageFileLocation,
                     videoFileLocation:  it.videoFileLocation,

                     speaker: it.speaker.name
             ]}

         }
         println "loadding book number = " + params.id
        render result as JSON
    }

   def booksAvailable() {
       // need to think about what goes here because I really need to know what is available
   }


    def news() {
        def list = NewsItem.list()
        def result = [success: true]
        if (!list){
            result = [success:false]
            result.message = "No News found, coming soon"
        }  else {
            if (list.size() == 1){
                // if the list size is 1 json builders renders the array a 1 item.
                result.news = []
                result.news.add(list[0])
            } else {
                result.news = list
            }
           // result = [success:true]
        }
        render result as JSON
    }




    def events() {

        def list = Event.list()
        def result = [success: true]
        if (!list){
            result = [success:false]
            result.message = "No Events , coming soon"
        }  else {
            if (list.size() == 1){
                // if the list size is 1 json builders renders the array a 1 item.
                result.events = []
                result.events.add(list[0])
            } else {
                result.events = list
            }
            // result = [success:true]
        }
        render result as JSON

    }

    def sunday() {}

    def wednesday() {}



    def itunes() {}

    def menu() {
        def myMenu =  Menu.get(params.id)
        def data = []
        if ( myMenu ){
            data  = [
                    success:true,
                    menus: myMenu.items.collect {
                        [name:it.name,
                                url:it.itemURL,
                                image: it.imageURL,
                                data:it.metaData,
                                itemType:it.itemType
                        ]
                    }
            ]

        }  else  {
            data = [
                 success:false,
                 description:'no data found for request'
            ]
        }



        render data as JSON

    }

    def featured() {

        // featured
        def list = Sermon.findWhere(featured:true)
        def result = [success: true]
        if ( !list ) {
            result = [success:false]
            result.message = "No News found, coming soon"
        }  else {
            result.data =  list.collect { [
                    id: it.id,
                    title: it.title,
                    summary: it.summary,
                    pubDate: it.pubDate,
                    audioFileLocation: it.audioFileURL,
                    imageFileLocation: it.imageFileLocation,
                    speaker: it.speaker.name
            ]}
        }
        render result as JSON

    }


    def guest() {
        def list =[]
        def speakerList = Speakers.findAllWhere( guest:true )
        for (speaker in speakerList) {

              def list1 = Sermon.findBySpeaker(speaker)
              if ( list1 )
                  list += list1
        }

        def result = [success: true]
        if ( !list ) {
            result = [success:false]
            result.message = "No News found, coming soon"
        }  else {
            result.data =  list
        }
        render result as JSON

    }

    def bookswithstudies () {
      //  def query = Sermon.where {}.projections { distinct 'book'}


        def results = Sermon.executeQuery('select distinct book from Sermon')
        def data = []
        if  ( results.size > 0 ) {
            // render the resulting array
               data  = [
                    success:true,
                    books: results.collect {
                        [       name:it.name,
                                id:it.id,

                        ]
                    }
            ]

            }  else  {
                data = [
                        success:false,
                        description:'no data found for request'
                ]
            }

        render data as JSON
    }


    def rss() {

        def podcast_keywords = "Christianity, Religeon, Calvary, Calvary Chapel, Mercer, Mercer Count, Calvary Mercer County, Bible Studies, Bible"

        render(feedType:"rss", feedVersion:"2.0"){
           title = "Calvary Chapel of Mercer County – Sermon Archive"
           link  = "http://calvary.cfapps.io/feeds/rss"
           description = "Welcome to the Audio Podcasts of Calvary Chapel of Mercer County, located in Ewing, New Jersey with Pastor Gregg Downs as our featured teacher.  .    To learn more about the ministry of Calvary Chapel of Mercer County, please log on to www.ccmercer.com.  May you be blessed by your study of God’s Word"
           language = "en-us"
            // itunes links
            iTunes {
                summary =  "Welcome to the Audio Podcasts of Calvary Chapel of Mercer County, located in Ewing, New Jersey with Pastor Gregg Downs as our featured teacher.  .    To learn more about the ministry of Calvary Chapel of Mercer County, please log on to www.ccmercer.com.  May you be blessed by your study of God’s Word"
                keywords = podcast_keywords.tokenize(",")
               // language = "en"
                categories = ["Religion &amp; Spirituality","Christianity"]
                author = "Calvary Chapel of Mercer County"
                subtitle = "Podcasting Ministry of Calvary Chapel Mercer County"
                explicit = false
                ownerName = "Calvary Chapel Mercer County"
                ownerEmailAddress = "connecting@ccmercer.com"
                image = new URL("http://calvary.cfapps.io/images/ccmc-rss-logo.png")


            }

            Sermon.list(sort:'pubDate', order:'desc').each {  sermon->
                entry {
                    title = sermon.title
                    link=sermon.audioFileURL
                    enclosure(type: 'audio/mp3',
                              url: "${sermon.audioFileURL}" ,
                              length: 50416743)

                    publishedDate = sermon.pubDate

                    iTunes {
                        author = sermon.speaker.name
                        summary = sermon.summary
                        keywords = sermon.keywords.tokenize(",")
                        explicit = false


                        //image = new URL("http://calvary.cfapps.io/images/ccmc-rss-logo.png")
                        //duration = "360000"
                    }
                }
            }
        }
    }
    // This action is required because iTunes is unable to process a non-file
    // I know I dont get either but whatever this works
    // When I put this rails maybe it will work ;-)
    def regenerateFeed() {

        def podcast_keywords = "Christianity, Religeon, Calvary, Calvary Chapel, Mercer, Mercer Count, Calvary Mercer County, Bible Studies, Bible"
       def builder = new FeedBuilder()
       builder.feed {
           title = "Calvary Chapel of Mercer County Full Sermon Feed"
           link  = "http://calvary.cfapps.io/feeds/rss"
           description = "Welcome to the Audio Podcasts of Calvary Chapel of Mercer County, located in Ewing, New Jersey with Pastor Gregg Downs as our featured teacher.  .    To learn more about the ministry of Calvary Chapel of Mercer County, please log on to www.ccmercer.com.  May you be blessed by your study of God’s Word"
           language = "en-us"
           // itunes links
           iTunes {
               summary =  "Welcome to the Audio Podcasts of Calvary Chapel of Mercer County, located in Ewing, New Jersey with Pastor Gregg Downs as our featured teacher.  .    To learn more about the ministry of Calvary Chapel of Mercer County, please log on to www.ccmercer.com.  May you be blessed by your study of God’s Word"
               keywords = podcast_keywords.tokenize(",")
               // language = "en"
               categories = ["Religion &amp; Spirituality","Christianity"]
               author = "Calvary Chapel of Mercer County"
               subtitle = "Podcasting Ministry of Calvary Chapel Mercer County"
               explicit = false
               ownerName = "Calvary Chapel Mercer County"
               ownerEmailAddress = "connecting@ccmercer.com"
               image = new URL("http://calvary.cfapps.io/images/ccmc-rss-logo.png")


           }

           Sermon.list(sort:'pubDate', order:'desc').each {  sermon->
               entry {
                   title = sermon.title
                   link=sermon.audioFileURL
                   enclosure(type: 'audio/mp3',
                           url: "${sermon.audioFileURL}" ,
                           length: 50416743)

                   publishedDate = sermon.pubDate

                   iTunes {
                       author = sermon.speaker.name
                       summary = sermon.summary
                       keywords = sermon.keywords.tokenize(",")
                       explicit = false


                       //image = new URL("http://calvary.cfapps.io/images/ccmc-rss-logo.png")
                       //durationText = "1:00:00"
                   }
               }
           }



       }
        def filename = request.getSession().getServletContext().getRealPath("/") + 'feed.xml'
        File file = new File (filename)
        println filename
        file.write(builder.render('rss'))
        render 'done'

    }


    }





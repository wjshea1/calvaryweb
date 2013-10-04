package calvary

import grails.converters.JSON
import groovy.json.JsonBuilder

class FeedsController {

    def index() {
        def sermonList = Sermon.list (sort:'pubDate', order:'desc')
        render sermonList as JSON
    }

    def current() {
        println('current feed being called');
        def result = [success:true];
        def sermonList = Sermon.list (sort:'pubDate', max:5, order:'desc')

        // we need to build a wrapper around the json
        result.sermons = sermonList;
        render result as JSON


    }



    def sermon () {

        def result = [success:true]
        def sermon = Sermon.get(params.id)
        result.sermons = sermon
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
             result.sermons = list

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
            result.data =  list
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


    def rss {
        render(feedType:"rss", feedVersion:"2.0"){

        }
    }



}

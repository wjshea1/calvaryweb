package calvary

class NewsItem {

    static constraints = {
         headline blank:false, maxSize: 200
         description blank:false, maxSize: 1024
         internetLink url:true
    }
    String headline
    String description
    String internetLink
    Date publishDate = new Date ()

}

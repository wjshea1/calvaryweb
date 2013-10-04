package calvary

class NewsItem {

    static constraints = {
         headline blank:false, maxSize: 200
         description blank:false, maxSize: 1024
         internetLink url:true
         imageLink url:true
    }
    String headline
    String description
    String internetLink
    String imageLink
    Date publishDate = new Date ()

}

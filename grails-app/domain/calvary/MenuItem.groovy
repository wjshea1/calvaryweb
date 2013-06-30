package calvary

class MenuItem implements Comparable {

    static constraints = {
        name blank:false, size:1..100
        description blank:false, size: 1..1024
        itemOrder blank:false
        itemType blank:false, inList:["Location", "Feed", "WebView"]
        imageURL url:true
        itemURL url:true
        metaData size:1..1024

    }
    String name
    String description
    int itemOrder
    String itemType
    String imageURL
    String metaData // This will allow us to place data in the list like location details etc
    Date changeDate = new Date()
    String itemURL  // This will have items like feed etc...  I think this needs to more thought out but this is a good place holder for now


    def beforeUpdate() {
        changeDate = new Date()
    }

    int compareTo(obj) {
        return itemOrder - obj.itemOrder
    }

    String toString() {
        return name;
    }
}

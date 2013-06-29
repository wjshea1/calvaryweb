package calvary

class Event {

    static constraints = {

        title blank:false, maxSize: 200
        description blank:false, maxSize: 2048
        eventDate blank:false
        eventTime blank:false
        eventDuration blank:false
        location blank:false


    }

    String title
    String description
    String imageURL
    Date   eventDate = new Date()
    String eventTime
    String eventDuration
    String internetLink
    String location

}

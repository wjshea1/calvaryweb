package calvary

class Book {

    static constraints = {
        testament inList:["Old", "New"]
        name blank:false
        chapterCount blank:true
    }
    String testament
    String name
    int chapterCount

    String toString() {
        return name;
    }
}

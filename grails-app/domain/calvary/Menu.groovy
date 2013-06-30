package calvary

class Menu {



    static constraints = {
        name blank:false
        description blank:false
    }

    SortedSet items

    static hasMany = [items : MenuItem]
    String name
    String description





}

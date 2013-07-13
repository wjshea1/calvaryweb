package calvary

class Speakers {

    static constraints = {
        name  blank:false
        guest blank:true
    }

    String name
    boolean guest

    String toString() {
        return name
    }


}

package testark

class Step {

    String userAction
    String expectedResult


    static constraints = {
        userAction(nullable: false, blank: false)
        expectedResult(nullable: false, blank: false)
    }
}

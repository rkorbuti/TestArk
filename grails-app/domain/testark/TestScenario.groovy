package testark

class TestScenario {

    String name, story
    String step, actual_result

    static constraints = {
        name(nullable: false, blank: false, unique: true)
        step(nullable: false, blank: false)
        actual_result(nullable: false, blank: false)
    }
}

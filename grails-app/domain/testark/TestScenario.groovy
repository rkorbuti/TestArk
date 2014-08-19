package testark

class TestScenario {

    String story
    String name
    static hasMany = [steps: Step]

    static constraints = {
        name(nullable: false, blank: false, unique: true)
        story(nullable: true, blank: true)
    }
}

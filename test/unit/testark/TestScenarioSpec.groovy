package testark

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(TestScenario)
class TestScenarioSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        mockDomain TestScenario
        final def scenario = new TestScenario()
        assertFalse scenario.validate()
        scenario.name = 'Indexed Search Test'
        scenario.story = 'JP-1080'
        scenario.step = 'Login to IPC'
        scenario.actual_result = 'Settings View is shown'

    }
}

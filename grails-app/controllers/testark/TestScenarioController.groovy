package testark



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TestScenarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TestScenario.list(params), model:[testScenarioInstanceCount: TestScenario.count()]
    }

    def show(TestScenario testScenarioInstance) {
        respond testScenarioInstance
    }

    def create() {
        respond new TestScenario(params)
    }

    @Transactional
    def save(TestScenario testScenarioInstance) {
        if (testScenarioInstance == null) {
            notFound()
            return
        }

        if (testScenarioInstance.hasErrors()) {
            respond testScenarioInstance.errors, view:'create'
            return
        }

        testScenarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'testScenario.label', default: 'TestScenario'), testScenarioInstance.id])
                redirect testScenarioInstance
            }
            '*' { respond testScenarioInstance, [status: CREATED] }
        }
    }

    def edit(TestScenario testScenarioInstance) {
        respond testScenarioInstance
    }

    @Transactional
    def update(TestScenario testScenarioInstance) {
        if (testScenarioInstance == null) {
            notFound()
            return
        }

        if (testScenarioInstance.hasErrors()) {
            respond testScenarioInstance.errors, view:'edit'
            return
        }

        testScenarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TestScenario.label', default: 'TestScenario'), testScenarioInstance.id])
                redirect testScenarioInstance
            }
            '*'{ respond testScenarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TestScenario testScenarioInstance) {

        if (testScenarioInstance == null) {
            notFound()
            return
        }

        testScenarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TestScenario.label', default: 'TestScenario'), testScenarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'testScenario.label', default: 'TestScenario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

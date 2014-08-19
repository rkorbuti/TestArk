package testark



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StepController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Step.list(params), model: [stepInstanceCount: Step.count()]
    }

    def show(Step stepInstance) {
        respond stepInstance
    }

    def create() {
        respond new Step(params)
    }

    @Transactional
    def save(Step stepInstance) {
        if (stepInstance == null) {
            notFound()
            return
        }

        if (stepInstance.hasErrors()) {
            respond stepInstance.errors, view: 'create'
            return
        }

        stepInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'step.label', default: 'Step'), stepInstance.id])
                redirect stepInstance
            }
            '*' { respond stepInstance, [status: CREATED] }
        }
    }

    def edit(Step stepInstance) {
        respond stepInstance
    }

    @Transactional
    def update(Step stepInstance) {
        if (stepInstance == null) {
            notFound()
            return
        }

        if (stepInstance.hasErrors()) {
            respond stepInstance.errors, view: 'edit'
            return
        }

        stepInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Step.label', default: 'Step'), stepInstance.id])
                redirect stepInstance
            }
            '*' { respond stepInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Step stepInstance) {

        if (stepInstance == null) {
            notFound()
            return
        }

        stepInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Step.label', default: 'Step'), stepInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'step.label', default: 'Step'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

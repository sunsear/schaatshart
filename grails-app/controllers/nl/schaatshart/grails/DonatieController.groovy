package nl.schaatshart.grails


class DonatieController {

    static allowedMethods = [save: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [donatieInstanceList: Donatie.list(params), donatieInstanceTotal: Donatie.count()]
    }

    def create() {
        [donatieInstance: new Donatie(params)]
    }

    def save() {
        def donatieInstance = new Donatie(params)
        if (!donatieInstance.save(flush: true)) {
            render(view: "create", model: [donatieInstance: donatieInstance])
            return
        }
		EmailService.sendEmail('martin@van-dijken.eu',"Een nieuwe donatie per km ontvangen","'${donatieInstance.name}','${donatieInstance.anoniem}','${donatieInstance.amountPerKm}','${donatieInstance.email}','${donatieInstance.phone}'")

        flash.message = message(code: 'default.created.message', args: [message(code: 'donatie.label', default: 'Donatie'), donatieInstance.id])
		flash.donatieId=donatieInstance.id
        redirect(action: "show")
    }

    def show() {
        def donatieInstance = Donatie.get(flash.donatieId)
        if (!donatieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'donatie.label', default: 'Donatie'), 0])
            redirect(action: "list")
            return
        }

        [donatieInstance: donatieInstance]
    }
}
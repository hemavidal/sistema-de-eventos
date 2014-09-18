package com.igreja.se



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InscricaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Inscricao.list(params), model:[inscricaoInstanceCount: Inscricao.count()]
    }

    def show(Inscricao inscricaoInstance) {
        respond inscricaoInstance
    }

    def create() {
        respond new Inscricao(params), model:[pessoaInstance: new Pessoa()]
    }

    @Transactional
    def save(Inscricao inscricaoInstance) {
        if (inscricaoInstance == null) {
            notFound()
            return
        }

        if (inscricaoInstance.hasErrors()) {
            respond inscricaoInstance.errors, view:'create'
            return
        }

        inscricaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'inscricao.label', default: 'Inscricao'), inscricaoInstance.id])
                redirect inscricaoInstance
            }
            '*' { respond inscricaoInstance, [status: CREATED] }
        }
    }

    def edit(Inscricao inscricaoInstance) {
        respond inscricaoInstance
    }

    @Transactional
    def update(Inscricao inscricaoInstance) {
        if (inscricaoInstance == null) {
            notFound()
            return
        }

        if (inscricaoInstance.hasErrors()) {
            respond inscricaoInstance.errors, view:'edit'
            return
        }

        inscricaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Inscricao.label', default: 'Inscricao'), inscricaoInstance.id])
                redirect inscricaoInstance
            }
            '*'{ respond inscricaoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Inscricao inscricaoInstance) {

        if (inscricaoInstance == null) {
            notFound()
            return
        }

        inscricaoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Inscricao.label', default: 'Inscricao'), inscricaoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'inscricao.label', default: 'Inscricao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

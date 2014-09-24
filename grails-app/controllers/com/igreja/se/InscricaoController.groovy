package com.igreja.se



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

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
        respond new Inscricao(params)
    }

    @Transactional
    def save(Inscricao inscricaoInstance) {
		println "params: $params"
		def f = request.getFile('comprovante.file')
		if (f.empty) {
			flash.message = 'file cannot be empty'
			render(view: 'create')
			return
		}
		println f.properties
		response.sendError(200, 'Done')
		
		if (inscricaoInstance == null) {
            notFound()
            return
        }
		if (inscricaoInstance.pessoa.hasErrors()) {
			respond pessoa.errors, view:'create'
			return
		}
		
		inscricaoInstance.pessoa.save flush:true
		
		if (!inscricaoInstance.validate(["pessoa"])) {
			inscricaoInstance.erros.each {
//				println it
			}
		}
		
		inscricaoInstance.comprovante.save flush:true
		
        inscricaoInstance.save flush:true
		
		
		Evento evento = Evento.findById(params.evento)
		
		if (!evento) {
			render "Error"
			return
		}
		
		evento.addToInscricoes(inscricaoInstance)
		
		evento.save flush:true

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

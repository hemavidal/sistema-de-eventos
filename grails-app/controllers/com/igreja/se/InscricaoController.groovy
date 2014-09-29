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
//		println "params: $params"
		def comprovante = request.getFile('comprovante.file')
		if (comprovante.empty) {
			flash.message = 'file cannot be empty'
			render(view: 'create')
			return
		}
		
		inscricaoInstance.comprovante.nome = comprovante.getOriginalFilename()
		
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
		
        inscricaoInstance.save flush:true
		
		Evento evento = Evento.findById(params.evento)
		
		if (!evento) {
			flash.message = message(code:'default.invalid.message', args:[message(code:'evento.label', default:'Evento')])
			return
		}
		
		evento.addToInscricoes(inscricaoInstance)
		
		evento.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'inscricao.label', default: 'Inscricao'), inscricaoInstance.id])
				flash.type = "alert-success"
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
	
	def displayGraph = {
		def img = Inscricao.findById(params.id).comprovante.file // byte array
		//...
//		response.setHeader('Content-length', img.length)
		response.contentType = 'image/jpg' // or the appropriate image content type
		response.outputStream << img
		response.outputStream.flush()
	}
}

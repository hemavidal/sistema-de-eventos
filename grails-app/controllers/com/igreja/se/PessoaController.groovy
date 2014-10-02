package com.igreja.se



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PessoaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pessoa.list(params), model:[pessoaInstanceCount: Pessoa.count()]
    }

    def show(Pessoa pessoaInstance) {
        respond pessoaInstance
    }

    def create() {
        respond new Pessoa(params)
    }

    @Transactional
    def save(Pessoa pessoaInstance) {
		println "Entrou"
		if (pessoaInstance == null) {
            notFound()
            return
        }

        if (pessoaInstance.hasErrors()) {
            respond pessoaInstance.errors, view:'create'
            return
        }

		if ('M'.equals(inscricaoInstance.pessoa.sexo.getAt(0).toUpperCase())) {
			inscricaoInstance.pessoa.sexo = 'M'
		} else {
			inscricaoInstance.pessoa.sexo = 'F'
		}
		
        pessoaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), pessoaInstance.id])
                redirect pessoaInstance
            }
            '*' { respond pessoaInstance, [status: CREATED] }
        }
    }

    def edit(Pessoa pessoaInstance) {
        respond pessoaInstance
    }

    @Transactional
    def update(Pessoa pessoaInstance) {
        if (pessoaInstance == null) {
            notFound()
            return
        }

        if (pessoaInstance.hasErrors()) {
            respond pessoaInstance.errors, view:'edit'
            return
        }

		if ('M'.equals(inscricaoInstance.pessoa.sexo.getAt(0).toUpperCase())) {
			inscricaoInstance.pessoa.sexo = 'M'
		} else {
			inscricaoInstance.pessoa.sexo = 'F'
		}
		
        pessoaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pessoa.label', default: 'Pessoa'), pessoaInstance.id])
                redirect pessoaInstance
            }
            '*'{ respond pessoaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Pessoa pessoaInstance) {

        if (pessoaInstance == null) {
            notFound()
            return
        }

        pessoaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pessoa.label', default: 'Pessoa'), pessoaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def displayGraph = {
		def img = Pessoa.findById(params.id).foto.file // byte array
		println img
		//...
//		response.setHeader('Content-length', img.length)
		response.contentType = 'image/jpg' // or the appropriate image content type
		response.outputStream << img
		response.outputStream.flush()
	}
}

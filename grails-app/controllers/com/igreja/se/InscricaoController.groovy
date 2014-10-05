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
		if (params['pessoa.foto.file']) {
        	def foto = request.getFile('pessoa.foto.file')
   			inscricaoInstance.pessoa.foto.nome = foto.getOriginalFilename()
			
		}
		
		if (!params['comprovante.file']) {
			flash.type = 'alert-danger'
			flash.message = 'O envio do comprovante é obrigatório.'
			return
		}
		
		def comprovante = request.getFile('comprovante.file')
		
		if (comprovante.empty) {
			flash.message = 'O envio do comprovante é obrigatório.'
			flash.type = 'alert-danger'
			render(view: 'create')
			return
		}
		
		inscricaoInstance.comprovante.nome = comprovante.getOriginalFilename()
		
		if (inscricaoInstance == null) {
            notFound()
            return
        }
		if (inscricaoInstance.pessoa.hasErrors()) {
			respond inscricaoInstance.pessoa.errors, view:'create'
			return
		}
		
		if (inscricaoInstance.hasErrors()) {
			flash.type = 'alert-danger'
			respond inscricaoInstance.errors, view:'create'
			return
		}
		
		inscricaoInstance.pessoa.foto.save flush:true
		inscricaoInstance.pessoa.save flush:true
		inscricaoInstance.comprovante.save flush:true
		inscricaoInstance.save flush:true
		
		Evento evento = Evento.findById(params.evento)
		
		if (!evento) {
			flash.message = "Inscrição não efetuada devido a um problema de caminho de URL! \n Tente Novamente"
			flash.type = "alert-danger"
			return
		}
		
		evento.addToInscricoes(inscricaoInstance)
		
		evento.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Inscrição evetuada com sucesso!"
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
    def update(Inscricao inscricaoInstance, Pessoa pessoa) {
//		println "pessoa.properties: (id:$pessoa.id) $pessoa.properties"
		if (params['pessoa.foto.file']) {
			println params['pessoa.foto.file']
        	def foto = request.getFile('pessoa.foto.file')
   			pessoa?.foto?.nome = foto.getOriginalFilename()
			pessoa?.foto?.save flush:true
		}
		
		if (params['comprovante.file']) {
			def comprovante = request.getFile('comprovante.file')
			
			if (comprovante.empty) {
				flash.message = 'O envio do comprovante é obrigatório.'
				flash.type = 'alert-danger'
				return
			}
			inscricaoInstance.comprovante.nome = comprovante.getOriginalFilename()
			inscricaoInstance?.comprovante?.save flush:true
		}
		
		if (inscricaoInstance == null) {
            notFound()
            return
        }
		if (pessoa.hasErrors()) {
			flash.type = 'alert-danger'
			flash.message = "Erro de validação da pessoa!"
			println pessoa.errors.properties
			respond pessoa.errors, view:'edit'
			return
		}
		
		if (inscricaoInstance.hasErrors()) {
			flash.type = 'alert-danger'
			flash.message = "Erro de validação da inscricao!"
			respond inscricaoInstance.errors, view:'edit'
			return
		}
		
		pessoa.save flush:true
		inscricaoInstance.save flush:true
        
        request.withFormat {
            form multipartForm {
				flash.type = 'alert-success'
                flash.message = "Inscrição Alterada!"
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
	
	def confirmarInscricao(Inscricao inscricaoInstance) {
		inscricaoInstance.isConfirmada = true
		Evento evento = inscricaoInstance.evento
		sendMail {
			to inscricaoInstance.pessoa.email
			subject "[Sistema de Eventos] Confirmação de Inscrição no evento '${evento.nome}'"
			body "Olá ${inscricaoInstance.pessoa.nome} sua inscrição no evento '${evento.nome}'\
                     foi confirmada!\
					 Nos veremos lá no ${evento.nome}.\
					 OBS: Email informativo, favor não responder."
		}
		flash.type = 'alert-success'
		flash.message = "Inscrição confirmada com sucesso! Um email de confirmação foi enviado para '${inscricaoInstance.pessoa.email}'"
		redirect(controller:'evento', action:'show', id: evento.id)
	}
}

package com.igreja.se



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional()
class InscricaoController {

	def fileUploadService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

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
		if (!params['comprovante.file']) {
			flash.type = 'alert-danger'
			flash.message = 'O envio do comprovante é obrigatório.'
			redirect action:'edit'
			return
		}
		
		def comprovante = request.getFile('comprovante.file')
		
		if (comprovante.empty) {
			flash.message = 'O envio do comprovante é obrigatório.'
			flash.type = 'alert-danger'
			render(view: 'create')
			return
		}
		
		if (!fileUploadService.isImage(comprovante.getOriginalFilename())) {
			flash.message = "O comprovante precisa ser uma imagem('.tif','.png','.gif','.tiff', '.jpg', 'jpeg','.bmp')"
			flash.type = 'alert-danger'
			respond inscricaoInstance, view:'edit'
			return
		}
		
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
		
		inscricaoInstance.pessoa.save flush:true
		inscricaoInstance.save flush:true
		
		Evento evento = Evento.findById(params.evento)
		
		if (!evento) {
			flash.message = "Evento não identificado! \n Tente Novamente"
			flash.type = "alert-danger"
			return
		}
		
		evento.addToInscricoes(inscricaoInstance)
		
		evento.save flush:true
		
		
		String comprovanteName = inscricaoInstance.pessoa.email +
		'_inscricao' + inscricaoInstance.id +
		'_evento' + inscricaoInstance.evento.id + fileUploadService.getExtensao(comprovante.getOriginalFilename());
	
		fileUploadService.uploadFile(comprovante, comprovanteName, '/comprovantes/')
		
		inscricaoInstance.comprovante = comprovanteName
		inscricaoInstance.save flush:true
		
        request.withFormat {
            form multipartForm {
                flash.message = "Inscrição evetuada com sucesso! Espere o email de confirmação!"
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
		if (params['comprovante.file'].bytes.size() != 0) {
			def comprovante = request.getFile('comprovante.file')
			
			if (comprovante.empty) {
				flash.message = 'O envio do comprovante é obrigatório.'
				flash.type = 'alert-danger'
				respond inscricaoInstance, view:'edit'
				return
			}
			
			if (!fileUploadService.isImage(comprovante.getOriginalFilename())) {
				flash.message = "O comprovante precisa ser uma imagem('.tif','.png','.gif','.tiff', '.jpg', 'jpeg','.bmp')"
				flash.type = 'alert-danger'
				respond inscricaoInstance, view:'edit'
				return
			}
			
			//Delete old file
			new File('/comprovantes/' + inscricaoInstance.comprovante).delete()
			
			String comprovanteName = inscricaoInstance.pessoa.email +
				'_inscricao' + inscricaoInstance.id +
				'_evento' + inscricaoInstance.evento.id + fileUploadService.getExtensao(comprovante.getOriginalFilename());

			fileUploadService.uploadFile(comprovante, comprovanteName, '/comprovantes/')
			
			inscricaoInstance.comprovante = comprovanteName
		}
		
		
		if (inscricaoInstance == null) {
            notFound()
            return
        }
		
		if (inscricaoInstance.pessoa.hasErrors()) {
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
		
		inscricaoInstance.pessoa.save flush:true
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
		
		//Delete old file
		new File('/comprovantes/' + inscricaoInstance.comprovante).delete()
		
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
	
	def uploadFoto(Inscricao inscricaoInstance) {
		def file = request.getFile('pessoa.foto.file')
		
		if (file.empty) {
			flash.type = 'alert-warning'
			flash.message = 'Escolha uma foto!'
			redirect action:'edit', id:inscricaoInstance.id
			return
		}
		flash.type = 'alert-warning'
		flash.message = 'A foto foi enviada!'
		redirect action:'edit', id:inscricaoInstance.id
		
	}
	
	def confirmarInscricao(Inscricao inscricaoInstance) {
		inscricaoInstance.isConfirmada = true
		Evento evento = inscricaoInstance.evento
		sendMail {
			to inscricaoInstance.pessoa.email
			subject "[Sistema de Eventos] Confirmação de Inscrição no evento '${evento.nome}'"
			html "<p>Olá ${inscricaoInstance.pessoa.nome} sua inscrição no evento '${evento.nome}' foi confirmada! Nos veremos lá no ${evento.nome}.</p>"
		}
		flash.type = 'alert-success'
		flash.message = "Inscrição confirmada com sucesso! Um email de confirmação foi enviado para '${inscricaoInstance.pessoa.email}'"
		redirect(controller:'evento', action:'show', id: evento.id)
	}
}

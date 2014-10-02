package com.igreja.se.filtros

import com.igreja.se.Evento;
import com.igreja.se.Usuario;

class InscricaoFilters {

	def dependsOn = [LoginAccessFilters]
	
    def filters = {
        inscricaoFeitaDepoisDoFimDasInscricoes(controller:'inscricao', action:'create|save') {
            before = {
				Evento evento
				if (!params.evento) {
					flash.message = "Inscrição não efetuada devido a um problema de caminho de URL! \n Tente Novamente"
					flash.type = "alert-danger"
					redirect(controller:"evento", action:"index")
					return false
				}
				
				evento = Evento.findById(params.evento)
				
				if (!evento) {
					flash.message = "Inscrição não efetuada devido a um problema de caminho de URL! \n Tente Novamente"
					flash.type = "alert-danger"
					redirect(controller:"evento", action:"index")
					return false
				}
				
				if (new Date() > evento.fimDasInscricoes) {
					flash.message = "Inscrição não efetuada devido ao termino das inscricões(${evento.fimDasInscricoes.format('dd/MM/yyyy - HH:mm')})"
					flash.type = "alert-danger"
					redirect(controller:"evento", action:"index")
					return false
				}
            }
        }
		
		limiteDeinscricoesExcedido(controller:'inscricao', action:'create|save') {
			before = {
				Evento evento
				if (!params.evento) {
					flash.message = "Inscrição não efetuada devido a um problema de caminho de URL! \n Tente Novamente"
					flash.type = "alert-danger"
					redirect(controller:"evento", action:"index")
					return false
				}
				
				evento = Evento.findById(params.evento)
				
				if (!evento) {
					flash.message = "Inscrição não efetuada devido a um problema de caminho de URL! \n Tente Novamente"
					flash.type = "alert-danger"
					redirect(controller:"evento", action:"index")
					return false
				}
				
				if (Inscricoes.findAllByLocalidadeIgreja(params.localidadeIgreja).size()) {
					
				}
				
			}
		}
		
		acessoDeUsuarios(controller:'inscricao', action:'delete') {
			before = {
				Usuario usuario = session.usuario
				if (!'admin'.equals(usuario.tipo)) {
					redirect(controller:'evento', action:'index')
					return false
				}
			}
		}
    }
	
}
